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
open class CharacteristicDateOfBirth: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Date of Birth"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A85"
    }

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

        super.init(name: CharacteristicDateOfBirth.name,
                   uuidString: CharacteristicDateOfBirth.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicDateOfBirth {
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

        return CharacteristicDateOfBirth(year: year, month: month, day: dayOfMonth)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        if let yr = year {

            guard kBluetoothYearBounds.contains(Int(yr)) else {
                throw BluetoothMessageProtocolError.boundsError(title: "Year must be between",
                                                                range: kBluetoothYearBounds)
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

        return msgData
    }
}
