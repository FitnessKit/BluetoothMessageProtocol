//
//  CharacteristicFitnessMachineStatus.swift
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


/// BLE Fitness Machine Status Characteristic
///
/// The Fitness Machine Status characteristic is used to send the status of the Server
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicFitnessMachineStatus: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Fitness Machine Status"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2ADA"
    }

    /// Fitness Machine Status Value
    ///
    /// Nil value represents a unknown Status Code
    private(set) public var status: FitnessMachineStatus?

    /// Creates Fitness Machine Status Characteristic
    ///
    /// - Parameters:
    ///   - status: Fitness Machine Status Value
    public init(status: FitnessMachineStatus?) {

        self.status = status

        super.init(name: CharacteristicFitnessMachineStatus.name,
                   uuidString: CharacteristicFitnessMachineStatus.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicFitnessMachineStatus {
        var decoder = DataDecoder(data)

        var statusValue: FitnessMachineStatus?

        let opCode = FitnessMachineStatusCode(rawValue: decoder.decodeUInt8())

        if let opCode = opCode {
            switch opCode {
            case .stopPauseByUser:
                let control = FitnessMachineStatusStopPause.Control(rawValue: decoder.decodeUInt8()) ?? .reserved
                statusValue = FitnessMachineStatusStopPause(code: opCode, controlInformation: control)

            case .targetSpeedChanged:
                let value = Double(decoder.decodeUInt16())  * 0.01
                let speed: Measurement = Measurement(value: value, unit: UnitSpeed.kilometersPerHour)
                statusValue = FitnessMachineStatusTargetSpeed(code: opCode, speed: speed)

            case .targetInclineChanaged:
                let value = Double(decoder.decodeInt16()) * 0.1
                let incline: Measurement = Measurement(value: value, unit: UnitPercent.percent)
                statusValue = FitnessMachineStatusTargetIncline(code: opCode, incline: incline)

            case .targetResistanceLevelChanged:
                let level = Double(decoder.decodeUInt8()) * 0.1
                statusValue = FitnessMachineStatusTargetResistanceLevel(code: opCode, resistanceLevel: level)

            case .targetPowerChanged:
                let value = Double(decoder.decodeInt16())
                let power = Measurement(value: value, unit: UnitPower.watts)
                statusValue = FitnessMachineStatusTargetPower(code: opCode, power: power)

            case .targetHeartRateChanged:
                let hr = decoder.decodeUInt8()
                statusValue = FitnessMachineStatusTargetHeartRate(code: opCode, heartrate: hr)

            case .targetedExpendedEnergyChanged:
                let value = Double(decoder.decodeUInt16())
                let energy = Measurement(value: value, unit: UnitEnergy.calories)
                statusValue = FitnessMachineStatusTargetedExpendedEnergyChanged(code: opCode, energy: energy)

            case .targetedStepsChanged:
                let value = decoder.decodeUInt16()
                statusValue = FitnessMachineStatusTargetedSteps(code: opCode, steps: value)

            case .targetedStridesChanged:
                let value = decoder.decodeUInt16()
                statusValue = FitnessMachineStatusTargetedStrides(code: opCode, strides: value)

            case .targetedDistanceChanged:
                let value = Double(decoder.decodeUInt24())
                let distance = Measurement(value: value, unit: UnitLength.meters)
                statusValue = FitnessMachineStatusTargetedDistance(code: opCode, distance: distance)

            case .targetedTrainingTimeChanged:
                let value = Double(decoder.decodeUInt16())
                let time = Measurement(value: value, unit: UnitDuration.seconds)
                statusValue = FitnessMachineStatusTargetedTrainingTime(code: opCode, time: time)

            case .wheelCircumferenceChanged:
                let value = Double(decoder.decodeUInt16()) * 0.1
                let circumference = Measurement(value: value, unit: UnitLength.millimeters)
                statusValue = FitnessMachineStatusWheelCircumference(code: opCode, circumference: circumference)

            case .spinDownStatus:
                let status = FitnessMachineStatusSpinDown.SpinDownStatus(rawValue: decoder.decodeUInt8()) ?? .reserved
                statusValue = FitnessMachineStatusSpinDown(code: opCode, status: status)

            case .targetedCadenceChanged:
                let value = Double(decoder.decodeUInt16()) * 0.5
                statusValue = FitnessMachineStatusTargetedCadence(code: opCode, cadence: value)

            default:
                statusValue = FitnessMachineStatusGeneric(code: opCode)
            }
        }

        return CharacteristicFitnessMachineStatus(status: statusValue)
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
