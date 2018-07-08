//
//  CharacteristicWeight.swift
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

/// BLE Weight Characteristic
///
/// Weight of the User
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicWeight: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Weight"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A98"
    }

    /// Weight
    private(set) public var weight: Measurement<UnitMass>

    /// Creates Weight Characteristic
    ///
    /// - Parameter weight: Weight
    public init(weight: Measurement<UnitMass>) {
        self.weight = weight

        super.init(name: CharacteristicWeight.name,
                   uuidString: CharacteristicWeight.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicWeight {
        var decoder = DecodeData()

        let value = decoder.decodeUInt16(data).resolution(0.005)

        let weight = Measurement(value: value, unit: UnitMass.kilograms)

        return CharacteristicWeight(weight: weight)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        //Make sure we put this back to KG before we create Data
        let value = UInt16(weight.converted(to: UnitMass.kilograms).value.resolution((1 / 0.005)))

        msgData.append(Data(from: value))

        return msgData
    }
}
