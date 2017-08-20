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
import FitnessUnits



/// Daylight Savings Time Offset
public enum DSTOffset: UInt8 {
    /// Standard Time
    case standardTime           = 0
    // Half An Hour Daylight Time (+0.5h)
    case halfHourDaylightTime   = 2
    /// Daylight Time (+1h)
    case daylightTime           = 4
    /// Double Daylight Time (+2h))
    case doubleDaylightTime     = 8
    // Unknown
    case unknown                = 255
}


/// Bluetooth Days of the Week
public enum DayOfWeek: UInt8 {
    /// Unknown
    case unknown        = 0
    /// Monday
    case monday         = 1
    /// Tuesday
    case tuesday        = 2
    /// Wednesday
    case wednesday      = 3
    /// Thursday
    case thursday       = 4
    /// Friday
    case friday         = 5
    /// Saturday
    case saturday       = 6
    /// Sunday
    case sunday         = 7
}

/// Bluetooth Months
public enum Month: UInt8 {
    case unknown        = 0
    case january        = 1
    case february       = 2
    case march          = 3
    case april          = 4
    case may            = 5
    case june           = 6
    case july           = 7
    case august         = 8
    case september      = 9
    case october        = 10
    case november       = 11
    case december       = 12
}


/// Bluetooth Date Time Type
public struct DateTime {

    /// Year
    ///
    /// Year as defined by the Gregorian calendar. Valid between 1582 and 9999
    fileprivate(set) public var year: UInt16?

    /// Month
    ///
    /// Month of the year as defined by the Gregorian calendar
    fileprivate(set) public var month: Month

    /// Day of Month
    ///
    /// Day of the month as defined by the Gregorian calendar
    fileprivate(set) public var day: UInt8?

    /// Hours
    ///
    /// Number of hours past midnight
    fileprivate(set) public var hours: UInt8

    /// Minutes
    ///
    /// Number of minutes since the start of the hour
    fileprivate(set) public var minutes: UInt8

    /// Seconds
    ///
    /// Number of seconds since the start of the minute
    fileprivate(set) public var seconds: UInt8

}

public extension DateTime {

    internal static func decode(decoder: inout DataDecoder) throws -> DateTime {
        
        var year: UInt16?

        let yr = decoder.decodeUInt16()
        if kBluetoothYearBounds.contains(Int(yr)) {
            year = yr
        }

        let month = Month(rawValue: decoder.decodeUInt8()) ?? .unknown

        var dayOfMonth: UInt8?
        let day = decoder.decodeUInt8()
        if kBluetoothDayOfMonthBounds.contains(Int(day)) {
            dayOfMonth = day
        }

        let hours = decoder.decodeUInt8()

        let minutes = decoder.decodeUInt8()

        let seconds = decoder.decodeUInt8()

        return DateTime(year: year, month: month, day: dayOfMonth, hours: hours, minutes: minutes, seconds: seconds)
    }

    public static func decode(data: Data) throws -> DateTime {

        var decoder = DataDecoder(data)

        return try decode(decoder: &decoder)
    }

}

public extension DateTime {

    public func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError.init(.unsupported)
    }

}
