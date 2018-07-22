//
//  CharacteristicBatteryLevelState.swift
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

/// BLE Battery Level State Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicBatteryLevelState: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Battery Level State"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A1B"
    }

    /// Battery Level
    ///
    /// The current charge level of a battery. 100% represents fully charged
    /// while 0% represents fully discharged.
    ///
    private(set) public var level: Measurement<UnitPercent>

    /// Battery Power State
    private(set) public var state: BatteryPowerState?

    /// Creates Battery Level State Characteristic
    ///
    /// - Parameters:
    ///   - level: Percent Battery level
    ///   - state: Battery Power State
    public init(level: Measurement<UnitPercent>, state: BatteryPowerState?) {
        self.level = level
        self.state = state

        super.init(name: CharacteristicBatteryLevelState.name,
                   uuidString: CharacteristicBatteryLevelState.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicBatteryLevelState {
        var decoder = DecodeData()

        let percent = Double(decoder.decodeUInt8(data))

        let level = Measurement(value: percent, unit: UnitPercent.percent)

        //Might be better to check the size of data.. 
        //but if they are all unknown it is the same as not being there..
        var state: BatteryPowerState?

        let stateValue = decoder.decodeUInt8(data)

        if stateValue > 0 {
            state = BatteryPowerState(stateValue)
        }

        return CharacteristicBatteryLevelState(level: level,
                                               state: state)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {

        guard level.value <= 100.0 else {
            throw BluetoothMessageProtocolError.encode("Battery level greater then max allowed 100%.")
        }

        var msgData = Data()

        msgData.append(Data(from: Int8(level.value)))

        if let battState = state {
            msgData.append(battState.rawValue)
        }

        return msgData
    }
}
