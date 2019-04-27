//
//  FitnessMachineControlCode.swift
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

/// Fitness Machine Control Point Codes
public enum FitnessMachineControlCode: UInt8 {
    /// Initiates the procedure to request the control of a fitness machine
    case reqeustControl                     = 0
    /// Initiates the procedure to reset the controllable settings of a fitness machine
    case reset                              = 1
    /// Initiate the procedure to set the target speed of the Server
    case setTargetSpeed                     = 2
    /// Initiate the procedure to set the target inclination of the Server
    case setTargetInclination               = 3
    /// Initiate the procedure to set the target resistance level of the Server
    case setTargetResistanceLevel           = 4
    /// Initiate the procedure to set the target power of the Server
    case setTargetPower                     = 5
    /// Initiate the procedure to set the target heart rate of the Server
    case setTargetHeartRate                 = 6
    /// Initiate the procedure to start or resume a training session on the Server
    case startResume                        = 7
    /// Initiate the procedure to stop or pause a training session on the Server
    case stopPause                          = 8
    /// Set the targeted expended energy for a training session on the Server
    case setTargetedExpendedEnergy          = 9
    /// Set the targeted number of steps for a training session on the Server
    case setTargetedNumberOfSteps           = 10
    /// Set the targeted number of strides for a training session on the Server
    case setTargetedNumberOfStrides         = 11
    /// Set the targeted distance for a training session on the Server
    case setTargetedDistance                = 12
    /// Set the targeted training time for a training session on the Server
    case setTargetedTrainingTime            = 13
    /// Set the targeted time in two heart rate zones for a training session on the Server
    case setTargetedTimeInTwoHrZone         = 14
    /// Set the targeted time in three heart rate zones for a training session on the Server
    case setTargetedTimeInThreeHrZone       = 15
    /// Set the targeted time in five heart rate zones for a training session on the Server
    case setTargetedTimeInFiveHrZone        = 16
    /// Set the simulation parameters for a training session on the Server
    case setIndoorBikeSimulationParameters  = 17
    /// Set the wheel circumference for a training session on the Server
    case setWheelCircumference              = 18
    /// Control the spin down procedure of a Server
    case setSpinDownControl                 = 19
    /// Set the targeted cadence for a training session on the Server
    case setTargetedCadence                 = 20
    /// Used to identify the response to this Control Point
    case responseCode                       = 128
}

@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
internal extension FitnessMachineControlCode {

    /// Param Response Type for Optional Param value in ResponseCode
    var responeCodeParamType: FitnessMachineControlResponseType.Type? {
        switch self {
        case .setSpinDownControl:
            return FitnessMachineControlResponseTypeSpinDown.self
        default:
            return nil
        }
    }
}
