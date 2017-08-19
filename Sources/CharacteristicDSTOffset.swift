//
//  CharacteristicDSTOffset.swift
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

/// BLE DST Offset Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicDSTOffset: Characteristic {

    public static var name: String {
        return "DST Offset"
    }

    public static var uuidString: String {
        return "2A0D"
    }

    /// DST Offset Reason
    public enum Offset: UInt8 {
        /// Standard Time
        case standardTime           = 0
        // Half An Hour Daylight Time (+0.5h)
        case halfHourDaylightTime   = 2
        /// Daylight Time (+1h)
        case daylightTime           = 4
        /// Double Daylight Time (+2h))
        case doubleDaylightTime     = 8
        // Unknown
        case unknown                = 255
    }

    /// DST Offset
    fileprivate(set) public var dstOffset: Offset

    public init(dstOffset: Offset) {

        self.dstOffset = dstOffset

        super.init(name: CharacteristicDSTOffset.name, uuidString: CharacteristicDSTOffset.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicDSTOffset {

        var decoder = DataDecoder(data)

        let dstOffset = Offset(rawValue: decoder.decodeUInt8()) ?? .unknown

        return CharacteristicDSTOffset(dstOffset: dstOffset)
    }

    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(dstOffset.rawValue)

        return msgData
    }

}

