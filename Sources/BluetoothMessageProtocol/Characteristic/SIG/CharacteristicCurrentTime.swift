//
//  CharacteristicCurrentTime.swift
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

/// BLE Current Time Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicCurrentTime: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Current Time"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A2B"
    }

    /// Adjustment Reasons
    public struct AdjustReasons: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }

        /// Manual time update
        public static let manualTimeUpdate              = AdjustReasons(rawValue: 1 << 0)
        /// External reference time update
        public static let externalReferenceTimeUpdate   = AdjustReasons(rawValue: 1 << 1)
        /// Change of time zone
        public static let changeOfTimeZone              = AdjustReasons(rawValue: 1 << 2)
        /// Change of DST (daylight savings time)
        public static let changeofDaylightSavings       = AdjustReasons(rawValue: 1 << 3)
    }

    /// Current Time Adjust Reason
    private(set) public var adjustmentReason: AdjustReasons

    /// Time
    private(set) public var currentTime: DateTime

    /// Day of the Week
    private(set) public var dayOfWeek: DayOfWeek

    /// Fractional Seconds
    private(set) public var fractionalSeconds: Float

    /// Creates Current Time Characteristic
    ///
    /// - Parameters:
    ///   - adjustmentReason: Current Time Adjust Reason
    ///   - currentTime: Time
    ///   - dayOfWeek: Day of the Week
    ///   - fractionalSeconds: Fractional Seconds
    public init(adjustmentReason: AdjustReasons,
                currentTime: DateTime,
                dayOfWeek: DayOfWeek,
                fractionalSeconds: Float) {

        self.adjustmentReason = adjustmentReason
        self.currentTime = currentTime
        self.dayOfWeek = dayOfWeek
        self.fractionalSeconds = fractionalSeconds

        super.init(name: CharacteristicCurrentTime.name,
                   uuidString: CharacteristicCurrentTime.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicCurrentTime {
        var decoder = DecodeData()

        let currenTime = try DateTime.decode(data, decoder: &decoder)

        let weekday = DayOfWeek(rawValue: decoder.decodeUInt8(data)) ?? .unknown

        let fractions = Float(decoder.decodeUInt8(data)) * ( 1 / 256)

        let reasons = AdjustReasons(rawValue: decoder.decodeUInt8(data))

        return CharacteristicCurrentTime(adjustmentReason: reasons,
                                         currentTime: currenTime,
                                         dayOfWeek: weekday,
                                         fractionalSeconds: fractions)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        let dateTimeData = try currentTime.encode()
        msgData.append(dateTimeData)

        msgData.append(dayOfWeek.rawValue)

        let frac = UInt8(fractionalSeconds * 256)
        msgData.append(frac)

        msgData.append(adjustmentReason.rawValue)

        return msgData
    }
}
