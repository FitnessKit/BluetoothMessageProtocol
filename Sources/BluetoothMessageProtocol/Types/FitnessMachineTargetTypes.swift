//
//  FitnessMachineTargetTypes.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 2/24/18.
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

/// Fitness Machine Target Resistance Level Type
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineTargetResistanceLevelType: Hashable {

    /// Target Resistance Level
    private(set) public var level: Double

    internal static func create(_ value: Int16) -> FitnessMachineTargetResistanceLevelType {
        /// Per ESR11
        /// E9135 – Resistance level format is SINT16
        let level = value.resolution(.removing, resolution: .oneTenth)
        return FitnessMachineTargetResistanceLevelType(level: level)
    }

    internal func encode() -> Data {
        var msgData = Data()

        let resitance = self.level.resolution(.adding, resolution: .oneTenth)
        let value = Int16(resitance)

        msgData.append(Data(from: value.littleEndian))

        return msgData
    }
}

/// Fitness Machine Target Expended Energy
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineTargetExpendedEnergy: Hashable {

    /// Target Expended Energy
    private(set) public var energy: Measurement<UnitEnergy>

    internal static func create(_ value: UInt16) -> FitnessMachineTargetExpendedEnergy {
        let value = Double(value)
        let energy = Measurement(value: value, unit: UnitEnergy.calories)
        return FitnessMachineTargetExpendedEnergy(energy: energy)
    }

    internal func encode() -> Data {
        var msgData = Data()

        let energy = self.energy.converted(to: UnitEnergy.calories).value
        let value = UInt16(energy)

        msgData.append(Data(from: value.littleEndian))

        return msgData
    }
}

/// Fitness Machine Target Distance
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineTargetDistance: Hashable {

    /// Target Distance
    private(set) public var energy: Measurement<UnitLength>

    internal static func create(_ value: UInt32) -> FitnessMachineTargetDistance {
        let value = Double(value)
        let energy = Measurement(value: value, unit: UnitLength.meters)
        return FitnessMachineTargetDistance(energy: energy)
    }

    internal func encode() -> Data {
        var msgData = Data()

        let energy = self.energy.converted(to: UnitLength.meters).value
        let value = UInt32(energy)

        let vData = Data(from: value.littleEndian)

        msgData.append(vData[0])
        msgData.append(vData[1])
        msgData.append(vData[2])

        return msgData
    }
}

/// Fitness Machine Target Distance
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineTargetTime: Hashable {

    /// Target Time
    private(set) public var time: Measurement<UnitDuration>

    internal static func create(_ value: UInt16) -> FitnessMachineTargetTime {
        let value = Double(value)
        let time = Measurement(value: value, unit: UnitDuration.seconds)
        return FitnessMachineTargetTime(time: time)
    }

    internal func encode() -> Data {
        var msgData = Data()

        let value = convertDurationToSeconds(self.time)

        msgData.append(Data(from: value.littleEndian))

        return msgData
    }
}

/// Fitness Machine Target Time in Two HR Zone
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineTargetTimeInTwoHrZone: Hashable {

    /// Targeted Time in Fat Burn Zone
    private(set) public var fatBurnZone: Measurement<UnitDuration>

    /// Targeted Time in Fitness Zone
    private(set) public var fitnessZone: Measurement<UnitDuration>

    internal static func create(fatBurnZone: UInt16,
                                fitnessZone: UInt16) -> FitnessMachineTargetTimeInTwoHrZone {

        let time = Measurement(value: Double(fatBurnZone), unit: UnitDuration.seconds)
        let fTime = Measurement(value: Double(fitnessZone), unit: UnitDuration.seconds)
        return FitnessMachineTargetTimeInTwoHrZone(fatBurnZone: time, fitnessZone: fTime)
    }

    internal func encode() -> Data {
        var msgData = Data()

        let fatBurnZoneValue = convertDurationToSeconds(self.fatBurnZone)
        let fitnessZoneValue = convertDurationToSeconds(self.fitnessZone)

        msgData.append(Data(from: fatBurnZoneValue.littleEndian))
        msgData.append(Data(from: fitnessZoneValue.littleEndian))

        return msgData
    }
}

