//
//  CharacteristicLocalTimeInformation.swift
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

/// BLE Local Time Information Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicLocalTimeInformation: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Local Time Information"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A0F"
    }

    /// Timezone
    ///
    /// Offset from UTC in number of 15 minutes increments. A value of -128 means
    /// that the time zone offset is not known. The offset defined in this characteristic
    /// is constant, regardless whether daylight savings is in effect
    private(set) public var timeZone: Int8

    /// DST Offset
    private(set) public var dstOffset: DSTOffset

    /// Creates Local Time Information Characteristic
    ///
    /// - Parameters:
    ///   - timeZone: Timezone Offset from UTC
    ///   - dstOffset: Daylight Savings Offset
    public init(timeZone: Int8, dstOffset: DSTOffset) {
        self.timeZone = timeZone
        self.dstOffset = dstOffset

        super.init(name: CharacteristicLocalTimeInformation.name,
                   uuidString: CharacteristicLocalTimeInformation.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicLocalTimeInformation {
        var decoder = DecodeData()

        let timez = decoder.decodeInt8(data)

        let dstOffset = DSTOffset(rawValue: decoder.decodeUInt8(data)) ?? .unknown

        return CharacteristicLocalTimeInformation(timeZone: timez,
                                                  dstOffset: dstOffset)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(Data(from: timeZone))
        msgData.append(dstOffset.rawValue)

        return msgData
    }
}
