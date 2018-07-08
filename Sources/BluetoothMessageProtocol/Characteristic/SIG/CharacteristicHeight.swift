//
//  CharacteristicHeight.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/19/17.
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

/// BLE Height Characteristic
///
/// Height of the User
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicHeight: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Height"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A8E"
    }

    /// Height
    private(set) public var height: Measurement<UnitLength>

    /// Creates Height Characteristic
    ///
    /// - Parameter height: Height
    public init(height: Measurement<UnitLength>) {
        self.height = height

        super.init(name: CharacteristicHeight.name,
                   uuidString: CharacteristicHeight.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicHeight {
        var decoder = DecodeData()

        let meters = decoder.decodeUInt16(data).resolution(0.01)

        let height = Measurement(value: meters, unit: UnitLength.meters)

        return CharacteristicHeight(height: height)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        //Make sure we put this back to Meters before we create Data
        let heightVal = UInt16(height.converted(to: UnitLength.meters).value.resolution(1 / 0.01))

        msgData.append(Data(from: heightVal))

        return msgData
    }
}
