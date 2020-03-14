//
//  CharacteristicDateOfBirth.swift
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
import FitnessUnits

/// BLE Date of Birth Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicDateOfBirth: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Date of Birth" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A85" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
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
    
    /// Creates Date of Birth Characteristic
    ///
    /// - Parameters:
    ///   - year: Year of Birth
    ///   - month: Month of Birth
    ///   - day: Day of Birth
    public init(year: UInt16?, month: Month, day: UInt8?) {
        self.year = year
        self.month = month
        self.day = day
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
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
        
        let char = CharacteristicDateOfBirth(year: year, month: month, day: dayOfMonth)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
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
            msgData.append(dayOfMonth)
        } else {
            let noDay: UInt8 = 0
            msgData.append(noDay)
        }
        
        return.success(msgData)
    }
}

extension CharacteristicDateOfBirth: Hashable {
    
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuidString)
        hasher.combine(year)
        hasher.combine(month)
        hasher.combine(day)
    }
}

extension CharacteristicDateOfBirth: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicDateOfBirth, rhs: CharacteristicDateOfBirth) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.year == rhs.year)
            && (lhs.month == rhs.month)
            && (lhs.day == rhs.day)
    }
}
