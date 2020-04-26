//
//  DateTimeType.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/19/17.
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

/// Bluetooth Date Time Type
public struct DateTime: Hashable {
    
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
    
    /// Hours
    ///
    /// Number of hours past midnight
    private(set) public var hours: UInt8
    
    /// Minutes
    ///
    /// Number of minutes since the start of the hour
    private(set) public var minutes: UInt8
    
    /// Seconds
    ///
    /// Number of seconds since the start of the minute
    private(set) public var seconds: UInt8
    
    /// Create Bluetooth Date Time Type
    ///
    /// - Parameters:
    ///   - year: Year
    ///   - month: Month
    ///   - day: Day
    ///   - hours: Hour
    ///   - minutes: Minutes
    ///   - seconds: Seconds
    public init(year: UInt16?, month: Month, day: UInt8?, hours: UInt8, minutes: UInt8, seconds: UInt8) {
        self.year = year
        self.month = month
        self.day = day
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
    
    /// Creates a DateTime Object from the current date
    ///
    /// Dates are represented in the Gregorian Calendar using current timezone
    public static var fromCurrentDate: DateTime {
        return DateTime(Date())
    }
    
    private init(_ comps: DateComponents) {
        self = DateTime(year: UInt16(comps.year ?? 2000),
                        month: Month(rawValue: UInt8(comps.month ?? 1)) ?? Month.january,
                        day: UInt8(comps.day ?? 1),
                        hours: UInt8(comps.hour ?? 0),
                        minutes: UInt8(comps.minute ?? 0),
                        seconds: UInt8(comps.second ?? 0))
    }
    
    /// Create Bluetooth Date Time Type
    ///
    /// - Parameters:
    ///   - from: Date
    ///   - calendar: Calendar used for Date
    public init(_ from: Date, calendar: Calendar = Calendar(identifier: .gregorian)) {
        
        let comps = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second],
                                            from: from)
        
        self = DateTime(comps)
    }
}

public extension DateTime {
    
    internal static func decode(_ data: Data, decoder: inout DecodeData) -> DateTime {
        let yearMonthDay = YearMonthDay.decode(data, decoder: &decoder)
        
        let hours = decoder.decodeUInt8(data)
        
        let minutes = decoder.decodeUInt8(data)
        
        let seconds = decoder.decodeUInt8(data)
        
        return DateTime(year: yearMonthDay.year,
                        month: yearMonthDay.month,
                        day: yearMonthDay.day,
                        hours: hours,
                        minutes: minutes,
                        seconds: seconds)
    }
    
    /// Decode DateTime
    ///
    /// - Parameter data: DateTime Data
    /// - Returns: DateTime Instance
    /// - Throws: BluetoothDecodeError
    static func decode(data: Data) -> DateTime {
        
        var decoder = DecodeData()
        
        return decode(data, decoder: &decoder)
    }
    
}

extension DateTime: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: DateTime, rhs: DateTime) -> Bool {
        return lhs.year == rhs.year &&
            lhs.month.rawValue == rhs.month.rawValue &&
            lhs.day == rhs.day &&
            lhs.hours == rhs.hours &&
            lhs.minutes == rhs.minutes &&
            lhs.seconds == rhs.seconds
    }
}

extension DateTime: BluetoothEncodable {
    
    /// Encodes Object into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        guard let year = year else {
            return.failure(BluetoothEncodeError.missingProperties("Year can not be nil for encoding"))
        }
        
        guard kBluetoothYearBounds.contains(Int(year)) else {
            return.failure(BluetoothEncodeError.boundsError(title: "Year must be between",
                                                            range: kBluetoothYearBounds))
        }
        
        guard let day = day else {
            return.failure(BluetoothEncodeError.missingProperties("Day can not be nil for encoding"))
        }
        
        guard kBluetoothDayOfMonthBounds.contains(Int(day)) else {
            return.failure(BluetoothEncodeError.boundsError(title: "Day must be between",
                                                            range: kBluetoothDayOfMonthBounds))
        }
        
        msgData.append(Data(from: UInt16(year)))
        msgData.append(month.rawValue)
        msgData.append(day)
        msgData.append(hours)
        msgData.append(minutes)
        msgData.append(seconds)
        
        return.success(msgData)
    }
}
