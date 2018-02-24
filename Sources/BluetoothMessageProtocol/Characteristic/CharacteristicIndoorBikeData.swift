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

        /// More Data not present (is defined opposite of the norm)
        public static let moreData: Flags                       = Flags(rawValue: 1 << 0)
        /// Instantaneous Cadence present
        public static let instantaneousCadencePresent: Flags    = Flags(rawValue: 1 << 1)
        /// Average Speed present
        public static let averageSpeedPresent: Flags            = Flags(rawValue: 1 << 2)
        /// Average Candence present
        public static let averageCadencePresent: Flags          = Flags(rawValue: 1 << 3)
        /// Total Distance Present
        public static let totalDistancePresent: Flags           = Flags(rawValue: 1 << 4)
        /// Resistance Level present
        public static let resistanceLevelPresent: Flags         = Flags(rawValue: 1 << 5)
        /// Instantaneous Power present
        public static let instantaneousPowerPresent: Flags      = Flags(rawValue: 1 << 6)
        /// Average Power present
        public static let averagePowerPresent: Flags            = Flags(rawValue: 1 << 7)
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

    /// Creates Indoor Bike Data Characteristic
    ///
    /// - Parameters:
    ///   - instantaneousSpeed: Instantaneous Speed
    ///   - averageSpeed: Average Speed
    ///   - instantaneousCadence: Instantaneous Cadence
    ///   - averageCadence: Average Cadence
    ///   - totalDistance: Total Distance
    ///   - resistanceLevel: Instantaneous Power
    ///   - instantaneousPower: Instantaneous Power
    ///   - averagePower: Average Power
    ///   - energy: Energy Information
    ///   - heartRate: Heart Rate
    ///   - metabolicEquivalent: Metabolic Equivalent
    ///   - time: Time Information
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

        super.init(name: CharacteristicIndoorBikeData.name,
                   uuidString: CharacteristicIndoorBikeData.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicIndoorBikeData {

        var decoder = DataDecoder(data)

        let flags = Flags(rawValue: decoder.decodeUInt16())

        var iSpeed: Measurement<UnitSpeed>?
        var avgSpeed: Measurement<UnitSpeed>?
        var instantaneousCadence: Measurement<UnitCadence>?
        var averageCadence: Measurement<UnitCadence>?
        var totalDistance: Measurement<UnitLength>?
        var resistanceLevel: Double?
        var iPower: Measurement<UnitPower>?
        var aPower: Measurement<UnitPower>?
        var totalEnergy: Measurement<UnitEnergy>?
        var energyPerHour: Measurement<UnitEnergy>?
        var energyPerMinute: Measurement<UnitEnergy>?
        var heartRate: UInt8?
        var mets: Double?
        var elapsedTime: Measurement<UnitDuration>?
        var remainingTime: Measurement<UnitDuration>?

        /// Available only when More data is NOT present
        if flags.contains(.moreData) == false {
            
            let value = Double(decoder.decodeUInt16()) * 0.01
            iSpeed = Measurement(value: value, unit: UnitSpeed.kilometersPerHour)

        } else {

            if flags.contains(.averageSpeedPresent) == true {
                let value = Double(decoder.decodeUInt16()) * 0.01
                avgSpeed = Measurement(value: value, unit: UnitSpeed.kilometersPerHour)
            }

            if flags.contains(.instantaneousCadencePresent) == true {
                let value = Double(decoder.decodeUInt16()) * 0.5
                instantaneousCadence = Measurement(value: value, unit: UnitCadence.revolutionsPerMinute)
            }

            if flags.contains(.instantaneousCadencePresent) == true {
                let value = Double(decoder.decodeUInt16()) * 0.5
                averageCadence = Measurement(value: value, unit: UnitCadence.revolutionsPerMinute)
            }

            if flags.contains(.totalDistancePresent) == true {
                let value = Double(decoder.decodeUInt16())
                totalDistance = Measurement(value: value, unit: UnitLength.meters)
            }

            if flags.contains(.resistanceLevelPresent) == true {
                resistanceLevel = Double(decoder.decodeInt16()) * 0.1
            }

            if flags.contains(.instantaneousPowerPresent) == true {
                let value = Double(decoder.decodeInt16())
                iPower = Measurement(value: value, unit: UnitPower.watts)
            }

            if flags.contains(.averagePowerPresent) == true {
                let value = Double(decoder.decodeInt16())
                aPower = Measurement(value: value, unit: UnitPower.watts)
            }

            if flags.contains(.expendedEnergyPresent) == true {
                let total = decoder.decodeUInt16()
                let perHour = decoder.decodeUInt16()
                let perMin = decoder.decodeUInt16()

                if total != FitnessMachineEnergy.energyNotAvailable {
                    let tValue = Double(total)
                    totalEnergy = Measurement(value: tValue, unit: UnitEnergy.kilocalories)
                }

                if perHour != FitnessMachineEnergy.energyNotAvailable {
                    let perHourValue = Double(perHour)
                    energyPerHour = Measurement(value: perHourValue, unit: UnitEnergy.kilocalories)
                }

                if perMin != FitnessMachineEnergy.energyPerMinuteNotAvailable {
                    let perMinValue = Double(perMin)
                    energyPerMinute = Measurement(value: perMinValue, unit: UnitEnergy.kilocalories)
                }
            }

            if flags.contains(.heartRatePresent) == true {
                heartRate = decoder.decodeUInt8()
            }

            if flags.contains(.metabolicEquivalentPresent) == true {
                mets = Double(decoder.decodeUInt8()) * 0.1
            }

            if flags.contains(.elapsedTimePresent) == true {
                let value = Double(decoder.decodeUInt16())
                elapsedTime = Measurement(value: value, unit: UnitDuration.seconds)
            }

            if flags.contains(.remainingTimePresent) == true {
                let value = Double(decoder.decodeUInt16())
                remainingTime = Measurement(value: value, unit: UnitDuration.seconds)
            }

        }

        let energy = FitnessMachineEnergy(total: totalEnergy, perHour: energyPerHour, perMinute: energyPerMinute)
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

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError.init(.unsupported)
    }
}
