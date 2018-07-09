//
//  CharacteristicSupportedHeartRateRange.swift
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

/// BLE Supported Heart Rate Range Characteristic
///
/// The Supported Heart Rate Range characteristic is used to send the supported
/// Heart Rate range as well as the minimum Heart Rate increment supported by the Server
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicSupportedHeartRateRange: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Supported Heart Rate Range"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2AD7"
    }

    /// Minimum Heart Rate
    private(set) public var minimum: Measurement<UnitCadence>

    /// Maximum Heart Rate
    private(set) public var maximum: Measurement<UnitCadence>

    /// Minimum Increment
    private(set) public var minimumIncrement: Measurement<UnitCadence>

    /// Creates Supported Heart Rate Range Characteristic
    ///
    /// - Parameters:
    ///   - minimum: Minimum Heart Rate
    ///   - maximum: Maximum Heart Rate
    ///   - minimumIncrement: Minimum Increment
    public init(minimum: UInt8, maximum: UInt8, minimumIncrement: UInt8) {
        self.minimum = Measurement(value: Double(minimum),
                                   unit: UnitCadence.beatsPerMinute)

        self.maximum = Measurement(value: Double(maximum),
                                   unit: UnitCadence.beatsPerMinute)

        self.minimumIncrement = Measurement(value: Double(minimumIncrement), unit: UnitCadence.beatsPerMinute)

        super.init(name: CharacteristicSupportedHeartRateRange.name,
                   uuidString: CharacteristicSupportedHeartRateRange.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicSupportedHeartRateRange {
        var decoder = DecodeData()

        let minimum = decoder.decodeUInt8(data)
        let maximum = decoder.decodeUInt8(data)
        let minimumIncrement = decoder.decodeUInt8(data)

        return CharacteristicSupportedHeartRateRange(minimum: minimum,
                                                     maximum: maximum,
                                                     minimumIncrement: minimumIncrement)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(Data(from: UInt8(minimum.value)))
        msgData.append(Data(from: UInt8(maximum.value)))
        msgData.append(Data(from: UInt8(minimumIncrement.value)))

        return msgData
    }
}
