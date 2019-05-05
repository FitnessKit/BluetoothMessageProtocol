//
//  CharacteristicBatteryPowerState.swift
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

/// BLE Battery Power State Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicBatteryPowerState: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Battery Power State"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A1A"
    }

    /// Battery Power State
    private(set) public var state: BatteryPowerState

    /// Creates Battery Power State Characteristic
    ///
    /// - Parameter state: Battery Power State
    public init(state: BatteryPowerState) {
        self.state = state

        super.init(name: CharacteristicBatteryPowerState.name,
                   uuidString: CharacteristicBatteryPowerState.uuidString)
    }

    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    open override class func decoder<C: CharacteristicBatteryPowerState>(data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let state = BatteryPowerState(decoder.decodeUInt8(data))

        return.success(CharacteristicBatteryPowerState(state: state) as! C)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothDecodeError
    @available(*, deprecated, message: "use decoder instead")
    open override class func decode(data: Data) throws -> CharacteristicBatteryPowerState {
        return try decoder(data: data).get()
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    open override func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(state.rawValue)
        
        return.success(msgData)
    }
}
