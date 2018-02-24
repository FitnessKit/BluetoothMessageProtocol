//
//  FitnessMachineStatusValue.swift
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
import FitnessUnits

/// Protocl for Fitness Machine Status Values
public protocol FitnessMachineStatus {

    /// Status Code
    var statusCode: FitnessMachineStatusCode { get }
}

/// Generic Fitness Machine Status Code
///
/// Status Codes without extra Values
public struct FitnessMachineStatusGeneric: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    public init(code: FitnessMachineStatusCode) {
        self.statusCode = code
    }
}

/// Status Value for Fitness Machine Stopped or Paused by the User
public struct FitnessMachineStatusStopPause: FitnessMachineStatus {

    public enum Control: UInt8 {
        /// Reserved
        case reserved       = 0
        /// Stop
        case stop           = 1
        /// Pause
        case pause          = 2
    }

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// Control
    private(set) public var controlInformation: Control

    public init(code: FitnessMachineStatusCode, controlInformation: Control) {
        self.statusCode = code
        self.controlInformation = controlInformation
    }
}

/// Status Value for Fitness Machine Target Incline Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetSpeed: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Target Speed Value
    private(set) public var speed: Measurement<UnitSpeed>

    public init(code: FitnessMachineStatusCode, speed: Measurement<UnitSpeed>) {
        self.statusCode = code
        self.speed = speed
    }
}

/// Status Value for Fitness Machine Target Incline Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetIncline: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Target Incline Value
    private(set) public var incline: Measurement<UnitPercent>

    public init(code: FitnessMachineStatusCode, incline: Measurement<UnitPercent>) {
        self.statusCode = code
        self.incline = incline
    }
}

/// Status Value for Fitness Machine Target Incline Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetResistanceLevel: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Target Resistance Level Value
    private(set) public var resistanceLevel: Double

    public init(code: FitnessMachineStatusCode, resistanceLevel: Double) {
        self.statusCode = code
        self.resistanceLevel = resistanceLevel
    }
}


/// Status Value for Fitness Machine Target Heart Rate Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetPower: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Target Power
    private(set) public var power: Measurement<UnitPower>

    public init(code: FitnessMachineStatusCode, power: Measurement<UnitPower>) {
        self.statusCode = code
        self.power = power
    }
}

/// Status Value for Fitness Machine Target Heart Rate Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetHeartRate: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Target Heart Rate
    private(set) public var heartRate: Measurement<UnitCadence>

    public init(code: FitnessMachineStatusCode, heartrate: UInt8) {
        self.statusCode = code
        self.heartRate = Measurement(value: Double(heartrate), unit: UnitCadence.beatsPerMinute)
    }
}

/// Status Value for Fitness Machine Targeted Expended Energy Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetedExpendedEnergyChanged: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Target Energy Expended
    private(set) public var energy: Measurement<UnitEnergy>

    public init(code: FitnessMachineStatusCode, energy: Measurement<UnitEnergy>) {
        self.statusCode = code
        self.energy = energy
    }
}

/// Status Value for Fitness Machine Targeted Number of Steps Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetedSteps: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Targeted Number of Steps
    private(set) public var steps: UInt16

    public init(code: FitnessMachineStatusCode, steps: UInt16) {
        self.statusCode = code
        self.steps = steps
    }
}

/// Status Value for Fitness Machine Targeted Number of Strides Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetedStrides: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Targeted Number of Strides
    private(set) public var strides: UInt16

    public init(code: FitnessMachineStatusCode, strides: UInt16) {
        self.statusCode = code
        self.strides = strides
    }
}

/// Status Value for Fitness Machine Targeted Distance Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetedDistance: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Targeted Distance
    private(set) public var distance: Measurement<UnitLength>

    public init(code: FitnessMachineStatusCode, distance: Measurement<UnitLength>) {
        self.statusCode = code
        self.distance = distance
    }
}

/// Status Value for Fitness Machine Targeted Distance Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetedTrainingTime: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Targeted Training Time
    private(set) public var time: Measurement<UnitDuration>

    public init(code: FitnessMachineStatusCode, time: Measurement<UnitDuration>) {
        self.statusCode = code
        self.time = time
    }
}

/// Status Value for Fitness Machine Wheel Circumference Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusWheelCircumference: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Wheel Circumference
    private(set) public var circumference: Measurement<UnitLength>

    public init(code: FitnessMachineStatusCode, circumference: Measurement<UnitLength>) {
        self.statusCode = code
        self.circumference = circumference
    }
}

/// Status Value for Fitness Targeted Cadence Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetedCadence: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Targeted Cadence
    ///
    /// Units 1/minute
    private(set) public var cadence: Double

    public init(code: FitnessMachineStatusCode, cadence: Double) {
        self.statusCode = code
        self.cadence = cadence
    }
}


/// Status Value for Fitness Machine Spin Down Status
public struct FitnessMachineStatusSpinDown: FitnessMachineStatus {

    /// Spin Down Status Codes
    public enum SpinDownStatus: UInt8 {
        /// Reserved
        case reserved       = 0
        /// Spin Down Requested
        case requested      = 1
        /// Success
        case success        = 2
        /// Error
        case error          = 3
        /// Stop Pedaling
        case stopPedaling   = 4
    }

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// Spin Down Status
    private(set) public var status: SpinDownStatus

    public init(code: FitnessMachineStatusCode, status: SpinDownStatus) {
        self.statusCode = code
        self.status = status
    }
}

