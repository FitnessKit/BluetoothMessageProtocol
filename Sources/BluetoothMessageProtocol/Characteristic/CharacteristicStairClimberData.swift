//
//  CharacteristicStairClimberData.swift
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

/// BLE Stair Climber Data Characteristic
///
/// The Stair Climber Data characteristic is used to send training-related data to the Client from a stair climber (Server).
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicStairClimberData: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Stair Climber Data"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2AD0"
    }

    /// Flags
    private struct Flags: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }

        public static let moreData: Flags                       = Flags(rawValue: 1 << 0)
        public static let stepPerMinutePresent: Flags           = Flags(rawValue: 1 << 1)
        public static let averageStepRatePresent: Flags         = Flags(rawValue: 1 << 2)
        public static let positiveElevationGainPresent: Flags   = Flags(rawValue: 1 << 3)
        public static let strideCountPresent: Flags             = Flags(rawValue: 1 << 4)
        public static let expendedEnergyPresent: Flags          = Flags(rawValue: 1 << 5)
        public static let heartRatePresent: Flags               = Flags(rawValue: 1 << 6)
        public static let metabolicEquivalentPresent: Flags     = Flags(rawValue: 1 << 7)
        public static let elapsedTimePresent: Flags             = Flags(rawValue: 1 << 8)
        public static let remainingTimePresent: Flags           = Flags(rawValue: 1 << 9)
    }


    /// Floors
    private(set) public var floors: UInt16?

    /// Step Per Minute
    private(set) public var stepsPerMinute: Measurement<UnitCadence>?

    /// Average Step Rate
    private(set) public var averageStepRate: Measurement<UnitCadence>?

    /// Positive Elevation Gain
    private(set) public var positiveElevationGain: Measurement<UnitLength>?

    /// Stride Count
    private(set) public var strideCount: UInt16?

    /// Energy Information
    private(set) public var energy: FitnessMachineEnergy

    /// Heart Rate
    private(set) public var heartRate: Measurement<UnitCadence>?

    /// Metabolic Equivalent
    private(set) public var metabolicEquivalent: Double?

    /// Time Information
    private(set) public var time: FitnessMachineTime


    public init(floors: UInt16?, stepsPerMinute: Measurement<UnitCadence>?, averageStepRate: Measurement<UnitCadence>?, positiveElevationGain: Measurement<UnitLength>?, strideCount: UInt16?, energy: FitnessMachineEnergy, heartRate: UInt8?, metabolicEquivalent: Double?, time: FitnessMachineTime) {

        self.floors = floors
        self.stepsPerMinute = stepsPerMinute
        self.averageStepRate = averageStepRate
        self.positiveElevationGain = positiveElevationGain
        self.strideCount = strideCount
        self.energy = energy

        if let hRate = heartRate {
            self.heartRate = Measurement(value: Double(hRate), unit: UnitCadence.beatsPerMinute)
        } else {
            self.heartRate = nil
        }

        self.metabolicEquivalent = metabolicEquivalent
        self.time = time

        super.init(name: CharacteristicStairClimberData.name, uuidString: CharacteristicStairClimberData.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicStairClimberData {

        var decoder = DataDecoder(data)

        let flags = Flags(rawValue: decoder.decodeUInt16())

        var floors: UInt16?
        if flags.contains(.moreData) == true {
            floors = decoder.decodeUInt16()
        }

        var stepsPerMinute: Measurement<UnitCadence>?
        if flags.contains(.stepPerMinutePresent) == true {
            let value = Double(decoder.decodeUInt16())
            stepsPerMinute = Measurement(value: value, unit: UnitCadence.stepsPerMinute)
        }

        var averageStepRate: Measurement<UnitCadence>?
        if flags.contains(.averageStepRatePresent) == true {
            let value = Double(decoder.decodeUInt16())
            averageStepRate = Measurement(value: value, unit: UnitCadence.stepsPerMinute)
        }

        var positiveElevationGain: Measurement<UnitLength>?
        if flags.contains(.positiveElevationGainPresent) == true {
            let value = Double(decoder.decodeUInt16())
            positiveElevationGain = Measurement(value: value, unit: UnitLength.meters)
        }

        var strideCount: UInt16?
        if flags.contains(.strideCountPresent) == true {
            strideCount = decoder.decodeUInt16()
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

        return CharacteristicStairClimberData(floors: floors,
                                              stepsPerMinute: stepsPerMinute,
                                              averageStepRate: averageStepRate,
                                              positiveElevationGain: positiveElevationGain,
                                              strideCount: strideCount,
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
