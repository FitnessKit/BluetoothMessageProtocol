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
/// The Indoor Bike Data characteristic is used to send training-related data to
/// the Client from an indoor bike (Server).
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
        public static let moreData                      = Flags(rawValue: 1 << 0)
        /// Average Speed present
        public static let averageSpeedPresent           = Flags(rawValue: 1 << 1)
        /// Instantaneous Cadence present
        public static let instantaneousCadencePresent   = Flags(rawValue: 1 << 2)
        /// Average Candence present
        public static let averageCadencePresent         = Flags(rawValue: 1 << 3)
        /// Total Distance Present
        public static let totalDistancePresent          = Flags(rawValue: 1 << 4)
        /// Resistance Level present
        public static let resistanceLevelPresent        = Flags(rawValue: 1 << 5)
        /// Instantaneous Power present
        public static let instantaneousPowerPresent     = Flags(rawValue: 1 << 6)
        /// Average Power present
        public static let averagePowerPresent           = Flags(rawValue: 1 << 7)
        /// Expended Energy present
        public static let expendedEnergyPresent         = Flags(rawValue: 1 << 8)
        /// Heart Rate present
        public static let heartRatePresent              = Flags(rawValue: 1 << 9)
        /// Metabolic Equivalent present
        public static let metabolicEquivalentPresent    = Flags(rawValue: 1 << 10)
        /// Elapsed Time present
        public static let elapsedTimePresent            = Flags(rawValue: 1 << 11)
        /// Remaining Time present
        public static let remainingTimePresent          = Flags(rawValue: 1 << 12)
    }

    /// Instantaneous Speed
    private(set) public var instantaneousSpeed: FitnessMachineSpeedType?

    /// Average Speed
    private(set) public var averageSpeed: FitnessMachineSpeedType?

    /// Instantaneous Cadence
    private(set) public var instantaneousCadence: Measurement<UnitCadence>?

    /// Average Cadence
    private(set) public var averageCadence: Measurement<UnitCadence>?

    /// Total Distance
    private(set) public var totalDistance: Measurement<UnitLength>?

    /// Resistance Level
    private(set) public var resistanceLevel: Double?

    /// Instantaneous Power
    private(set) public var instantaneousPower: FitnessMachinePowerType?

    /// Average Power
    private(set) public var averagePower: FitnessMachinePowerType?

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
    public init(instantaneousSpeed: FitnessMachineSpeedType?,
                averageSpeed: FitnessMachineSpeedType?,
                instantaneousCadence: Measurement<UnitCadence>?,
                averageCadence: Measurement<UnitCadence>?,
                totalDistance: Measurement<UnitLength>?,
                resistanceLevel: Double?,
                instantaneousPower: FitnessMachinePowerType?,
                averagePower: FitnessMachinePowerType?,
                energy: FitnessMachineEnergy,
                heartRate: UInt8?,
                metabolicEquivalent: Double?,
                time: FitnessMachineTime) {
        
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
        var decoder = DecodeData()

        let flags = Flags(rawValue: decoder.decodeUInt16(data))

        var heartRate: UInt8?
        var mets: Double?

        var iSpeed: FitnessMachineSpeedType?
        /// Available only when More data is NOT present
        if flags.contains(.moreData) == false {
            iSpeed = FitnessMachineSpeedType.create(decoder.decodeUInt16(data))
        }

        var avgSpeed: FitnessMachineSpeedType?
        if flags.contains(.averageSpeedPresent) {
            avgSpeed = FitnessMachineSpeedType.create(decoder.decodeUInt16(data))
        }

        let instantaneousCadence = try decodeCadence(supported: flags,
                                                     flag: .instantaneousCadencePresent,
                                                     unit: UnitCadence.revolutionsPerMinute,
                                                     data: data, decoder: &decoder)

        let averageCadence = try decodeCadence(supported: flags,
                                               flag: .averageCadencePresent,
                                               unit: UnitCadence.revolutionsPerMinute,
                                               data: data, decoder: &decoder)

        var totalDistance: Measurement<UnitLength>?
        if flags.contains(.totalDistancePresent) {
            let value = Double(decoder.decodeUInt24(data))
            totalDistance = Measurement(value: value, unit: UnitLength.meters)
        }

        var resistanceLevel: Double?
        if flags.contains(.resistanceLevelPresent) {
            resistanceLevel = decoder.decodeInt16(data).resolution(0.1)
        }

        var iPower: FitnessMachinePowerType?
        if flags.contains(.instantaneousPowerPresent) {
            iPower = FitnessMachinePowerType.create(decoder.decodeInt16(data))
        }

        var aPower: FitnessMachinePowerType?
        if flags.contains(.averagePowerPresent) {
            aPower = FitnessMachinePowerType.create(decoder.decodeInt16(data))
        }

        var fitEnergy: FitnessMachineEnergy
        if flags.contains(.expendedEnergyPresent) {
            fitEnergy = try FitnessMachineEnergy.decode(data, decoder: &decoder)
        } else {
            fitEnergy = FitnessMachineEnergy(total: nil, perHour: nil, perMinute: nil)
        }

        if flags.contains(.heartRatePresent) {
            heartRate = decoder.decodeUInt8(data)
        }

        if flags.contains(.metabolicEquivalentPresent) {
            mets = decoder.decodeUInt8(data).resolution(0.1)
        }

        let elapsedTime = try decodeDuration(supported: flags,
                                             flag: .elapsedTimePresent,
                                             unit: UnitDuration.seconds,
                                             data: data, decoder: &decoder)

        let remainingTime = try decodeDuration(supported: flags,
                                               flag: .remainingTimePresent,
                                               unit: UnitDuration.seconds,
                                               data: data, decoder: &decoder)

        let time = FitnessMachineTime(elapsed: elapsedTime, remaining: remainingTime)

        return CharacteristicIndoorBikeData(instantaneousSpeed: iSpeed,
                                            averageSpeed: avgSpeed,
                                            instantaneousCadence: instantaneousCadence,
                                            averageCadence: averageCadence,
                                            totalDistance: totalDistance,
                                            resistanceLevel: resistanceLevel,
                                            instantaneousPower: iPower,
                                            averagePower: aPower,
                                            energy: fitEnergy,
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
        throw BluetoothMessageProtocolError(.unsupported)
    }
}

