//
//  CharacteristicLocalEastCoordinate.swift
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

/// BLE Local East Coordinate Characteristic
///
/// The Local East characteristic describes the East coordinate of the device using local coordinate system
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicLocalEastCoordinate: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Local East Coordinate"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2AB1"
    }

    /// Local East Coordinate
    private(set) public var localEastCoordinate: Int32

    /// Creates Local East Coordinate Characteristic
    ///
    /// - Parameter localEastCoordinate: Local East Coordinate
    public init(localEastCoordinate: Int32) {
        self.localEastCoordinate = localEastCoordinate

        super.init(name: CharacteristicLocalEastCoordinate.name,
                   uuidString: CharacteristicLocalEastCoordinate.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicLocalEastCoordinate {
        var decoder = DecodeData()

        let local = decoder.decodeInt32(data)

        return CharacteristicLocalEastCoordinate(localEastCoordinate: local)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(Data(from: localEastCoordinate.littleEndian))

        return msgData
    }
}
