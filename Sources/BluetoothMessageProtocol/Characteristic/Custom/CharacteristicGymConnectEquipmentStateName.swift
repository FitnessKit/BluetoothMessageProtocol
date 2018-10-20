//
//  CharacteristicGymConnectEquipmentStateName.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 10/19/18.
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

/// GymConnect Equipment State Name Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicGymConnectEquipmentStateName: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "GymConnect Equipment State Name"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "A026E020-0A7D-4AB3-97FA-F1500F9FEB8B"
    }

    /// Equipment State
    private(set) public var stateName: String

    /// Creates Characteristic
    ///
    /// - Parameter stateName: Equipment State
    public init(stateName: String) {

        self.stateName = stateName

        super.init(name: CharacteristicGymConnectEquipmentStateName.name,
                   uuidString: CharacteristicGymConnectEquipmentStateName.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicGymConnectEquipmentStateName {

        var name = ""

        if data.count > 0 {
            name = data.safeStringValue ?? ""
        }

        return CharacteristicGymConnectEquipmentStateName(stateName: name)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        /// not writeable
        throw BluetoothMessageProtocolError(.unsupported)
    }
}
