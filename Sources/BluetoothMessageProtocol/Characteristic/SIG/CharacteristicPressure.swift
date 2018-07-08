//
//  CharacteristicPressure.swift
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

/// BLE Pressure Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicPressure: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Pressure"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A6D"
    }

    /// Pressure
    private(set) public var pressure: Measurement<UnitPressure>

    /// Creates Pressure Characteristic
    ///
    /// - Parameter pressure: Pressure
    public init(pressure: Measurement<UnitPressure>) {
        self.pressure = pressure

        super.init(name: CharacteristicPressure.name,
                   uuidString: CharacteristicPressure.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicPressure {
        var decoder = DecodeData()

        // put into 0.1 PA then into KiloPascals
        let value = decoder.decodeUInt32(data).resolution(0.0001)

        let pressure: Measurement = Measurement(value: value, unit: UnitPressure.kilopascals)

        return CharacteristicPressure(pressure: pressure)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        //Make sure we put this back to back before we create Data
        let value = pressure.converted(to: UnitPressure.kilopascals).value

        let pressV = UInt32(value.resolution(1 / 0.0001))

        msgData.append(Data(from: pressV.littleEndian))

        return msgData
    }
}

