//
//  CharacteristicV02Max.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/26/17.
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

/// BLE VO2 Max Characteristic
///
/// Maximal Oxygen uptake of a user
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicV02Max: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "VO2 Max"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A96"
    }

    /// VO2 Max
    private(set) public var maxVO2: Measurement<UnitOxygenConsumption>

    /// Creates VO2 Max Characteristic
    ///
    /// - Parameter maxVO2: VO2 Max
    public init(maxVO2: Measurement<UnitOxygenConsumption>) {
        self.maxVO2 = maxVO2

        super.init(name: CharacteristicV02Max.name,
                   uuidString: CharacteristicV02Max.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicV02Max {
        var decoder = DecodeData()

        let value = Double(decoder.decodeUInt8(data))

        let consumption = Measurement(value: value, unit: UnitOxygenConsumption.consumption)

        return CharacteristicV02Max(maxVO2: consumption)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {

        guard kMaxVO2Bounds.contains(Int(maxVO2.value)) else {
            throw BluetoothMessageProtocolError.boundsError(title: "Max VO2 must be between",
                                                            range: kMaxVO2Bounds)
        }

        var msgData = Data()

        let value = UInt8(maxVO2.value)

        msgData.append(value)

        return msgData
    }
}
