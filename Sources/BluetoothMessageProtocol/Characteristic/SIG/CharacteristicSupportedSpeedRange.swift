//
//  CharacteristicSupportedSpeedRange.swift
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

/// BLE Supported Speed Range Characteristic
///
/// The Supported Speed Range characteristic is used to send the supported speed
/// range as well as the minimum speed increment supported by the Server
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicSupportedSpeedRange: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Supported Speed Range"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2AD4"
    }

    /// Minimum Speed
    private(set) public var minimum: FitnessMachineSpeedType

    /// Maximum Speed
    private(set) public var maximum: FitnessMachineSpeedType

    /// Minimum Increment
    private(set) public var minimumIncrement: FitnessMachineSpeedType

    /// Creates Supported Speed Range Characteristic
    ///
    /// - Parameters:
    ///   - minimum: Minimum Speed
    ///   - maximum: Maximum Speed
    ///   - minimumIncrement: Minimum Increment
    public init(minimum: FitnessMachineSpeedType, maximum: FitnessMachineSpeedType, minimumIncrement: FitnessMachineSpeedType) {
        self.minimum = minimum
        self.maximum = maximum
        self.minimumIncrement = minimumIncrement

        super.init(name: CharacteristicSupportedSpeedRange.name,
                   uuidString: CharacteristicSupportedSpeedRange.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicSupportedSpeedRange {
        var decoder = DecodeData()

        let minimum = FitnessMachineSpeedType.create(decoder.decodeUInt16(data))
        let maximum = FitnessMachineSpeedType.create(decoder.decodeUInt16(data))
        let minimumIncrement = FitnessMachineSpeedType.create(decoder.decodeUInt16(data))

        return CharacteristicSupportedSpeedRange(minimum: minimum,
                                                 maximum: maximum,
                                                 minimumIncrement: minimumIncrement)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        let minValue = try minimum.encode()
        let maxValue = try maximum.encode()
        let incrValue = try minimumIncrement.encode()

        msgData.append(minValue)
        msgData.append(maxValue)
        msgData.append(incrValue)

        return msgData
    }
}
