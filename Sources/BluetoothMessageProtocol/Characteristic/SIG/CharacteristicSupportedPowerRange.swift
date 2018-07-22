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
/// The Supported Power Range characteristic is used to send the supported power
/// range as well as the minimum power increment supported by the Server
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicSupportedPowerRange: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Supported Power Range"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2AD8"
    }

    /// Minimum Power
    private(set) public var minimum: FitnessMachinePowerType

    /// Maximum Power
    private(set) public var maximum: FitnessMachinePowerType

    /// Minimum Increment
    private(set) public var minimumIncrement: Measurement<UnitPower>

    /// Creates Supported Power Range Characteristic
    ///
    /// - Parameters:
    ///   - minimum: Minimum Power
    ///   - maximum: Maximum Power
    ///   - minimumIncrement: Minimum Increment
    public init(minimum: FitnessMachinePowerType,
                maximum: FitnessMachinePowerType,
                minimumIncrement: Measurement<UnitPower>) {

        self.minimum = minimum
        self.maximum = maximum
        self.minimumIncrement = minimumIncrement

        super.init(name: CharacteristicSupportedPowerRange.name,
                   uuidString: CharacteristicSupportedPowerRange.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicSupportedPowerRange {
        var decoder = DecodeData()

        let minimum = FitnessMachinePowerType.create(decoder.decodeInt16(data))
        let maximum = FitnessMachinePowerType.create(decoder.decodeInt16(data))

        let incrValue = Double(decoder.decodeUInt16(data))
        let minimumIncrement = Measurement(value: incrValue, unit: UnitPower.watts)

        return CharacteristicSupportedPowerRange(minimum: minimum,
                                                 maximum: maximum,
                                                 minimumIncrement: minimumIncrement)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        let minValue = try minimum.encode()
        let maxValue = try maximum.encode()
        let incrValue = UInt16(minimumIncrement.converted(to: UnitPower.watts).value)

        msgData.append(minValue)
        msgData.append(maxValue)
        msgData.append(Data(from: incrValue.littleEndian))

        return msgData
    }
}
