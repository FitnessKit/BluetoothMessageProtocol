//
//  CharacteristicAnalog.swift
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

/// BLE Analog Characteristic
///
/// Used to read or write the value of one of the IO Module’s analog signals
///
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicAnalog: Characteristic {

    public static var name: String {
        return "Analog"
    }

    public static var uuidString: String {
        return "2A58"
    }

    fileprivate(set) public var analogValue: UInt16


    public init(analogValue: UInt16) {

        self.analogValue = analogValue

        super.init(name: CharacteristicAnalog.name, uuidString: CharacteristicAnalog.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicAnalog {

        var decoder = DataDecoder(data)

        let analogValue = decoder.decodeUInt16()

        return CharacteristicAnalog(analogValue: analogValue)
    }

    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(Data(from: analogValue.littleEndian))
        
        return msgData
    }
}