/// Fitness Machine Target Time in Three HR Zone
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineTargetTimeInThreeHrZone: Hashable {

    /// Targeted Time in Light Zone
    private(set) public var lightZone: Measurement<UnitDuration>

    /// Targeted Time in Moderate Zone
    private(set) public var moderateZone: Measurement<UnitDuration>

    /// Targeted Time in Hard Zone
    private(set) public var hardZone: Measurement<UnitDuration>

    internal static func create(lightZone: UInt16,
                                moderateZone: UInt16,
                                hardZone: UInt16) -> FitnessMachineTargetTimeInThreeHrZone {

        let light = Measurement(value: Double(lightZone), unit: UnitDuration.seconds)
        let moderate = Measurement(value: Double(moderateZone), unit: UnitDuration.seconds)
        let hard = Measurement(value: Double(hardZone), unit: UnitDuration.seconds)

        return FitnessMachineTargetTimeInThreeHrZone(lightZone: light,
                                                     moderateZone: moderate,
                                                     hardZone: hard)
    }

    internal func encode() -> Data {
        var msgData = Data()

        let lightZoneValue = convertDurationToSeconds(self.lightZone)
        let moderateZoneValue = convertDurationToSeconds(self.moderateZone)
        let hardZoneValue = convertDurationToSeconds(self.hardZone)

        msgData.append(Data(from: lightZoneValue.littleEndian))
        msgData.append(Data(from: moderateZoneValue.littleEndian))
        msgData.append(Data(from: hardZoneValue.littleEndian))

        return msgData
    }
}

/// Fitness Machine Target Time in Five HR Zone
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineTargetTimeInFiveHrZone: Hashable {

    /// Targeted Time in Very Light Zone
    private(set) public var veryLightZone: Measurement<UnitDuration>

    /// Targeted Time in Light Zone
    private(set) public var lightZone: Measurement<UnitDuration>

    /// Targeted Time in Moderate Zone
    private(set) public var moderateZone: Measurement<UnitDuration>

    /// Targeted Time in Hard Zone
    private(set) public var hardZone: Measurement<UnitDuration>

    /// Targeted Time in Maximum Zone
    private(set) public var maximumZone: Measurement<UnitDuration>

    internal static func create(veryLightZone: UInt16,
                                lightZone: UInt16,
                                moderateZone: UInt16,
                                hardZone: UInt16,
                                maximumZone: UInt16) -> FitnessMachineTargetTimeInFiveHrZone {

        let verylight = Measurement(value: Double(veryLightZone), unit: UnitDuration.seconds)
        let light = Measurement(value: Double(lightZone), unit: UnitDuration.seconds)
        let moderate = Measurement(value: Double(moderateZone), unit: UnitDuration.seconds)
        let hard = Measurement(value: Double(hardZone), unit: UnitDuration.seconds)
        let max = Measurement(value: Double(maximumZone), unit: UnitDuration.seconds)

        return FitnessMachineTargetTimeInFiveHrZone(veryLightZone: verylight,
                                                    lightZone: light,
                                                    moderateZone: moderate,
                                                    hardZone: hard,
                                                    maximumZone: max)
    }

    internal func encode() -> Data {
        var msgData = Data()

        let veryLightZoneValue = convertDurationToSeconds(self.veryLightZone)
        let lightZoneValue = convertDurationToSeconds(self.lightZone)
        let moderateZoneValue = convertDurationToSeconds(self.moderateZone)
        let hardZoneValue = convertDurationToSeconds(self.hardZone)
        let maximumZoneValue = convertDurationToSeconds(self.maximumZone)

        msgData.append(Data(from: veryLightZoneValue.littleEndian))
        msgData.append(Data(from: lightZoneValue.littleEndian))
        msgData.append(Data(from: moderateZoneValue.littleEndian))
        msgData.append(Data(from: hardZoneValue.littleEndian))
        msgData.append(Data(from: maximumZoneValue.littleEndian))

        return msgData
    }
}

/// Fitness Machine Target Cadence
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineTargetCadence: Hashable {

    /// Target Cadence
    ///
    /// Units 1/minute
    private(set) public var cadence: Double

    internal static func create(_ value: UInt16) -> FitnessMachineTargetCadence {
        let value = value.resolution(.removing, resolution: .two)
        return FitnessMachineTargetCadence(cadence: value)
    }

    internal func encode() -> Data {
        var msgData = Data()

        let cadence = self.cadence.resolution(.adding, resolution: .two)
        let value = UInt16(cadence)

        msgData.append(Data(from: value.littleEndian))

        return msgData
    }
}

//MARK: - Helpers
private func convertDurationToSeconds(_ measurement: Measurement<UnitDuration>) -> UInt16 {
    return UInt16(measurement.converted(to: UnitDuration.seconds).value)
}
