//
//  CharacteristicBarometricPressureTrend.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/12/17.
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

/// BLE Barometric Pressure Trend Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicBarometricPressureTrend: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Barometric Pressure Trend"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2AA3"
    }

    /// Barometric Pressure Trends
    public enum BarometricPressureTrend: UInt8 {
        /// Unknown
        case unknown                            = 0
        /// Continuously falling
        case continuouslyFalling                = 1
        /// Continuously rising
        case continuouslyRising                 = 2
        /// Falling, then steady
        case fallingThenSteady                  = 3
        /// Rising, then steady
        case risingThenSteady                   = 4
        /// Falling before a lesser rise
        case fallingBeforeLesserRise            = 5
        /// Falling before a greater rise
        case fallingBeforeGreaterRise           = 6
        /// Rising before a greater fall
        case risingBeforeGreaterFall            = 7
        /// Rising before a lesser fall
        case risingBeforeLesserFall             = 8
        /// Steady
        case steady                             = 9
    }

    /// Pressure Trend
    private(set) public var trend: BarometricPressureTrend

    /// Creates Barometric Pressure Trend Characteristic
    ///
    /// - Parameter trend: Barometric Pressure Trend
    public init(trend: BarometricPressureTrend) {
        self.trend = trend

        super.init(name: CharacteristicBarometricPressureTrend.name,
                   uuidString: CharacteristicBarometricPressureTrend.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicBarometricPressureTrend {
        var decoder = DecodeData()

        let trend = BarometricPressureTrend(rawValue: decoder.decodeUInt8(data)) ?? .unknown

        return CharacteristicBarometricPressureTrend(trend: trend)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(trend.rawValue)
        
        return msgData
    }
}
