//
//  CharacteristicIndoorBikeData.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/27/17.
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

/// BLE Indoor Bike Data Characteristic
///
/// The Indoor Bike Data characteristic is used to send training-related data to the Client from an indoor bike (Server).
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicIndoorBikeData: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Indoor Bike Data"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2AD2"
    }

    /// Flags
    private struct Flags: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }

        public static let moreData: Flags                       = Flags(rawValue: 1 << 0)
        public static let instantaneousCadencePresent: Flags    = Flags(rawValue: 1 << 1)
        public static let averageSpeedPresent: Flags            = Flags(rawValue: 1 << 2)
        public static let averageCadencePresent: Flags          = Flags(rawValue: 1 << 3)
        public static let totalDistancePresent: Flags           = Flags(rawValue: 1 << 4)
        public static let resistanceLevelPresent: Flags         = Flags(rawValue: 1 << 5)
        public static let instantaneousPowerPresent: Flags      = Flags(rawValue: 1 << 6)
        public static let averagePowerPresent: Flags            = Flags(rawValue: 1 << 7)
        public static let expendedEnergyPresent: Flags          = Flags(rawValue: 1 << 8)
        public static let heartRatePresent: Flags               = Flags(rawValue: 1 << 9)
        public static let metabolicEquivalentPresent: Flags     = Flags(rawValue: 1 << 10)
        public static let elapsedTimePresent: Flags             = Flags(rawValue: 1 << 11)
        public static let remainingTimePresent: Flags           = Flags(rawValue: 1 << 12)
    }


    /// Instantaneous Speed
    private(set) public var instantaneousSpeed: Measurement<UnitSpeed>?

    /// Average Speed
    private(set) public var averageSpeed: Measurement<UnitSpeed>?

    /// Instantaneous Cadence
    private(set) public var instantaneousCadence: Measurement<UnitCadence>?

    /// Average Cadence
    private(set) public var averageCadence: Measurement<UnitCadence>?

    /// Total Distance
    private(set) public var totalDistance: Measurement<UnitLength>?

    /// Resistance Level
    private(set) public var resistanceLevel: Double?

    /// Instantaneous Power
    private(set) public var instantaneousPower: Measurement<UnitPower>?

    /// Average Power
    private(set) public var averagePower: Measurement<UnitPower>?

    /// Energy Information
    private(set) public var energy: FitnessMachineEnergy

    /// Heart Rate
    private(set) public var heartRate: Measurement<UnitCadence>?

    /// Metabolic Equivalent
    private(set) public var metabolicEquivalent: Double?

    /// Time Information
    private(set) public var time: FitnessMachineTime


    public init(instantaneousSpeed: Measurement<UnitSpeed>?, averageSpeed: Measurement<UnitSpeed>?, instantaneousCadence: Measurement<UnitCadence>?, averageCadence: Measurement<UnitCadence>?, totalDistance: Measurement<UnitLength>?, resistanceLevel: Double?, instantaneousPower: Measurement<UnitPower>?, averagePower: Measurement<UnitPower>?, energy: FitnessMachineEnergy, heartRate: UInt8?, metabolicEquivalent: Double?, time: FitnessMachineTime) {

        self.instantaneousSpeed = instantaneousSpeed
        self.averageSpeed = averageSpeed
        self.instantaneousCadence = instantaneousCadence
        self.averageCadence = averageCadence
        self.totalDistance = totalDistance
        self.resistanceLevel = resistanceLevel
        self.instantaneousPower = instantaneousPower
        self.averagePower = averagePower
        self.energy = energy

        if let hRate = heartRate {
            self.heartRate = Measurement(value: Double(hRate), unit: UnitCadence.beatsPerMinute)
        } else {
            self.heartRate = nil
        }

        self.metabolicEquivalent = metabolicEquivalent
        self.time = time

        super.init(name: CharacteristicIndoorBikeData.name, uuidString: CharacteristicIndoorBikeData.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicIndoorBikeData {

        var decoder = DataDecoder(data)

        let flags = Flags(rawValue: decoder.decodeUInt16())

        var iSpeed: Measurement<UnitSpeed>?
        if flags.contains(.moreData) == true {
            let value = Double(decoder.decodeUInt16()) * 0.01
            iSpeed = Measurement(value: value, unit: UnitSpeed.kilometersPerHour)
        }

        var avgSpeed: Measurement<UnitSpeed>?
        if flags.contains(.averageSpeedPresent) == true {
            let value = Double(decoder.decodeUInt16()) * 0.01
            avgSpeed = Measurement(value: value, unit: UnitSpeed.kilometersPerHour)
        }

        var instantaneousCadence: Measurement<UnitCadence>?
        if flags.contains(.instantaneousCadencePresent) == true {
            let value = Double(decoder.decodeUInt16()) * 0.5
            instantaneousCadence = Measurement(value: value, unit: UnitCadence.revolutionsPerMinute)
        }

        var averageCadence: Measurement<UnitCadence>?
        if flags.contains(.instantaneousCadencePresent) == true {
            let value = Double(decoder.decodeUInt16()) * 0.5
            averageCadence = Measurement(value: value, unit: UnitCadence.revolutionsPerMinute)
        }

        var totalDistance: Measurement<UnitLength>?
        if flags.contains(.totalDistancePresent) == true {
            let value = Double(decoder.decodeUInt16())
            totalDistance = Measurement(value: value, unit: UnitLength.meters)
        }

        var resistanceLevel: Double?
        if flags.contains(.resistanceLevelPresent) == true {
            resistanceLevel = Double(decoder.decodeInt16()) * 0.1
        }

        var iPower: Measurement<UnitPower>?
        if flags.contains(.instantaneousPowerPresent) == true {
            let value = Double(decoder.decodeInt16())
            iPower = Measurement(value: value, unit: UnitPower.watts)
        }

        var aPower: Measurement<UnitPower>?
        if flags.contains(.averagePowerPresent) == true {
            let value = Double(decoder.decodeInt16())
            aPower = Measurement(value: value, unit: UnitPower.watts)
        }

        var totalEnergy: Measurement<UnitEnergy>?
        var energyPerHour: Measurement<UnitEnergy>?
        var energyPerMinute: Measurement<UnitEnergy>?
        if flags.contains(.expendedEnergyPresent) == true {
            let tValue = Double(decoder.decodeUInt16())
            totalEnergy = Measurement(value: tValue, unit: UnitEnergy.kilocalories)

            let perHourValue = Double(decoder.decodeUInt16())
            energyPerHour = Measurement(value: perHourValue, unit: UnitEnergy.kilocalories)

            let perMinValue = Double(decoder.decodeUInt8())
            energyPerMinute = Measurement(value: perMinValue, unit: UnitEnergy.kilocalories)
        }

        let energy = FitnessMachineEnergy(total: totalEnergy, perHour: energyPerHour, perMinute: energyPerMinute)


        var heartRate: UInt8?
        if flags.contains(.heartRatePresent) == true {
            heartRate = decoder.decodeUInt8()
        }

        var mets: Double?
        if flags.contains(.metabolicEquivalentPresent) == true {
            mets = Double(decoder.decodeUInt8()) * 0.1
        }

        var elapsedTime: Measurement<UnitDuration>?
        if flags.contains(.elapsedTimePresent) == true {
            let value = Double(decoder.decodeUInt16())
            elapsedTime = Measurement(value: value, unit: UnitDuration.seconds)
        }

        var remainingTime: Measurement<UnitDuration>?
        if flags.contains(.remainingTimePresent) == true {
            let value = Double(decoder.decodeUInt16())
            remainingTime = Measurement(value: value, unit: UnitDuration.seconds)
        }

        let time = FitnessMachineTime(elapsed: elapsedTime, remaining: remainingTime)


        return CharacteristicIndoorBikeData(instantaneousSpeed: iSpeed,
                                            averageSpeed: avgSpeed,
                                            instantaneousCadence: instantaneousCadence,
                                            averageCadence: averageCadence,
                                            totalDistance: totalDistance,
                                            resistanceLevel: resistanceLevel,
                                            instantaneousPower: iPower,
                                            averagePower: aPower,
                                            energy: energy,
                                            heartRate: heartRate,
                                            metabolicEquivalent: mets,
                                            time: time)
    }

    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError.init(.unsupported)
    }
}
