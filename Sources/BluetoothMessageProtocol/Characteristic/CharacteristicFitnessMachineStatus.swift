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
                let control = FitnessMachineStopPauseType(rawValue: decoder.decodeUInt8()) ?? .reserved
                statusValue = FitnessMachineStatusStopPause(controlInformation: control)

            case .targetSpeedChanged:
                let speed = FitnessMachineSpeedType.create(decoder.decodeUInt16())
                statusValue = FitnessMachineStatusTargetSpeed(speed: speed)

            case .targetInclineChanaged:
                let incline = FitnessMachineInclinationType.create(decoder.decodeInt16())
                statusValue = FitnessMachineStatusTargetIncline(incline: incline)

            case .targetResistanceLevelChanged:
                let rLevel = FitnessMachineTargetResistanceLevelType.create(decoder.decodeInt16())
                statusValue = FitnessMachineStatusTargetResistanceLevel(resistanceLevel: rLevel)

            case .targetPowerChanged:
                let power = FitnessMachinePowerType.create(decoder.decodeInt16())
                statusValue = FitnessMachineStatusTargetPower(power: power)

            case .targetHeartRateChanged:
                let hr = decoder.decodeUInt8()
                statusValue = FitnessMachineStatusTargetHeartRate(heartrate: hr)

            case .targetedExpendedEnergyChanged:
                let energy = FitnessMachineTargetExpendedEnergy.create(decoder.decodeUInt16())
                statusValue = FitnessMachineStatusTargetedExpendedEnergyChanged(energy: energy)

            case .targetedStepsChanged:
                let value = decoder.decodeUInt16()
                statusValue = FitnessMachineStatusTargetedSteps(steps: value)

            case .targetedStridesChanged:
                let value = decoder.decodeUInt16()
                statusValue = FitnessMachineStatusTargetedStrides(strides: value)

            case .targetedDistanceChanged:
                let distance = FitnessMachineTargetDistance.create(UInt32(decoder.decodeUInt24()))
                statusValue = FitnessMachineStatusTargetedDistance(distance: distance)

            case .targetedTrainingTimeChanged:
                let time = FitnessMachineTargetTime.create(decoder.decodeUInt16())
                statusValue = FitnessMachineStatusTargetedTrainingTime(time: time)

            case .targetedTimeInTwoHrZoneChanged:
                let burn = decoder.decodeUInt16()
                let fitness = decoder.decodeUInt16()
                let time = FitnessMachineTargetTimeInTwoHrZone.create(fatBurnZone: burn, fitnessZone: fitness)
                statusValue = FitnessMachineStatusTargetedTimeInTwoHrZoneChanged(time: time)

            case .targetedTimeInThreeHrZoneChanged:
                let light = decoder.decodeUInt16()
                let moderate = decoder.decodeUInt16()
                let hard = decoder.decodeUInt16()
                let time = FitnessMachineTargetTimeInThreeHrZone.create(lightZone: light,
                                                                        moderateZone: moderate,
                                                                        hardZone: hard)
                statusValue = FitnessMachineStatusTargetedTimeInThreeHrZoneChanged(time: time)

            case .targetedTimeInFiveHrZoneChanged:
                let veryLight = decoder.decodeUInt16()
                let light = decoder.decodeUInt16()
                let moderate = decoder.decodeUInt16()
                let hard = decoder.decodeUInt16()
                let max = decoder.decodeUInt16()
                let time = FitnessMachineTargetTimeInFiveHrZone.create(veryLightZone: veryLight,
                                                                       lightZone: light,
                                                                       moderateZone: moderate,
                                                                       hardZone: hard,
                                                                       maximumZone: max)
                statusValue = FitnessMachineStatusTargetedTimeInFiveHrZoneChanged(time: time)


            case .wheelCircumferenceChanged:
                let circumference = FitnessMachineWheelCircumferenceType.create(decoder.decodeUInt16())
                statusValue = FitnessMachineStatusWheelCircumference(circumference: circumference)

            case .spinDownStatus:
                let status = FitnessMachineStatusSpinDown.SpinDownStatus(rawValue: decoder.decodeUInt8()) ?? .reserved
                statusValue = FitnessMachineStatusSpinDown(status: status)

            case .targetedCadenceChanged:
                let cadence = FitnessMachineTargetCadence.create(decoder.decodeUInt16())
                statusValue = FitnessMachineStatusTargetedCadence(cadence: cadence)

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
