//
//  CharacteristicRowerData.swift
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

/// BLE Rower Data Characteristic
///
/// The Rower Data characteristic is used to send training-related data to the Client from a rower (Server).
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicRowerData: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Rower Data"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2AD1"
    }

    /// Flags
    private struct Flags: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }

        /// More Data Present
        public static let moreData: Flags                       = Flags(rawValue: 1 << 0)
        /// Average Stroke present
        public static let averageStrokePresent: Flags           = Flags(rawValue: 1 << 1)
        /// Total Distance Present
        public static let totalDistancePresent: Flags           = Flags(rawValue: 1 << 1)
        /// Instantaneous Pace present
        public static let instantaneousPacePresent: Flags       = Flags(rawValue: 1 << 3)
        /// Average Pace Present
        public static let averagePacePresent: Flags             = Flags(rawValue: 1 << 4)
        /// Instantaneous Power present
        public static let instantaneousPowerPresent: Flags      = Flags(rawValue: 1 << 5)
        /// Average Power present
        public static let averagePowerPresent: Flags            = Flags(rawValue: 1 << 6)
        /// Resistance Level present
        public static let resistanceLevelPresent: Flags         = Flags(rawValue: 1 << 7)
        /// Expended Energy present
        public static let expendedEnergyPresent: Flags          = Flags(rawValue: 1 << 8)
        /// Heart Rate present
        public static let heartRatePresent: Flags               = Flags(rawValue: 1 << 9)
        /// Metabolic Equivalent present
        public static let metabolicEquivalentPresent: Flags     = Flags(rawValue: 1 << 10)
        /// Elapsed Time present
        public static let elapsedTimePresent: Flags             = Flags(rawValue: 1 << 11)
        /// Remaining Time present
        public static let remainingTimePresent: Flags           = Flags(rawValue: 1 << 12)
    }

    /// Stroke Rate
    private(set) public var strokeRate: Measurement<UnitCadence>?

    /// Stroke Count
    private(set) public var strokeCount: UInt16?

    /// Average Stroke Rate
    private(set) public var averageStrokeRate: Measurement<UnitCadence>?

    /// Total Distance
    private(set) public var totalDistance: Measurement<UnitLength>?

    /// Instantaneous Pace
    private(set) public var instantaneousPace: Measurement<UnitDuration>?

    /// Average Pace
    private(set) public var averagePace: Measurement<UnitDuration>?

    /// Instantaneous Power
    private(set) public var instantaneousPower: Measurement<UnitPower>?

    /// Average Power
    private(set) public var averagePower: Measurement<UnitPower>?

    /// Resistance Level
    private(set) public var resistanceLevel: Double?

    /// Energy Information
    private(set) public var energy: FitnessMachineEnergy

    /// Heart Rate
    private(set) public var heartRate: Measurement<UnitCadence>?

    /// Metabolic Equivalent
    private(set) public var metabolicEquivalent: Double?

    /// Time Information
    private(set) public var time: FitnessMachineTime

    /// Creates Rower Data Characteristic
    ///
    /// - Parameters:
    ///   - strokeRate: Stroke Rate
    ///   - strokeCount: Stroke Count
    ///   - averageStrokeRate: Average Stroke Rate
    ///   - totalDistance: Total Distance
    ///   - instantaneousPace: Instantaneous Pace
    ///   - averagePace: Average Pace
    ///   - instantaneousPower: Instantaneous Power
    ///   - averagePower: Average Power
    ///   - resistanceLevel: Resistance Level
    ///   - energy: Energy Information
    ///   - heartRate: Heart Rate
    ///   - metabolicEquivalent: Metabolic Equivalent
    ///   - time: Time Information
    public init(strokeRate: Measurement<UnitCadence>?, strokeCount: UInt16?, averageStrokeRate: Measurement<UnitCadence>?, totalDistance: Measurement<UnitLength>?, instantaneousPace: Measurement<UnitDuration>?, averagePace: Measurement<UnitDuration>?, instantaneousPower: Measurement<UnitPower>?, averagePower: Measurement<UnitPower>?, resistanceLevel: Double?, energy: FitnessMachineEnergy, heartRate: UInt8?, metabolicEquivalent: Double?, time: FitnessMachineTime) {

        self.strokeRate = strokeRate
        self.strokeCount = strokeCount
        self.averageStrokeRate = averageStrokeRate
        self.totalDistance = totalDistance
        self.instantaneousPace = instantaneousPace
        self.averagePace = averagePace
        self.instantaneousPower = instantaneousPower
        self.averagePower = averagePower
        self.resistanceLevel = resistanceLevel

        self.energy = energy

        if let hRate = heartRate {
            self.heartRate = Measurement(value: Double(hRate), unit: UnitCadence.beatsPerMinute)
        } else {
            self.heartRate = nil
        }

        self.metabolicEquivalent = metabolicEquivalent
        self.time = time

        super.init(name: CharacteristicRowerData.name, uuidString: CharacteristicRowerData.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicRowerData {

        var decoder = DataDecoder(data)

        let flags = Flags(rawValue: decoder.decodeUInt16())

        var strokeRate: Measurement<UnitCadence>?
        var strokeCount: UInt16?
        if flags.contains(.moreData) == true {
            let value = Double(decoder.decodeUInt8()) * 0.5
            strokeRate = Measurement(value: value, unit: UnitCadence.strokesPerMinute)

            strokeCount = decoder.decodeUInt16()
        }

        var averageStrokeRate: Measurement<UnitCadence>?
        if flags.contains(.averageStrokePresent) == true {
            let value = Double(decoder.decodeUInt8()) * 0.5
            averageStrokeRate = Measurement(value: value, unit: UnitCadence.strokesPerMinute)
        }

        var totalDistance: Measurement<UnitLength>?
        if flags.contains(.totalDistancePresent) == true {
            let value = Double(decoder.decodeUInt16())
            totalDistance = Measurement(value: value, unit: UnitLength.meters)
        }

        var instantaneousPace: Measurement<UnitDuration>?
        if flags.contains(.instantaneousPacePresent) == true {
            let value = Double(decoder.decodeUInt16())
            instantaneousPace = Measurement(value: value, unit: UnitDuration.seconds)
        }

        var averagePace: Measurement<UnitDuration>?
        if flags.contains(.averagePacePresent) == true {
            let value = Double(decoder.decodeUInt16())
            averagePace = Measurement(value: value, unit: UnitDuration.seconds)
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

        var resistanceLevel: Double?
        if flags.contains(.resistanceLevelPresent) == true {
            resistanceLevel = Double(decoder.decodeInt16()) * 0.1
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

        return CharacteristicRowerData(strokeRate: strokeRate,
                                       strokeCount: strokeCount,
                                       averageStrokeRate: averageStrokeRate,
                                       totalDistance: totalDistance,
                                       instantaneousPace: instantaneousPace,
                                       averagePace: averagePace,
                                       instantaneousPower: iPower,
                                       averagePower: aPower,
                                       resistanceLevel: resistanceLevel,
                                       energy: energy,
                                       heartRate: heartRate,
                                       metabolicEquivalent: mets,
                                       time: time)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError.init(.unsupported)
    }
}
