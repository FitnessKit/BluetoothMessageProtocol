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
final public class CharacteristicFitnessMachineStatus: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Fitness Machine Status" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2ADA" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
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
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        var statusValue: FitnessMachineStatus?
        
        let opCode = FitnessMachineStatusCode(rawValue: decoder.decodeUInt8(data))
        
        if let opCode = opCode {
            switch opCode {
            case .stopPauseByUser:
                let control = FitnessMachineStopPauseType(rawValue: decoder.decodeUInt8(data)) ?? .reserved
                statusValue = FitnessMachineStatusStopPause(controlInformation: control)
                
            case .targetSpeedChanged:
                let speed = FitnessMachineSpeedType.create(decoder.decodeUInt16(data))
                statusValue = FitnessMachineStatusTargetSpeed(speed: speed)
                
            case .targetInclineChanaged:
                let incline = FitnessMachineInclinationType.create(decoder.decodeInt16(data))
                statusValue = FitnessMachineStatusTargetIncline(incline: incline)
                
            case .targetResistanceLevelChanged:
                let rLevel = FitnessMachineTargetResistanceLevelType.create(decoder.decodeInt16(data))
                statusValue = FitnessMachineStatusTargetResistanceLevel(resistanceLevel: rLevel)
                
            case .targetPowerChanged:
                let power = FitnessMachinePowerType.create(decoder.decodeInt16(data))
                statusValue = FitnessMachineStatusTargetPower(power: power)
                
            case .targetHeartRateChanged:
                let hr = decoder.decodeUInt8(data)
                statusValue = FitnessMachineStatusTargetHeartRate(heartrate: hr)
                
            case .targetedExpendedEnergyChanged:
                let energy = FitnessMachineTargetExpendedEnergy.create(decoder.decodeUInt16(data))
                statusValue = FitnessMachineStatusTargetedExpendedEnergyChanged(energy: energy)
                
            case .targetedStepsChanged:
                let value = decoder.decodeUInt16(data)
                statusValue = FitnessMachineStatusTargetedSteps(steps: value)
                
            case .targetedStridesChanged:
                let value = decoder.decodeUInt16(data)
                statusValue = FitnessMachineStatusTargetedStrides(strides: value)
                
            case .targetedDistanceChanged:
                let distance = FitnessMachineTargetDistance.create(UInt32(decoder.decodeUInt24(data)))
                statusValue = FitnessMachineStatusTargetedDistance(distance: distance)
                
            case .targetedTrainingTimeChanged:
                let time = FitnessMachineTargetTime.create(decoder.decodeUInt16(data))
                statusValue = FitnessMachineStatusTargetedTrainingTime(time: time)
                
            case .targetedTimeInTwoHrZoneChanged:
                return.success(decodeTwoHrZoneChanged(data: data, decoder: &decoder) as! C)
                
            case .targetedTimeInThreeHrZoneChanged:
                return.success(decodeThreeHrZoneChanged(data: data, decoder: &decoder) as! C)
                
            case .targetedTimeInFiveHrZoneChanged:
                return.success(decodeFiveHrZoneChanged(data: data, decoder: &decoder) as! C)
                
            case .wheelCircumferenceChanged:
                let circumference = FitnessMachineWheelCircumferenceType.create(decoder.decodeUInt16(data))
                statusValue = FitnessMachineStatusWheelCircumference(circumference: circumference)
                
            case .spinDownStatus:
                let status = FitnessMachineStatusSpinDown.SpinDownStatus(rawValue: decoder.decodeUInt8(data)) ?? .reserved
                statusValue = FitnessMachineStatusSpinDown(status: status)
                
            case .targetedCadenceChanged:
                let cadence = FitnessMachineTargetCadence.create(decoder.decodeUInt16(data))
                statusValue = FitnessMachineStatusTargetedCadence(cadence: cadence)
                
            default:
                statusValue = FitnessMachineStatusGeneric(code: opCode)
            }
        }
        
        let char = CharacteristicFitnessMachineStatus(status: statusValue)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        /// Not Yet Supported
        return.failure(BluetoothEncodeError.notSupported)
    }
}

private extension CharacteristicFitnessMachineStatus {
    
    /// Decodes the Targeted Time in Two HR Zone Change OpCode
    ///
    /// - Parameters:
    ///   - data: Sensor data
    ///   - decoder: Decoder
    /// - Returns: CharacteristicFitnessMachineStatus
    /// - Throws: BluetoothDecodeError
    private class func decodeTwoHrZoneChanged(data: Data, decoder: inout DecodeData) -> CharacteristicFitnessMachineStatus {
        var statusValue: FitnessMachineStatus?
        
        let burn = decoder.decodeUInt16(data)
        let fitness = decoder.decodeUInt16(data)
        let time = FitnessMachineTargetTimeInTwoHrZone.create(fatBurnZone: burn, fitnessZone: fitness)
        statusValue = FitnessMachineStatusTargetedTimeInTwoHrZoneChanged(time: time)
        
        return CharacteristicFitnessMachineStatus(status: statusValue)
    }
    
    /// Decodes the Targeted Time in Three HR Zone Change OpCode
    ///
    /// - Parameters:
    ///   - data: Sensor data
    ///   - decoder: Decoder
    /// - Returns: CharacteristicFitnessMachineStatus
    /// - Throws: BluetoothDecodeError
    private class func decodeThreeHrZoneChanged(data: Data, decoder: inout DecodeData) -> CharacteristicFitnessMachineStatus {
        var statusValue: FitnessMachineStatus?
        
        let light = decoder.decodeUInt16(data)
        let moderate = decoder.decodeUInt16(data)
        let hard = decoder.decodeUInt16(data)
        let time = FitnessMachineTargetTimeInThreeHrZone.create(lightZone: light,
                                                                moderateZone: moderate,
                                                                hardZone: hard)
        statusValue = FitnessMachineStatusTargetedTimeInThreeHrZoneChanged(time: time)
        
        return CharacteristicFitnessMachineStatus(status: statusValue)
    }
    
    /// Decodes the Targeted Time in Five HR Zone Change OpCode
    ///
    /// - Parameters:
    ///   - data: Sensor data
    ///   - decoder: Decoder
    /// - Returns: CharacteristicFitnessMachineStatus
    /// - Throws: BluetoothDecodeError
    private class func decodeFiveHrZoneChanged(data: Data, decoder: inout DecodeData) -> CharacteristicFitnessMachineStatus {
        var statusValue: FitnessMachineStatus?
        
        let veryLight = decoder.decodeUInt16(data)
        let light = decoder.decodeUInt16(data)
        let moderate = decoder.decodeUInt16(data)
        let hard = decoder.decodeUInt16(data)
        let max = decoder.decodeUInt16(data)
        let time = FitnessMachineTargetTimeInFiveHrZone.create(veryLightZone: veryLight,
                                                               lightZone: light,
                                                               moderateZone: moderate,
                                                               hardZone: hard,
                                                               maximumZone: max)
        statusValue = FitnessMachineStatusTargetedTimeInFiveHrZoneChanged(time: time)
        
        return CharacteristicFitnessMachineStatus(status: statusValue)
    }
    
}

extension CharacteristicFitnessMachineStatus: Hashable {
    
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuidString)
        hasher.combine(status?.statusCode)
    }
}

extension CharacteristicFitnessMachineStatus: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicFitnessMachineStatus, rhs: CharacteristicFitnessMachineStatus) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.status?.statusCode == rhs.status?.statusCode)
    }
}
