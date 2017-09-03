//
//  CharacteristicBodyCompositionMeasurement.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/2/17.
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

/// BLE Body Composition Measurement Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicBodyCompositionMeasurement: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Body Composition Measurement"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A9C"
    }

    /// Flags
    private struct Flags: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }

        public static let imperialUnits: Flags              = Flags(rawValue: 1 << 0)
        public static let timeStampPresent: Flags           = Flags(rawValue: 1 << 1)
        public static let userIDPresent: Flags              = Flags(rawValue: 1 << 2)
        public static let basalMetabolismPresent: Flags     = Flags(rawValue: 1 << 3)
        public static let musclePercentagePresent: Flags    = Flags(rawValue: 1 << 4)
        public static let muscleMassPresent: Flags          = Flags(rawValue: 1 << 5)
        public static let fatFreeMassPresent: Flags         = Flags(rawValue: 1 << 6)
        public static let softLeanMassPresent: Flags        = Flags(rawValue: 1 << 7)
        public static let bodyWaterMassPresent: Flags       = Flags(rawValue: 1 << 8)
        public static let impedancePresent: Flags           = Flags(rawValue: 1 << 9)
        public static let weightPresent: Flags              = Flags(rawValue: 1 << 10)
        public static let heightPresent: Flags              = Flags(rawValue: 1 << 11)
        public static let multiplePacketMeasrement: Flags   = Flags(rawValue: 1 << 12)
    }

    /// Body Fat Percentage
    private(set) public var bodyFat: Measurement<UnitPercent>

    /// Timestamp
    private(set) public var currentTime: DateTime?

    /// User ID
    private(set) public var userID: User?

    /// Basal Metabolism
    private(set) public var basalMetabolism: Measurement<UnitEnergy>?

    /// Muscle Percentage
    private(set) public var musclePercentage: Measurement<UnitPercent>?

    /// Muscle Mass
    private(set) public var muscleMass: Measurement<UnitMass>?

    /// Fat Free Mass
    private(set) public var fatFreeMass: Measurement<UnitMass>?

    /// Soft Lean Mass
    private(set) public var softLeanMass: Measurement<UnitMass>?

    /// Body Water Mass
    private(set) public var bodyWaterMass: Measurement<UnitMass>?

    /// Impedance
    private(set) public var impedance: Measurement<UnitElectricResistance>?

    /// Weight
    private(set) public var weight: Measurement<UnitMass>?

    /// Height
    private(set) public var height: Measurement<UnitLength>?

    /// Multiple Packet Measurement
    private(set) public var multiplePacketMeasurement: Bool


    public init(bodyFat: Measurement<UnitPercent>, currentTime: DateTime?, userID: User?, basalMetabolism: Measurement<UnitEnergy>?, musclePercentage: Measurement<UnitPercent>?, muscleMass: Measurement<UnitMass>?, fatFreeMass: Measurement<UnitMass>?, softLeanMass: Measurement<UnitMass>?, bodyWaterMass: Measurement<UnitMass>?, impedance: Measurement<UnitElectricResistance>?, weight: Measurement<UnitMass>?, height: Measurement<UnitLength>?, multiplePacketMeasurement: Bool) {

        self.bodyFat = bodyFat
        self.currentTime = currentTime
        self.userID = userID
        self.basalMetabolism = basalMetabolism
        self.musclePercentage = musclePercentage
        self.muscleMass = muscleMass
        self.fatFreeMass = fatFreeMass
        self.softLeanMass = softLeanMass
        self.bodyWaterMass = bodyWaterMass
        self.impedance = impedance
        self.weight = weight
        self.height = height
        self.multiplePacketMeasurement = multiplePacketMeasurement

        super.init(name: CharacteristicBodyCompositionMeasurement.name, uuidString: CharacteristicBodyCompositionMeasurement.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicBodyCompositionMeasurement {

        var decoder = DataDecoder(data)

        let flags = Flags(rawValue: decoder.decodeUInt16())

        let bfatValue = Double(decoder.decodeUInt16()) * 0.1
        let bFat = Measurement(value: bfatValue, unit: UnitPercent.percent)

        var currentTime: DateTime?
        if flags.contains(.timeStampPresent) == true {
            currentTime = try DateTime.decode(decoder: &decoder)
        }

        var userID: User?
        if flags.contains(.userIDPresent) == true {
            userID = User.create(decoder.decodeUInt8())
        }

        var basalMetabolism: Measurement<UnitEnergy>?
        if flags.contains(.basalMetabolismPresent) == true {
            let value = Double(decoder.decodeUInt16())
            basalMetabolism = Measurement(value: value, unit: UnitEnergy.kilojoules)
        }

        var musclePercentage: Measurement<UnitPercent>?
        if flags.contains(.musclePercentagePresent) == true {
            let value = Double(decoder.decodeUInt16()) * 0.1
            musclePercentage = Measurement(value: value, unit: UnitPercent.percent)
        }

        var muscleMass: Measurement<UnitMass>?
        if flags.contains(.muscleMassPresent) == true {

            if flags.contains(.imperialUnits) == true {
                let value = Double(decoder.decodeUInt16()) * 0.01
                muscleMass = Measurement(value: value, unit: UnitMass.pounds)
            } else {
                let value = Double(decoder.decodeUInt16()) * 0.005
                muscleMass = Measurement(value: value, unit: UnitMass.kilograms)
            }
        }

        var fatFreeMass: Measurement<UnitMass>?
        if flags.contains(.fatFreeMassPresent) == true {

            if flags.contains(.imperialUnits) == true {
                let value = Double(decoder.decodeUInt16()) * 0.01
                fatFreeMass = Measurement(value: value, unit: UnitMass.pounds)
            } else {
                let value = Double(decoder.decodeUInt16()) * 0.005
                fatFreeMass = Measurement(value: value, unit: UnitMass.kilograms)
            }
        }

        var softLeanMass: Measurement<UnitMass>?
        if flags.contains(.softLeanMassPresent) == true {

            if flags.contains(.imperialUnits) == true {
                let value = Double(decoder.decodeUInt16()) * 0.01
                softLeanMass = Measurement(value: value, unit: UnitMass.pounds)
            } else {
                let value = Double(decoder.decodeUInt16()) * 0.005
                softLeanMass = Measurement(value: value, unit: UnitMass.kilograms)
            }
        }

        var bodyWaterMass: Measurement<UnitMass>?
        if flags.contains(.bodyWaterMassPresent) == true {

            if flags.contains(.imperialUnits) == true {
                let value = Double(decoder.decodeUInt16()) * 0.01
                bodyWaterMass = Measurement(value: value, unit: UnitMass.pounds)
            } else {
                let value = Double(decoder.decodeUInt16()) * 0.005
                bodyWaterMass = Measurement(value: value, unit: UnitMass.kilograms)
            }
        }

        var impedance: Measurement<UnitElectricResistance>?
        if flags.contains(.impedancePresent) == true {
            let value = Double(decoder.decodeUInt16()) * 0.1
            impedance = Measurement(value: value, unit: UnitElectricResistance.ohms)
        }

        var weight: Measurement<UnitMass>?
        if flags.contains(.weightPresent) == true {

            if flags.contains(.imperialUnits) == true {
                let value = Double(decoder.decodeUInt16()) * 0.01
                weight = Measurement(value: value, unit: UnitMass.pounds)
            } else {
                let value = Double(decoder.decodeUInt16()) * 0.005
                weight = Measurement(value: value, unit: UnitMass.kilograms)
            }
        }

        var height: Measurement<UnitLength>?
        if flags.contains(.heightPresent) == true {

            if flags.contains(.imperialUnits) == true {
                let value = Double(decoder.decodeUInt16()) * 0.01
                height = Measurement(value: value, unit: UnitLength.inches)
            } else {
                let value = Double(decoder.decodeUInt16()) * 0.001
                height = Measurement(value: value, unit: UnitLength.meters)
            }
        }

        var multiPacket: Bool = false
        if flags.contains(.multiplePacketMeasrement) == true {
            multiPacket = true
        }

        return CharacteristicBodyCompositionMeasurement(bodyFat: bFat,
                                                        currentTime: currentTime,
                                                        userID: userID,
                                                        basalMetabolism: basalMetabolism,
                                                        musclePercentage: musclePercentage,
                                                        muscleMass: muscleMass,
                                                        fatFreeMass: fatFreeMass,
                                                        softLeanMass: softLeanMass,
                                                        bodyWaterMass: bodyWaterMass,
                                                        impedance: impedance,
                                                        weight: weight,
                                                        height: height,
                                                        multiplePacketMeasurement: multiPacket)
    }

    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError.init(.unsupported)
    }
}
