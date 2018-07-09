//
//  CharacteristicTrueWindDirection.swift
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

/// BLE True Wind Direction Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicTrueWindDirection: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "True Wind Direction"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A71"
    }

    /// True Wind Direction
    ///
    /// Wind direction is reported by the direction from which it originates and is
    /// an angle measured clockwise relative to Geographic North. For example, a wind
    /// coming from the north is given as 0 degrees, a wind coming from the south is
    /// given as 180 degrees, a wind coming from the east is given as 90 degrees and
    /// a wind coming from the west is given as 270 degrees
    private(set) public var windDirection: Measurement<UnitAngle>

    /// Creates True Wind Direction Characteristic
    ///
    /// - Parameter windDirection: True Wind Direction
    public init(windDirection: Measurement<UnitAngle>) {
        self.windDirection = windDirection

        super.init(name: CharacteristicTrueWindDirection.name,
                   uuidString: CharacteristicTrueWindDirection.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicTrueWindDirection {
        var decoder = DecodeData()

        let value = decoder.decodeUInt16(data).resolution(0.01)

        let direction = Measurement(value: value, unit: UnitAngle.degrees)

        return CharacteristicTrueWindDirection(windDirection: direction)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        let value = windDirection.converted(to: UnitAngle.degrees).value.resolution(1 / 0.01)

        msgData.append(Data(from: UInt16(value).littleEndian))

        return msgData
    }
}
