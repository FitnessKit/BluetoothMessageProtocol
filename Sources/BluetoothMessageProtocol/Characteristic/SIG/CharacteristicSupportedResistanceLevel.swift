//
//  CharacteristicSupportedResistanceLevel.swift
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

/// BLE Supported Resistance Level Characteristic
///
/// The Supported Resistance Level Range characteristic is used to send the supported
/// resistance level range as well as the minimum resistance increment supported by the Server
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicSupportedResistanceLevel: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Supported Resistance Level"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2AD6"
    }

    /// Minimum Resistance Level
    private(set) public var minimum: Double

    /// Maximum Resistance Level
    private(set) public var maximum: Double

    /// Minimum Increment
    private(set) public var minimumIncrement: Double

    /// Creates Supported Resistance Level Characteristic
    ///
    /// - Parameters:
    ///   - minimum: Minimum Resistance Level
    ///   - maximum: Maximum Resistance Level
    ///   - minimumIncrement: Minimum Increment
    public init(minimum: Double, maximum: Double, minimumIncrement: Double) {
        self.minimum = minimum
        self.maximum = maximum
        self.minimumIncrement = minimumIncrement

        super.init(name: CharacteristicSupportedResistanceLevel.name,
                   uuidString: CharacteristicSupportedResistanceLevel.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicSupportedResistanceLevel {
        var decoder = DecodeData()

        let minValue = decoder.decodeInt16(data).resolution(0.1)

        let maxValue = decoder.decodeInt16(data).resolution(0.1)

        let incrValue = decoder.decodeUInt16(data).resolution(0.1)

        return CharacteristicSupportedResistanceLevel(minimum: minValue,
                                                      maximum: maxValue,
                                                      minimumIncrement: incrValue)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        let minValue = Int16(minimum.resolution(1 / 0.1))
        let maxValue = Int16(maximum.resolution(1 / 0.1))
        let incrValue = UInt16(maximum.resolution(1 / 0.1))

        msgData.append(Data(from: minValue.littleEndian))
        msgData.append(Data(from: maxValue.littleEndian))
        msgData.append(Data(from: incrValue.littleEndian))

        return msgData
    }
}
