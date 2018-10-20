//
//  FitnessMachineTypes.swift
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

/// Fitness Machine Movement Direction
public enum FitnessMachineMovementDirection {
    /// Forward
    case forward
    /// Backward
    case backward
}

/// Fitness Machine Stop/Pause Type
///
/// Used in Control Point and Status
public enum FitnessMachineStopPauseType: UInt8 {
    /// Reserved
    case reserved       = 0
    /// Stop
    case stop           = 1
    /// Pause
    case pause          = 2
}

/// Fitness Machine Time Information
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineTime {

    /// Elapsed Time
    private(set) public var elapsed: Measurement<UnitDuration>?

    /// Remaining Time
    private(set) public var remaining: Measurement<UnitDuration>?
}

/// Fitness Machine Energy Information
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineEnergy {

    /// Energy Data Not available
    internal static let energyNotAvailable: UInt16 = UInt16.max
    
    /// Energy Per Minute Data Not available
    internal static let energyPerMinuteNotAvailable: UInt8 = UInt8.max

    /// Total Energy
    private(set) public var total: Measurement<UnitEnergy>?

    /// Energy Per Hour
    private(set) public var perHour: Measurement<UnitEnergy>?

    /// Energy Per Minute
    private(set) public var perMinute: Measurement<UnitEnergy>?
}

internal extension FitnessMachineEnergy {

    internal static func decode(_ data: Data, decoder: inout DecodeData) throws -> FitnessMachineEnergy {
        var totalEnergy: Measurement<UnitEnergy>?
        var energyPerHour: Measurement<UnitEnergy>?
        var energyPerMinute: Measurement<UnitEnergy>?

        let total = decoder.decodeUInt16(data)
        let perHour = decoder.decodeUInt16(data)
        let perMin = decoder.decodeUInt8(data)

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

        return FitnessMachineEnergy(total: totalEnergy, perHour: energyPerHour, perMinute: energyPerMinute)
    }

}

/// Fitness Machine Inclination Type
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineInclinationType {

    /// Target Incline
    private(set) public var incline: Measurement<UnitPercent>

    internal static func create(_ value: Int16) -> FitnessMachineInclinationType {
        let value = value.resolution(0.1)
        let incline: Measurement = Measurement(value: value, unit: UnitPercent.percent)
        return FitnessMachineInclinationType(incline: incline)
    }

    internal func encode() throws -> Data {
        var msgData = Data()

        let incline = self.incline.value.resolution(1 / 0.1)
        let value = Int16(incline)

        msgData.append(Data(from: value.littleEndian))

        return msgData
    }
}

/// Fitness Machine Power Type
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachinePowerType {

    /// Power
    private(set) public var power: Measurement<UnitPower>

    internal static func create(_ value: Int16) -> FitnessMachinePowerType {

        let pvalue = Double(value)
        let power = Measurement(value: pvalue, unit: UnitPower.watts)
        return FitnessMachinePowerType(power: power)
    }

    internal func encode() throws -> Data {
        var msgData = Data()

        let power = self.power.converted(to: UnitPower.watts).value
        let value = Int16(power)

        msgData.append(Data(from: value.littleEndian))

        return msgData
    }
}

/// Fitness Machine Speed Type
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineSpeedType {

    /// Speed
    private(set) public var speed: Measurement<UnitSpeed>

    internal static func create(_ value: UInt16) -> FitnessMachineSpeedType {
        let value = value.resolution(0.01)
        let speed: Measurement = Measurement(value: value, unit: UnitSpeed.kilometersPerHour)
        return FitnessMachineSpeedType(speed: speed)
    }

    internal func encode() throws -> Data {
        var msgData = Data()

        let newSpeed = speed.converted(to: UnitSpeed.kilometersPerHour).value.resolution(1 / 0.01)
        let value = UInt16(newSpeed)

        msgData.append(Data(from: value.littleEndian))

        return msgData
    }
}

/// Fitness Machine Wheel Circumference Type
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineWheelCircumferenceType {

    /// Wheel Circumference
    private(set) public var circumference: Measurement<UnitLength>

    internal static func create(_ value: UInt16) -> FitnessMachineWheelCircumferenceType {
        let value = value.resolution(0.1)
        let circumference: Measurement = Measurement(value: value, unit: UnitLength.millimeters)
        return FitnessMachineWheelCircumferenceType(circumference: circumference)
    }

    internal func encode() throws -> Data {
        var msgData = Data()

        let circumference = self.circumference.converted(to: UnitLength.millimeters).value.resolution(1 / 0.1)
        let value = UInt16(circumference)

        msgData.append(Data(from: value.littleEndian))

        return msgData
    }
}
