//
//  CharacteristicGymConnectEquipmentType.swift
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

/// GymConnect Equipment Type Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicGymConnectEquipmentType: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "GymConnect Equipment Type"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "A026E01F-0A7D-4AB3-97FA-F1500F9FEB8B"
    }

    /// Equipment Type
    private(set) public var equipment: GymConnectEquipmentType

    /// Creates Characteristic
    ///
    /// - Parameter equipment: Equipment Type
    public init(equipment: GymConnectEquipmentType) {

        self.equipment = equipment

        super.init(name: CharacteristicGymConnectEquipmentType.name,
                   uuidString: CharacteristicGymConnectEquipmentType.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicGymConnectEquipmentType {
        var decoder = DecodeData()

        let equip = GymConnectEquipmentType.create(decoder.decodeUInt8(data))

        return CharacteristicGymConnectEquipmentType(equipment: equip)
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
