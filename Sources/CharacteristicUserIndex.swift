//
//  CharacteristicUserIndex.swift
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

/// BLE User Index Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicUserIndex: Characteristic {

    /// The special value of 0xFF is used for “Unknown User”.
    private static let kUnknownUser: UInt8 = 255

    public static var name: String {
        return "User Index"
    }

    public static var uuidString: String {
        return "2A9A"
    }

    /// User Index
    private(set) public var userIndex: UInt8?


    public init(userIndex: UInt8?) {

        self.userIndex = userIndex

        super.init(name: CharacteristicUserIndex.name, uuidString: CharacteristicUserIndex.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicUserIndex {

        var decoder = DataDecoder(data)

        let value = decoder.decodeUInt8()

        var userIndex: UInt8?
        if value != CharacteristicUserIndex.kUnknownUser {
            userIndex = value
        }

        return CharacteristicUserIndex(userIndex: userIndex)
    }

    open override func encode() throws -> Data {
        var indexValue: UInt8 = CharacteristicUserIndex.kUnknownUser

        if let index = userIndex {
            indexValue = index
        }

        var msgData = Data()

        msgData.append(indexValue)

        return msgData
    }
}
