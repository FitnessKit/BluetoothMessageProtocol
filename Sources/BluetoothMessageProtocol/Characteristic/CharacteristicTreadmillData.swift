//
//  CharacteristicTreadmillData.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/1/17.
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

/// BLE Treadmill Data Characteristic
///
/// The Treadmill Data characteristic is used to send training-related data to the Client from a treadmill (Server).
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicTreadmillData: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Treadmill Data"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2ACD"
    }

    /// Flags
    private struct Flags: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }

        public static let moreData: Flags                       = Flags(rawValue: 1 << 0)
        public static let averageSpeedPresent: Flags            = Flags(rawValue: 1 << 1)
        public static let totalDistancePresent: Flags           = Flags(rawValue: 1 << 2)
        public static let angleSettingpresent: Flags            = Flags(rawValue: 1 << 3)
        public static let elevationGainPresent: Flags           = Flags(rawValue: 1 << 4)
        public static let instantaneousPacePresent: Flags       = Flags(rawValue: 1 << 5)
        public static let averagePacePresent: Flags             = Flags(rawValue: 1 << 6)
        public static let expendedEnergyPresent: Flags          = Flags(rawValue: 1 << 7)
        public static let heartRatePresent: Flags               = Flags(rawValue: 1 << 8)
        public static let metabolicEquivalentPresent: Flags     = Flags(rawValue: 1 << 9)
        public static let elapsedTimePresent: Flags             = Flags(rawValue: 1 << 10)
        public static let remainingTimePresent: Flags           = Flags(rawValue: 1 << 11)
        public static let beltForcePowerOutputPresent: Flags    = Flags(rawValue: 1 << 12)
    }


    /// Instantaneous Speed
    private(set) public var instantaneousSpeed: Measurement<UnitSpeed>?

    /// Average Speed
    private(set) public var averageSpeed: Measurement<UnitSpeed>?

    /// Total Distance
    private(set) public var totalDistance: Measurement<UnitLength>?

    /// Inclination
    private(set) public var inclination: Measurement<UnitPercent>?

    /// Ramp Angle Setting
    private(set) public var rampAngle: Measurement<UnitAngle>?

    /// Positive Elevation Gain
    private(set) public var positiveElevationGain: Measurement<UnitLength>?

    /// Negative Elevation Gain
    private(set) public var negativeElevationGain: Measurement<UnitLength>?

    /// Instantaneous Pace
    private(set) public var instantaneousPace: Measurement<UnitSpeed>?

    /// Average Pace
    private(set) public var averagePace: Measurement<UnitSpeed>?

    /// Energy Information
    private(set) public var energy: FitnessMachineEnergy

    /// Heart Rate
    private(set) public var heartRate: Measurement<UnitCadence>?

    /// Metabolic Equivalent
    private(set) public var metabolicEquivalent: Double?

    /// Time Information
    private(set) public var time: FitnessMachineTime

    /// Force on Belt
    private(set) public var forceOnBelt: Measurement<UnitForce>?

    /// Power Output
    private(set) public var powerOutput: Measurement<UnitPower>?


    public init(instantaneousSpeed: Measurement<UnitSpeed>?, averageSpeed: Measurement<UnitSpeed>?, totalDistance: Measurement<UnitLength>?, inclination: Measurement<UnitPercent>?, rampAngle: Measurement<UnitAngle>?, positiveElevationGain: Measurement<UnitLength>?, negativeElevationGain: Measurement<UnitLength>?, instantaneousPace: Measurement<UnitSpeed>?, averagePace: Measurement<UnitSpeed>?, energy: FitnessMachineEnergy, heartRate: UInt8?, metabolicEquivalent: Double?, time: FitnessMachineTime, forceOnBelt: Measurement<UnitForce>?, powerOutput: Measurement<UnitPower>?) {

        self.instantaneousSpeed = instantaneousSpeed
        self.averageSpeed = averageSpeed
        self.totalDistance = totalDistance
        self.inclination = inclination
        self.rampAngle = rampAngle
        self.positiveElevationGain = positiveElevationGain
        self.negativeElevationGain = negativeElevationGain
        self.instantaneousPace = instantaneousPace
        self.averagePace = averagePace;
        self.energy = energy

        if let hRate = heartRate {
            self.heartRate = Measurement(value: Double(hRate), unit: UnitCadence.beatsPerMinute)
        } else {
            self.heartRate = nil
        }

        self.metabolicEquivalent = metabolicEquivalent
        self.time = time
        self.forceOnBelt = forceOnBelt
        self.powerOutput = powerOutput

        super.init(name: CharacteristicTreadmillData.name, uuidString: CharacteristicTreadmillData.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicTreadmillData {

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

        var totalDistance: Measurement<UnitLength>?
        if flags.contains(.totalDistancePresent) == true {
            let value = Double(decoder.decodeUInt16())
            totalDistance = Measurement(value: value, unit: UnitLength.meters)
        }

        var inclination: Measurement<UnitPercent>?
        var rampAngle: Measurement<UnitAngle>?
        if flags.contains(.angleSettingpresent) == true {
            let iValue = Double(decoder.decodeInt16()) * 0.1
            inclination = Measurement(value: iValue, unit: UnitPercent.percent)

            let rValue = Double(decoder.decodeInt16()) * 0.1
            rampAngle = Measurement(value: rValue, unit: UnitAngle.degrees)
        }

        var pElevaionGain: Measurement<UnitLength>?
        var nElevaionGain: Measurement<UnitLength>?
        if flags.contains(.elevationGainPresent) == true {
            let pValue = Double(decoder.decodeUInt16())
            pElevaionGain = Measurement(value: pValue, unit: UnitLength.meters)

            let nValue = Double(decoder.decodeUInt16())
            nElevaionGain = Measurement(value: nValue, unit: UnitLength.meters)
        }

        var instantaneousPace: Measurement<UnitSpeed>?
        if flags.contains(.instantaneousPacePresent) == true {
            let value = Double(decoder.decodeUInt8()) * 0.1
            instantaneousPace = Measurement(value: value, unit: UnitSpeed.kilometersPerMinute)
        }

        var averagePace: Measurement<UnitSpeed>?
        if flags.contains(.instantaneousPacePresent) == true {
            let value = Double(decoder.decodeUInt8()) * 0.1
            averagePace = Measurement(value: value, unit: UnitSpeed.kilometersPerMinute)
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

        var forceOnBelt: Measurement<UnitForce>?
        var powerOutput: Measurement<UnitPower>?
        if flags.contains(.beltForcePowerOutputPresent) == true {
            let bValue = Double(decoder.decodeInt16())
            forceOnBelt = Measurement(value: bValue, unit: UnitForce.newton)

            let value = Double(decoder.decodeInt16())
            powerOutput = Measurement(value: value, unit: UnitPower.watts)
        }

        return CharacteristicTreadmillData(instantaneousSpeed: iSpeed,
                                           averageSpeed: avgSpeed,
                                           totalDistance: totalDistance,
                                           inclination: inclination,
                                           rampAngle: rampAngle,
                                           positiveElevationGain: pElevaionGain,
                                           negativeElevationGain: nElevaionGain,
                                           instantaneousPace: instantaneousPace,
                                           averagePace: averagePace,
                                           energy: energy,
                                           heartRate: heartRate,
                                           metabolicEquivalent: mets,
                                           time: time,
                                           forceOnBelt: forceOnBelt,
                                           powerOutput: powerOutput)
    }

    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError.init(.unsupported)
    }
}
