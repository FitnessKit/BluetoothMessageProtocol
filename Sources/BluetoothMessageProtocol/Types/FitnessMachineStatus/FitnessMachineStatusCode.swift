//
//  FitnessMachineStatusCode.swift
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

/// Fitness Machine Status Code
public enum FitnessMachineStatusCode: UInt8 {
    /// Reserved
    case reserved                           = 0
    /// Reset
    case reset                              = 1
    /// Fitness Machine Stopped or Paused by the User
    case stopPauseByUser                    = 2
    /// Fitness Machine Stopped by Safety Key
    case safetyKey                          = 3
    /// Fitness Machine Started or Resumed by the User
    case startedResumedByUser               = 4
    /// Target Speed Changed
    case targetSpeedChanged                 = 5
    /// Target Incline Changed
    case targetInclineChanaged              = 6
    /// Target Resistance Level Changed
    case targetResistanceLevelChanged       = 7
    /// Target Power Changed
    case targetPowerChanged                 = 8
    /// Target Heart Rate Changed
    case targetHeartRateChanged             = 9
    /// Targeted Expended Energy Changed
    case targetedExpendedEnergyChanged      = 10
    /// Targeted Number of Steps Changed
    case targetedStepsChanged               = 11
    /// Targeted Number of Strides Changed
    case targetedStridesChanged             = 12
    /// Targeted Distance Changed
    case targetedDistanceChanged            = 13
    /// Targeted Training Time Changed
    case targetedTrainingTimeChanged        = 14
    /// Targeted Time in Two Heart Rate Zones Changed
    case targetedTimeInTwoHrZoneChanged     = 15
    /// Targeted Time in Three Heart Rate Zones Changed
    case targetedTimeInThreeHrZoneChanged   = 16
    /// Targeted Time in Five Heart Rate Zones Changed
    case targetedTimeInFiveHrZoneChanged    = 17
    /// Indoor Bike Simulation Parameters Changed
    case indoorBikeSimulationParamsChanged  = 18
    /// Wheel Circumference Changed
    case wheelCircumferenceChanged          = 19
    /// Spin Down Status
    case spinDownStatus                     = 20
    /// Targeted Cadence Changed
    case targetedCadenceChanged             = 21

    /// Control Permissionm Lost
    case controlPermissionLost              = 22
}
