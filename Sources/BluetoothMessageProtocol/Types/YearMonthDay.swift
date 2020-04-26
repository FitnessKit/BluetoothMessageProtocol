//
//  YearMonthDay.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 4/26/20.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation
import DataDecoder

/// Bluetooth Year Month Day
public struct YearMonthDay: Hashable {
    
    /// Year
    ///
    /// Year as defined by the Gregorian calendar. Valid between 1582 and 9999
    private(set) public var year: UInt16?
    
    /// Month
    ///
    /// Month of the year as defined by the Gregorian calendar
    private(set) public var month: Month
    
    /// Day of Month
    ///
    /// Day of the month as defined by the Gregorian calendar
    private(set) public var day: UInt8?
    
    /// Create Bluetooth Date Time Type
    ///
    /// - Parameters:
    ///   - year: Year
    ///   - month: Month
    ///   - day: Day
    public init(year: UInt16?, month: Month, day: UInt8?) {
        self.year = year
        self.month = month
        self.day = day
    }
    
    /// Creates a YearMonthDay Object from the current date
    ///
    /// Dates are represented in the Gregorian Calendar using current timezone
    public static var fromCurrentDate: YearMonthDay {
        return YearMonthDay(Date())
    }
    
    private init(_ comps: DateComponents) {
        self = YearMonthDay(year: UInt16(comps.year ?? 2000),
                            month: Month(rawValue: UInt8(comps.month ?? 1)) ?? Month.january,
                            day: UInt8(comps.day ?? 1))
    }
    
    /// Create Bluetooth Year Month Day
    ///
    /// - Parameters:
    ///   - from: Date
    ///   - calendar: Calendar used for Date
    public init(_ from: Date, calendar: Calendar = Calendar(identifier: .gregorian)) {
        
        let comps = calendar.dateComponents([.year, .month, .day],
                                            from: from)
        
        self = YearMonthDay(comps)
    }
}

public extension YearMonthDay {
    
    internal static func decode(_ data: Data, decoder: inout DecodeData) -> YearMonthDay {
        var year: UInt16?
        
        let yr = decoder.decodeUInt16(data)
        if kBluetoothYearBounds.contains(Int(yr)) {
            year = yr
        }
        
        let month = Month(rawValue: decoder.decodeUInt8(data)) ?? .unknown
        
        var dayOfMonth: UInt8?
        let day = decoder.decodeUInt8(data)
        if kBluetoothDayOfMonthBounds.contains(Int(day)) {
            dayOfMonth = day
        }
        
        return YearMonthDay(year: year,
                            month: month,
                            day: dayOfMonth)
    }
    
    /// Decode YearMonthDay
    ///
    /// - Parameter data: YearMonthDay Data
    /// - Returns: YearMonthDay Instance
    /// - Throws: BluetoothDecodeError
    static func decode(data: Data) -> YearMonthDay {
        
        var decoder = DecodeData()
        
        return decode(data, decoder: &decoder)
    }
    
}

extension YearMonthDay: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: YearMonthDay, rhs: YearMonthDay) -> Bool {
        return lhs.year == rhs.year
            && lhs.month.rawValue == rhs.month.rawValue
            && lhs.day == rhs.day
    }
}

extension YearMonthDay: BluetoothEncodable {
    
    /// Encodes Object into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        if let yr = year {
            guard kBluetoothYearBounds.contains(Int(yr)) else {
                return.failure(BluetoothEncodeError.boundsError(title: "Year must be between",
                                                                range: kBluetoothYearBounds))
            }
            
            msgData.append(Data(from: yr.littleEndian))
        } else {
            let noYear: UInt16 = 0
            msgData.append(Data(from: noYear.littleEndian))
        }
        
        msgData.append(month.rawValue)
        
        if let dayOfMonth = day {
            guard kBluetoothDayOfMonthBounds.contains(Int(dayOfMonth)) else {
                return.failure(BluetoothEncodeError.boundsError(title: "Day must be between",
                                                                range: kBluetoothDayOfMonthBounds))
            }

            msgData.append(dayOfMonth)
        } else {
            let noDay: UInt8 = 0
            msgData.append(noDay)
        }

        return.success(msgData)
    }
}
