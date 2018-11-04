//
//  CharacteristicStepClimberData.swift
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

/// BLE Step Climber Data Characteristic
///
/// The Step Climber Data characteristic is used to send training-related data
/// to the Client from a step climber (Server).
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicStepClimberData: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Step Climber Data"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2ACF"
    }

    /// Flags
    private struct Flags: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }

        /// More Data not present (is defined opposite of the norm)
        public static let moreData                       = Flags(rawValue: 1 << 0)
        /// Step per Minute present
        public static let stepPerMinutePresent           = Flags(rawValue: 1 << 1)
        /// Average Step Rate Present
        public static let averageStepRatePresent         = Flags(rawValue: 1 << 2)
        /// Positive Elevation Gain present
        public static let positiveElevationGainPresent   = Flags(rawValue: 1 << 3)
        /// Expended Energy present
        public static let expendedEnergyPresent          = Flags(rawValue: 1 << 4)
        /// Heart Rate present
        public static let heartRatePresent               = Flags(rawValue: 1 << 5)
        /// Metabolic Equivalent present
        public static let metabolicEquivalentPresent     = Flags(rawValue: 1 << 6)
        /// Elapsed Time present
        public static let elapsedTimePresent             = Flags(rawValue: 1 << 7)
        /// Remaining Time present
        public static let remainingTimePresent           = Flags(rawValue: 1 << 8)
    }

    /// Floors
    private(set) public var floors: UInt16?

    /// Step Count
    private(set) public var stepCount: UInt16?

    /// Step Per Minute
    private(set) public var stepsPerMinute: Measurement<UnitCadence>?

    /// Average Step Rate
    private(set) public var averageStepRate: Measurement<UnitCadence>?

    /// Positive Elevation Gain
    private(set) public var positiveElevationGain: Measurement<UnitLength>?

    /// Energy Information
    private(set) public var energy: FitnessMachineEnergy

    /// Heart Rate
    private(set) public var heartRate: Measurement<UnitCadence>?

    /// Metabolic Equivalent
    private(set) public var metabolicEquivalent: Double?

    /// Time Information
    private(set) public var time: FitnessMachineTime

    /// Creates Step Climber Data Characteristic
    ///
    /// - Parameters:
    ///   - floors: Floors climbed
    ///   - stepCount: Step Count
    ///   - stepsPerMinute: Step Per Minute
    ///   - averageStepRate: Average Step Rate
    ///   - positiveElevationGain: Positive Elevation Gain
    ///   - energy: Energy Information
    ///   - heartRate: Heart Rate
    ///   - metabolicEquivalent: Metabolic Equivalent
    ///   - time: Time Information
    public init(floors: UInt16?,
                stepCount: UInt16?,
                stepsPerMinute: Measurement<UnitCadence>?,
                averageStepRate: Measurement<UnitCadence>?,
                positiveElevationGain: Measurement<UnitLength>?,
                energy: FitnessMachineEnergy,
                heartRate: UInt8?,
                metabolicEquivalent: Double?,
                time: FitnessMachineTime) {
        
        self.floors = floors
        self.stepCount = stepCount
        self.stepsPerMinute = stepsPerMinute
        self.averageStepRate = averageStepRate
        self.positiveElevationGain = positiveElevationGain
        self.energy = energy

        if let hRate = heartRate {
            self.heartRate = Measurement(value: Double(hRate), unit: UnitCadence.beatsPerMinute)
        } else {
            self.heartRate = nil
        }

        self.metabolicEquivalent = metabolicEquivalent
        self.time = time

        super.init(name: CharacteristicStepClimberData.name,
                   uuidString: CharacteristicStepClimberData.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicStepClimberData {

        var decoder = DecodeData()

        let flags = Flags(rawValue: decoder.decodeUInt16(data))

        var floors: UInt16?
        var stepCount: UInt16?
        /// Available only when More data is NOT present
        if flags.contains(.moreData) == false {
            floors = decoder.decodeUInt16(data)
            stepCount = decoder.decodeUInt16(data)
        }

        let stepsPerMinute = try decodeCadence(supported: flags,
                                               flag: .stepPerMinutePresent,
                                               unit: UnitCadence.stepsPerMinute,
                                               data: data, decoder: &decoder)

        let averageStepRate = try decodeCadence(supported: flags,
                                                flag: .averageStepRatePresent,
                                                unit: UnitCadence.stepsPerMinute,
                                                data: data, decoder: &decoder)

        var positiveElevationGain: Measurement<UnitLength>?
        if flags.contains(.positiveElevationGainPresent) {
            let value = Double(decoder.decodeUInt16(data))
            positiveElevationGain = Measurement(value: value, unit: UnitLength.meters)
        }

        var fitEnergy: FitnessMachineEnergy
        if flags.contains(.expendedEnergyPresent) {
            fitEnergy = try FitnessMachineEnergy.decode(data, decoder: &decoder)
        } else {
            fitEnergy = FitnessMachineEnergy(total: nil, perHour: nil, perMinute: nil)
        }

        var heartRate: UInt8?
        if flags.contains(.heartRatePresent) {
            heartRate = decoder.decodeUInt8(data)
        }

        var mets: Double?
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

        return CharacteristicStepClimberData(floors: floors,
                                             stepCount: stepCount,
                                             stepsPerMinute: stepsPerMinute,
                                             averageStepRate: averageStepRate,
                                             positiveElevationGain: positiveElevationGain,
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

private extension CharacteristicStepClimberData {

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
            let value = Double(decoder.decodeUInt16(data))
            cadenceValue = Measurement(value: value, unit: unit)
        }
        return cadenceValue
    }

    /// Decode Duration Data
    ///
    /// - Parameters:
    ///   - supported: Supported Flags
    ///   - flag: Flags contained
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

        var durationData: Measurement<UnitDuration>?
        if supported.contains(flag) {
            let value = Double(decoder.decodeUInt16(data))
            durationData = Measurement(value: value, unit: unit)
        }
        return durationData
    }
}
