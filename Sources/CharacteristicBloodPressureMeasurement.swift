//
//  CharacteristicBloodPressureMeasurement.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/13/17.
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

/// BLE Blood Pressure Measurement Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicBloodPressureMeasurement: Characteristic {

    public static var name: String {
        return "Blood Pressure Measurement"
    }

    public static var uuidString: String {
        return "2A35"
    }

    private struct Flags: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }

        public static let unitsIsKilopascals: Flags         = Flags(rawValue: 1 << 0)
        public static let timestampPresent: Flags           = Flags(rawValue: 1 << 1)
        public static let pulseRatePresent: Flags           = Flags(rawValue: 1 << 2)
        public static let userIDPresent: Flags              = Flags(rawValue: 1 << 3)
        public static let measurementStatusPresent: Flags   = Flags(rawValue: 1 << 4)

    }

    /// Systolic Blood Pressure
    private(set) public var systolic: Measurement<UnitPressure>

    /// Diastolic Blood Pressure
    private(set) public var diastolic: Measurement<UnitPressure>

    /// Mean Arterial Pressure
    private(set) public var meanArterial: Measurement<UnitPressure>

    /// Timestamp
    private(set) public var timestamp: DateTime?

    /// Pulse Rate
    private(set) public var pulseRate: Measurement<UnitCadence>?

    /// User ID
    ///
    /// - note: 255 = Unknown User
    private(set) public var userID: UInt8?

    // TODO: add Measurement Status

    public init(systolic: Measurement<UnitPressure>, diastolic: Measurement<UnitPressure>, meanArterial: Measurement<UnitPressure>, timestamp: DateTime?, pulseRate: Measurement<UnitCadence>?, userID: UInt8?) {

        self.systolic = systolic
        self.diastolic = diastolic
        self.meanArterial = meanArterial
        self.timestamp = timestamp
        self.pulseRate = pulseRate
        self.userID = userID

        super.init(name: CharacteristicBloodPressureMeasurement.name, uuidString: CharacteristicBloodPressureMeasurement.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicBloodPressureMeasurement {

        var decoder = DataDecoder(data)

        let flags = Flags(rawValue: decoder.decodeUInt8())

        var systolic: Measurement<UnitPressure>?
        let systolicV = Double(decoder.decodeSFloatValue())

        var diastolic: Measurement<UnitPressure>?
        let diastolicV = Double(decoder.decodeSFloatValue())

        var meanArterial: Measurement<UnitPressure>?
        let meanArterialV = Double(decoder.decodeSFloatValue())


        if flags.contains(.unitsIsKilopascals) == true {
            systolic = Measurement(value: systolicV, unit: UnitPressure.millimetersOfMercury)
            diastolic = Measurement(value: diastolicV, unit: UnitPressure.millimetersOfMercury)
            meanArterial = Measurement(value: meanArterialV, unit: UnitPressure.millimetersOfMercury)
        } else {
            systolic = Measurement(value: systolicV, unit: UnitPressure.kilopascals)
            diastolic = Measurement(value: diastolicV, unit: UnitPressure.kilopascals)
            meanArterial = Measurement(value: meanArterialV, unit: UnitPressure.kilopascals)
        }

        var timestamp: DateTime?
        if flags.contains(.timestampPresent) == true {
            timestamp = try DateTime.decode(decoder: &decoder)
        }

        var pulseRate: Measurement<UnitCadence>?
        if flags.contains(.pulseRatePresent) == true {
            let pulse = Double(decoder.decodeSFloatValue())
            pulseRate = Measurement(value: pulse, unit: UnitCadence.beatsPerMinute)
        }

        var userID: UInt8?
        if flags.contains(.userIDPresent) == true {
            userID = decoder.decodeUInt8()
        }


        return CharacteristicBloodPressureMeasurement(systolic: systolic!, diastolic: diastolic!, meanArterial: meanArterial!, timestamp: timestamp, pulseRate: pulseRate, userID: userID)
    }

    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError.init(.unsupported)
    }
}
