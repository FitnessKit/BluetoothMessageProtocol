//
//  GymConnectEquipmentState.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 10/19/18.
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

/// GymConnect Equipment Type
///
/// Provides the Equipment Types for GymConnect
@available(swift 4.0)
public enum GymConnectEquipmentState: UInt8, Hashable {
    /// Unknown
    case unknown                    = 0
    /// Idle
    case idle                       = 1
    /// Paused
    case paused                     = 2
    /// Stopped by Safety Key
    case stopSafetyKey              = 3
    // 4...9 Reserved
    /// In Use
    case inUse                      = 10
    /// In Use - Warming Up
    case inUseWarmingUp             = 11
    /// In Use - Low Intensity
    case inUseLowIntensity          = 12
    /// In Use - High Intensity
    case inUseHighIntensity         = 13
    /// In Use - Recovery
    case inUseRecovery              = 14
    // 15...30 In Use Reserved
    /// In Use - Workout Program
    ///
    /// Built In Workout Program
    /// - SeeAlso: CharacteristicGymConnectWorkoutProgramName
    case inUseWorkoutProgram        = 31
    /// In Use - Workout Program Customized
    ///
    /// Built In Workout Program with Customization
    /// - SeeAlso: CharacteristicGymConnectWorkoutProgramName
    case inUseWorkoutProgramCustom  = 32
    /// In Use - Workout Program Upload
    ///
    /// Workout Program Uploaded from external source
    /// - SeeAlso: CharacteristicGymConnectWorkoutProgramName
    case inUseWorkoutProgramUpload  = 33
    // 34...50 In Use Workout Program Reserved
    /// In Use - Isometric
    case inUseIsometric             = 51
    /// In Use - Heart Rate Control
    case inUseHeartrateControl      = 52
    /// In Use - Fitness Test
    case inUseFitnessTest           = 53
    /// In Use - Cool Down
    case inUseCoolDown              = 54
    /// In Use - Watt Control
    case inUseWattControl           = 55
    // 56...126 In Use Reserved
    /// In Use - Custom State Name
    /// - SeeAlso: CharacteristicGymConnectEquipmentStateName
    case inUseCustomStateName       = 127
    /// Finished
    case finished                   = 128
    /// 129...192 Finished Reserved
}

internal extension GymConnectEquipmentState {

    /// Create a GymConnectEquipmentState
    ///
    /// - Parameter rawValue: Raw Equpment Type value
    /// - Returns: GymConnectEquipmentState
    static func create(_ rawValue: UInt8) -> GymConnectEquipmentState {

        switch rawValue {
        case 0:
            return .unknown
        case 1:
            return .idle
        case 2:
            return .paused
        case 3:
            return .stopSafetyKey
        case 10:
            return .inUse
        case 11:
            return .inUseWarmingUp
        case 12:
            return .inUseLowIntensity
        case 13:
            return .inUseHighIntensity
        case 14:
            return .inUseRecovery
        case 15...30:
            return .inUse
        case 31:
            return .inUseWorkoutProgram
        case 32:
            return .inUseWorkoutProgramCustom
        case 33:
            return .inUseWorkoutProgramUpload
        case 34...50:
            return .inUseWorkoutProgram
        case 51:
            return .inUseIsometric
        case 52:
            return .inUseHeartrateControl
        case 53:
            return .inUseFitnessTest
        case 54:
            return .inUseCoolDown
        case 55:
            return .inUseWattControl
        case 56...126:
            return .inUse
        case 127:
            return .inUseCustomStateName
        case 128:
            return .finished
        case 129...192:
            return .finished

        default:
            return .unknown
        }
    }

}

extension GymConnectEquipmentState {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension GymConnectEquipmentState: Encodable {

    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: TypeValueCodingKeys.self)

        /// Prefer the name of the type over a raw value
        try container.encode(self.rawValue, forKey: .value)
        try container.encode(self.description, forKey: .type)
    }
}
