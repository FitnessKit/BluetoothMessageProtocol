//
//  CharacteristicBatteryLevel.swift
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

/// BLE Battery Level Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicBatteryLevel: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Battery Level"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A19"
    }

    /// Battery Level
    ///
    /// The current charge level of a battery. 100% represents fully charged
    /// while 0% represents fully discharged.
    ///
    private(set) public var level: Measurement<UnitPercent>

    /// Creates Battery Level Characteristic
    ///
    /// - Parameter level: Percent Battery Level
    public init(level: Measurement<UnitPercent>) {
        self.level = level

        super.init(name: CharacteristicBatteryLevel.name,
                   uuidString: CharacteristicBatteryLevel.uuidString)
    }

    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    open override class func decoder<C: CharacteristicBatteryLevel>(data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let percent = Double(decoder.decodeUInt8(data))
        
        let level = Measurement(value: percent, unit: UnitPercent.percent)

        return.success(CharacteristicBatteryLevel(level: level) as! C)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothDecodeError
    @available(*, deprecated, message: "use decoder instead")
    open override class func decode(data: Data) throws -> CharacteristicBatteryLevel {
        return try decoder(data: data).get()
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    open override func encode() -> Result<Data, BluetoothEncodeError> {

        guard kBatteryBounds.contains(level.value) else {
            return.failure(BluetoothEncodeError.boundsError(title: "Battery level must be between",
                                                            msg: "Percent",
                                                            range: kBatteryBounds))
        }

        var msgData = Data()

        msgData.append(Data(from: Int8(level.value)))

        return.success(msgData)
    }
}
