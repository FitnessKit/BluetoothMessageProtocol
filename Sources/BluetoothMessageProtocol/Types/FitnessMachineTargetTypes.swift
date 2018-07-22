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
public struct FitnessMachineTargetResistanceLevelType {

    /// Target Resistance Level
    private(set) public var level: Double

    internal static func create(_ value: Int16) -> FitnessMachineTargetResistanceLevelType {
        /// Per ESR11
        /// E9135 – Resistance level format is SINT16
        let level = value.resolution(0.1)
        return FitnessMachineTargetResistanceLevelType(level: level)
    }

    internal func encode() throws -> Data {
        var msgData = Data()

        let resitance = self.level.resolution(1 / 0.1)
        let value = Int16(resitance)

        msgData.append(Data(from: value.littleEndian))

        return msgData
    }
}

/// Fitness Machine Target Expended Energy
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineTargetExpendedEnergy {

    /// Target Expended Energy
    private(set) public var energy: Measurement<UnitEnergy>

    internal static func create(_ value: UInt16) -> FitnessMachineTargetExpendedEnergy {
        let value = Double(value)
        let energy = Measurement(value: value, unit: UnitEnergy.calories)
        return FitnessMachineTargetExpendedEnergy(energy: energy)
    }

    internal func encode() throws -> Data {
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
public struct FitnessMachineTargetDistance {

    /// Target Distance
    private(set) public var energy: Measurement<UnitLength>

    internal static func create(_ value: UInt32) -> FitnessMachineTargetDistance {
        let value = Double(value)
        let energy = Measurement(value: value, unit: UnitLength.meters)
        return FitnessMachineTargetDistance(energy: energy)
    }

    internal func encode() throws -> Data {
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
public struct FitnessMachineTargetTime {

    /// Target Time
    private(set) public var time: Measurement<UnitDuration>

    internal static func create(_ value: UInt16) -> FitnessMachineTargetTime {
        let value = Double(value)
        let time = Measurement(value: value, unit: UnitDuration.seconds)
        return FitnessMachineTargetTime(time: time)
    }

    internal func encode() throws -> Data {
        var msgData = Data()

        let time = self.time.converted(to: UnitDuration.seconds).value
        let value = UInt16(time)

        msgData.append(Data(from: value.littleEndian))

        return msgData
    }
}

/// Fitness Machine Target Time in Two HR Zone
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineTargetTimeInTwoHrZone {

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

    internal func encode() throws -> Data {
        var msgData = Data()

        let fatBurnZone = self.fatBurnZone.converted(to: UnitDuration.seconds).value
        let fatBurnZoneValue = UInt16(fatBurnZone)

        let fitnessZone = self.fitnessZone.converted(to: UnitDuration.seconds).value
        let fitnessZoneValue = UInt16(fitnessZone)

        msgData.append(Data(from: fatBurnZoneValue.littleEndian))
        msgData.append(Data(from: fitnessZoneValue.littleEndian))

        return msgData
    }
}

/// Fitness Machine Target Time in Three HR Zone
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineTargetTimeInThreeHrZone {

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

    internal func encode() throws -> Data {
        var msgData = Data()

        let lightZone = self.lightZone.converted(to: UnitDuration.seconds).value
        let lightZoneValue = UInt16(lightZone)

        let moderateZone = self.moderateZone.converted(to: UnitDuration.seconds).value
        let moderateZoneValue = UInt16(moderateZone)

        let hardZone = self.hardZone.converted(to: UnitDuration.seconds).value
        let hardZoneValue = UInt16(hardZone)

        msgData.append(Data(from: lightZoneValue.littleEndian))
        msgData.append(Data(from: moderateZoneValue.littleEndian))
        msgData.append(Data(from: hardZoneValue.littleEndian))

        return msgData
    }
}

/// Fitness Machine Target Time in Five HR Zone
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineTargetTimeInFiveHrZone {

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

    internal func encode() throws -> Data {
        var msgData = Data()

        let veryLightZone = self.veryLightZone.converted(to: UnitDuration.seconds).value
        let veryLightZoneValue = UInt16(veryLightZone)

        let lightZone = self.lightZone.converted(to: UnitDuration.seconds).value
        let lightZoneValue = UInt16(lightZone)

        let moderateZone = self.moderateZone.converted(to: UnitDuration.seconds).value
        let moderateZoneValue = UInt16(moderateZone)

        let hardZone = self.hardZone.converted(to: UnitDuration.seconds).value
        let hardZoneValue = UInt16(hardZone)

        let maximumZone = self.maximumZone.converted(to: UnitDuration.seconds).value
        let maximumZoneValue = UInt16(maximumZone)

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
public struct FitnessMachineTargetCadence {

    /// Target Cadence
    ///
    /// Units 1/minute
    private(set) public var cadence: Double

    internal static func create(_ value: UInt16) -> FitnessMachineTargetCadence {
        let value = value.resolution(0.5)
        return FitnessMachineTargetCadence(cadence: value)
    }

    internal func encode() throws -> Data {
        var msgData = Data()

        let cadence = self.cadence.resolution(1 / 0.5)
        let value = UInt16(cadence)

        msgData.append(Data(from: value.littleEndian))

        return msgData
    }
}
