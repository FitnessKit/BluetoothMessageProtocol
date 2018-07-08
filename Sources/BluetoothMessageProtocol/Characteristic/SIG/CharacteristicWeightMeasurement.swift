//
//  CharacteristicWeightMeasurement.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/9/17.
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

/// BLE Weight Measurement Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicWeightMeasurement: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Weight Measurement"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A9D"
    }

    /// Flags
    private struct Flags: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }

        /// Imperial (Weight and Mass in units of pound (lb) and Height in units of inch (in))
        public static let unitsImperial          = Flags(rawValue: 1 << 0)
        /// Time stamp present
        public static let timestampPresent       = Flags(rawValue: 1 << 1)
        /// User ID present
        public static let userIdPresent          = Flags(rawValue: 1 << 1)
        /// BMI and Height present
        public static let bmiHeightPresent       = Flags(rawValue: 1 << 1)
    }

    /// Weight
    private(set) public var weight: Measurement<UnitMass>

    /// Timestamp
    private(set) public var timestamp: DateTime?

    /// User ID
    private(set) public var userId: User

    /// Body Mass Index (BMI)
    private(set) public var bmi: Double?

    /// Height
    private(set) public var height: Measurement<UnitLength>?

    /// Creates Weight Measurement Characteristic
    ///
    /// - Parameters:
    ///   - weight: Weight
    ///   - timestamp: Timestamp
    ///   - userId: User ID
    ///   - bmi: Body Mass Index
    ///   - height: Height
    public init(weight: Measurement<UnitMass>, timestamp: DateTime?, userId: User, bmi: Double?, height: Measurement<UnitLength>?) {
        self.weight = weight
        self.timestamp = timestamp
        self.userId = userId
        self.bmi = bmi
        self.height = height

        super.init(name: CharacteristicWeightMeasurement.name,
                   uuidString: CharacteristicWeightMeasurement.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicWeightMeasurement {
        var decoder = DecodeData()

        let flags = Flags(rawValue: decoder.decodeUInt8(data))

        var weight: Measurement<UnitMass>
        let value = Double(decoder.decodeUInt16(data))
        if flags.contains(.unitsImperial) {
            weight = Measurement(value: value.resolution(0.01), unit: UnitMass.pounds)
        } else {
            weight = Measurement(value: value.resolution(0.005), unit: UnitMass.kilograms)
        }

        var timestamp: DateTime?
        if flags.contains(.timestampPresent) {
            timestamp = try DateTime.decode(data, decoder: &decoder)
        }

        var userID: User
        if flags.contains(.userIdPresent) {
            let value = decoder.decodeUInt8(data)
            userID = User.create(value)
        } else {
            userID = User.unknown
        }

        var bmi: Double?
        var height: Measurement<UnitLength>?
        if flags.contains(.bmiHeightPresent) {
            bmi = decoder.decodeUInt16(data).resolution(0.1)

            let value = Double(decoder.decodeUInt16(data))
            if flags.contains(.unitsImperial) {
                height = Measurement(value: value.resolution(0.1), unit: UnitLength.inches)
            } else {
                height = Measurement(value: value.resolution(0.001), unit: UnitLength.meters)
            }
        }

        return CharacteristicWeightMeasurement(weight: weight,
                                               timestamp: timestamp,
                                               userId: userID,
                                               bmi: bmi,
                                               height: height)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError(.unsupported)
    }
}