private extension CharacteristicIndoorBikeData {

    /// Decode Cadence Data
    ///
    /// - Parameters:
    ///   - flag: Flags
    ///   - unit: Cadence Unit
    ///   - data: Sensor Data
    ///   - decoder: Decoder
    /// - Returns: Measurement<UnitCadence>?
    /// - Throws: BluetoothMessageProtocolError
    private class func decodeCadence(supported: Flags,
                                     flag: Flags,
                                     unit: UnitCadence,
                                     data: Data,
                                     decoder: inout DecodeData) throws -> Measurement<UnitCadence>? {

        var cadenceValue: Measurement<UnitCadence>?
        if supported.contains(flag) {
            let value = Double(decoder.decodeUInt16(data)).resolution(0.5)
            cadenceValue = Measurement(value: value, unit: unit)
        }
        return cadenceValue
    }

    /// Decode Duration Data
    ///
    /// - Parameters:
    ///   - flag: Flags
    ///   - unit: Duration Unit
    ///   - data: Sensor Data
    ///   - decoder: Decoder
    /// - Returns: Measurement<UnitDuration>?
    /// - Throws: BluetoothMessageProtocolError
    private class func decodeDuration(supported: Flags,
                                      flag: Flags,
                                      unit: UnitDuration,
                                      data: Data,
                                      decoder: inout DecodeData) throws -> Measurement<UnitDuration>? {

        var durationDat: Measurement<UnitDuration>?
        if supported.contains(flag) {
            let value = Double(decoder.decodeUInt16(data))
            durationDat = Measurement(value: value, unit: unit)
        }
        return durationDat
    }
}
