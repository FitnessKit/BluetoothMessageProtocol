//
//  CharacteristicTacxAntFecReceive.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 3/31/18.
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

/// BLE Tacx ANT-FEC Receive Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicTacxAntFecReceive: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Tacx ANT-FEC Receive"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "6E40FEC2-B5A3-F393-E0A9-E50E24DCCA9E"
    }

    /// ANT-FEC Data
    private(set) public var antData: Data

    /// Creates Tacx ANT-FEC Receive Characteristic
    ///
    /// - Parameter antData: ANT Message
    public init(antData: Data) {

        self.antData = antData

        super.init(name: CharacteristicTacxAntFecReceive.name,
                   uuidString: CharacteristicTacxAntFecReceive.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicTacxAntFecReceive {
        var decoder = DecodeData()

        let sync = decoder.decodeUInt8(data)

        /// Check to make sure the Sync byte is correct
        guard sync == 0xA4 else {
            throw BluetoothMessageProtocolError.decode("ANT Sync mismatch")
        }

        /// Just return the data
        return CharacteristicTacxAntFecReceive(antData: data)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        /// We don't need to ever encode it
        throw BluetoothMessageProtocolError(.unsupported)
    }
}
