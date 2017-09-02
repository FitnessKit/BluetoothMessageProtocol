//
//  CharacteristicSupportedPowerRange.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/20/17.
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

/// BLE Supported Power Range Characteristic
///
/// The Supported Power Range characteristic is used to send the supported power range as well as the minimum power increment supported by the Server
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicSupportedPowerRange: Characteristic {

    public static var name: String {
        return "Supported Power Range"
    }

    public static var uuidString: String {
        return "0x2AD8"
    }

    /// Minimum Power
    private(set) public var minimum: Measurement<UnitPower>

    /// Maximum Power
    private(set) public var maximum: Measurement<UnitPower>

    /// Minimum Increment
    private(set) public var minimumIncrement: Measurement<UnitPower>


    public init(minimum: Measurement<UnitPower>, maximum: Measurement<UnitPower>, minimumIncrement: Measurement<UnitPower>) {

        self.minimum = minimum
        self.maximum = maximum
        self.minimumIncrement = minimumIncrement

        super.init(name: CharacteristicSupportedPowerRange.name, uuidString: CharacteristicSupportedPowerRange.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicSupportedPowerRange {

        var decoder = DataDecoder(data)

        let minValue = Double(decoder.decodeInt16())
        let minimum = Measurement(value: minValue, unit: UnitPower.watts)

        let maxValue = Double(decoder.decodeInt16())
        let maximum = Measurement(value: maxValue, unit: UnitPower.watts)

        let incrValue = Double(decoder.decodeUInt16())
        let minimumIncrement = Measurement(value: incrValue, unit: UnitPower.watts)

        return CharacteristicSupportedPowerRange(minimum: minimum, maximum: maximum, minimumIncrement: minimumIncrement)
    }

    open override func encode() throws -> Data {
        var msgData = Data()

        let minValue = minimum.converted(to: UnitPower.watts).value
        let maxValue = maximum.converted(to: UnitPower.watts).value
        let incrValue = UInt16(minimumIncrement.converted(to: UnitPower.watts).value)

        msgData.append(Data(from: Int16(minValue).littleEndian))
        msgData.append(Data(from: Int16(maxValue).littleEndian))
        msgData.append(Data(from: incrValue.littleEndian))

        return msgData
    }
}
