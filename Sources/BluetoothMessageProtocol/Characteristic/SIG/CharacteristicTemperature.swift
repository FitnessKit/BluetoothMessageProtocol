//
//  CharacteristicTemperature.swift
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

/// BLE Temperature Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicTemperature: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Temperature"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A6E"
    }

    /// Temperature
    private(set) public var temperature: Measurement<UnitTemperature>

    /// Creates Temperature Characteristic
    ///
    /// - Parameter temperature: Temperature
    public init(temperature: Measurement<UnitTemperature>) {
        self.temperature = temperature

        super.init(name: CharacteristicTemperature.name,
                   uuidString: CharacteristicTemperature.uuidString)
    }

    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    open override class func decoder<C: CharacteristicTemperature>(data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let tmpValue = decoder.decodeInt16(data).resolution(.removing, resolution: Resolution.oneTenth)
        let temp = Measurement(value: tmpValue, unit: UnitTemperature.celsius)

        let char = CharacteristicTemperature(temperature: temp)
        return.success(char as! C)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothDecodeError
    @available(*, deprecated, message: "use decoder instead")
    open override class func decode(data: Data) throws -> CharacteristicTemperature {
        return try decoder(data: data).get()
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    open override func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        let value = temperature.converted(to: UnitTemperature.celsius).value.resolution(.adding, resolution: Resolution.oneTenth)

        msgData.append(Data(from: Int16(value).littleEndian))

        return.success(msgData)
    }
}
