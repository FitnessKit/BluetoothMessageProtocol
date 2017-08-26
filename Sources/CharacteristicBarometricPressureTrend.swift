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
///
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicBarometricPressureTrend: Characteristic {

    public static var name: String {
        return "Barometric Pressure Trend"
    }

    public static var uuidString: String {
        return "2AA3"
    }

    /// Barometric Pressure Trends
    public enum BarometricPressureTrend: UInt8 {
        case unknown                            = 0
        case continuouslyFalling                = 1
        case continuouslyRising                 = 2
        case fallingThenSteady                  = 3
        case risingThenSteady                   = 4
        case fallingBeforeLesserRise            = 5
        case fallingBeforeGreaterRise           = 6
        case risingBeforeGreaterFall            = 7
        case risingBeforeLesserFall             = 8
        case steady                             = 9
    }

    /// Pressure Trend
    private(set) public var trend: BarometricPressureTrend

    public init(trend: BarometricPressureTrend) {

        self.trend = trend

        super.init(name: CharacteristicBarometricPressureTrend.name, uuidString: CharacteristicBarometricPressureTrend.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicBarometricPressureTrend {

        var decoder = DataDecoder(data)

        let trend = BarometricPressureTrend(rawValue: decoder.decodeUInt8()) ?? .unknown

        return CharacteristicBarometricPressureTrend(trend: trend)
    }

    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(trend.rawValue)
        
        return msgData
    }
}
