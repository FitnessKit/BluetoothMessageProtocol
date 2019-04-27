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

/// Protocol for Fitness Machine Status Values
public protocol FitnessMachineStatus: BluetoothEncodable {

    /// Status Code
    var statusCode: FitnessMachineStatusCode { get }
}

/// Generic Fitness Machine Status Code
///
/// Status Codes without extra Values
public struct FitnessMachineStatusGeneric: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// Create Fitness Machine Generic Status
    ///
    /// - Parameter code: FitnessMachineStatusCode
    public init(code: FitnessMachineStatusCode) {
        self.statusCode = code
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(statusCode.rawValue)

        return.success(msgData)
    }
}

/// Status Value for Fitness Machine Stopped or Paused by the User
public struct FitnessMachineStatusStopPause: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// Control
    private(set) public var controlInformation: FitnessMachineStopPauseType

    /// Create Fitness Machine Status for Stopped or Paused by the User
    ///
    /// - Parameter controlInformation: FitnessMachineStopPauseType
    public init(controlInformation: FitnessMachineStopPauseType) {
        self.statusCode = .stopPauseByUser
        self.controlInformation = controlInformation
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(statusCode.rawValue)
        msgData.append(controlInformation.rawValue)

        return.success(msgData)
    }
}

/// Status Value for Fitness Machine Target Speed Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetSpeed: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Target Speed Value
    private(set) public var speed: FitnessMachineSpeedType

    /// Create Fitness Machine Status for Target Speed Changed
    ///
    /// - Parameter speed: FitnessMachineSpeedType
    public init(speed: FitnessMachineSpeedType) {
        self.statusCode = .targetSpeedChanged
        self.speed = speed
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        
        let speed = self.speed.encode()
        var msgData = Data()
        
        msgData.append(statusCode.rawValue)
        msgData.append(speed)
        
        return.success(msgData)
    }
}

/// Status Value for Fitness Machine Target Incline Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetIncline: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Target Incline Value
    private(set) public var incline: FitnessMachineInclinationType

    /// Create Fitness Machine Status for Target Incline Changed
    ///
    /// - Parameter incline: FitnessMachineInclinationType
    public init(incline: FitnessMachineInclinationType) {
        self.statusCode = .targetInclineChanaged
        self.incline = incline
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        
        let incline = self.incline.encode()
        
        var msgData = Data()
        
        msgData.append(statusCode.rawValue)
        msgData.append(incline)
        
        return.success(msgData)
    }
}

/// Status Value for Fitness Machine Target Resistance Level Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetResistanceLevel: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Target Resistance Level Value
    private(set) public var resistanceLevel: FitnessMachineTargetResistanceLevelType

    /// Create Fitness Machine Status for Target Resistance Level Changed
    ///
    /// - Parameter resistanceLevel: FitnessMachineTargetResistanceLevelType
    public init(resistanceLevel: FitnessMachineTargetResistanceLevelType) {
        self.statusCode = .targetResistanceLevelChanged
        self.resistanceLevel = resistanceLevel
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let resistanceLevel = self.resistanceLevel.encode()

        var msgData = Data()

        msgData.append(statusCode.rawValue)
        msgData.append(resistanceLevel)

        return.success(msgData)
    }
}

/// Status Value for Fitness Machine Target Power Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetPower: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Target Power
    private(set) public var power: FitnessMachinePowerType

    /// Create Fitness Machine Status for Target Power Changed
    ///
    /// - Parameter power: FitnessMachinePowerType
    public init(power: FitnessMachinePowerType) {
        self.statusCode = .targetPowerChanged
        self.power = power
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let power = self.power.encode()
        var msgData = Data()

        msgData.append(statusCode.rawValue)
        msgData.append(power)

        return.success(msgData)
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

    /// Create Fitness Machine Status for Target Heart Rate Changed
    ///
    /// - Parameter heartrate: Heart Rate in BPM
    public init(heartrate: UInt8) {
        self.statusCode = .targetHeartRateChanged
        self.heartRate = Measurement(value: Double(heartrate), unit: UnitCadence.beatsPerMinute)
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(statusCode.rawValue)
        msgData.append(Data(from: UInt8(heartRate.value)))

        return.success(msgData)
    }
}

/// Status Value for Fitness Machine Targeted Expended Energy Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetedExpendedEnergyChanged: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Target Energy Expended
    private(set) public var energy: FitnessMachineTargetExpendedEnergy

    /// Create Fitness Machine Status for Target Expended Energy Changed
    ///
    /// - Parameter energy: FitnessMachineTargetExpendedEnergy
    public init(energy: FitnessMachineTargetExpendedEnergy) {
        self.statusCode = .targetedExpendedEnergyChanged
        self.energy = energy
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        //Not Yet Supported
        return.failure(BluetoothEncodeError.notSupported)
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

    /// Create Fitness Machine Status for Targeted Number of Steps Changed
    ///
    /// - Parameter steps: Number of Steps
    public init(steps: UInt16) {
        self.statusCode = .targetedStepsChanged
        self.steps = steps
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(statusCode.rawValue)
        msgData.append(Data(from: steps.littleEndian))

        return.success(msgData)
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

    /// Create Fitness Machine Status for Targeted Number of Strides Changed
    ///
    /// - Parameter strides: Number of Strides
    public init(strides: UInt16) {
        self.statusCode = .targetedStridesChanged
        self.strides = strides
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(statusCode.rawValue)
        msgData.append(Data(from: strides.littleEndian))

        return.success(msgData)
    }
}

/// Status Value for Fitness Machine Targeted Distance Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetedDistance: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Targeted Distance
    private(set) public var distance: FitnessMachineTargetDistance

    /// Create Fitness Machine Status for Targeted Distance Changed
    ///
    /// - Parameter distance: FitnessMachineTargetDistance
    public init(distance: FitnessMachineTargetDistance) {
        self.statusCode = .targetedDistanceChanged
        self.distance = distance
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let distance = self.distance.encode()
        var msgData = Data()

        msgData.append(statusCode.rawValue)
        msgData.append(distance)

        return.success(msgData)
    }
}

/// Status Value for Fitness Machine Targeted Training Time Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetedTrainingTime: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Targeted Training Time
    private(set) public var time: FitnessMachineTargetTime

    /// Create Fitness Machine Status for Targeted Training Time Changed
    ///
    /// - Parameter time: FitnessMachineTargetTime
    public init(time: FitnessMachineTargetTime) {
        self.statusCode = .targetedTrainingTimeChanged
        self.time = time
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let time = self.time.encode()
        var msgData = Data()

        msgData.append(statusCode.rawValue)
        msgData.append(time)

        return.success(msgData)
    }
}

/// Status Value for Fitness Machine Targeted Time in Two Heart Rate Zone Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetedTimeInTwoHrZoneChanged: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Targeted Time in Two Heart Rate Zone
    private(set) public var time: FitnessMachineTargetTimeInTwoHrZone

    /// Create Fitness Machine Status for Targeted Time in Two Heart Rate Zone Changed
    ///
    /// - Parameter time: FitnessMachineTargetTimeInTwoHrZone
    public init(time: FitnessMachineTargetTimeInTwoHrZone) {
        self.statusCode = .targetedTimeInTwoHrZoneChanged
        self.time = time
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let time = self.time.encode()
        var msgData = Data()

        msgData.append(statusCode.rawValue)
        msgData.append(time)

        return.success(msgData)
    }
}

/// Status Value for Fitness Machine Targeted Time in Three Heart Rate Zone Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetedTimeInThreeHrZoneChanged: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Targeted Time in Three Heart Rate Zone
    private(set) public var time: FitnessMachineTargetTimeInThreeHrZone

    /// Create Fitness Machine Status for Targeted Time in Three Heart Rate Zone Changed
    ///
    /// - Parameter time: FitnessMachineTargetTimeInThreeHrZone
    public init(time: FitnessMachineTargetTimeInThreeHrZone) {
        self.statusCode = .targetedTimeInThreeHrZoneChanged
        self.time = time
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let time = self.time.encode()
        var msgData = Data()

        msgData.append(statusCode.rawValue)
        msgData.append(time)

        return.success(msgData)
    }
}

/// Status Value for Fitness Machine Targeted Time in Five Heart Rate Zone Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusTargetedTimeInFiveHrZoneChanged: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Targeted Time in Five Heart Rate Zone
    private(set) public var time: FitnessMachineTargetTimeInFiveHrZone

    /// Create Fitness Machine Status for Targeted Time in Five Heart Rate Zone Changed
    ///
    /// - Parameter time: FitnessMachineTargetTimeInFiveHrZone
    public init(time: FitnessMachineTargetTimeInFiveHrZone) {
        self.statusCode = .targetedTimeInFiveHrZoneChanged
        self.time = time
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let time = self.time.encode()
        var msgData = Data()

        msgData.append(statusCode.rawValue)
        msgData.append(time)

        return.success(msgData)
    }
}

/// Status Value for Fitness Machine Wheel Circumference Changed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineStatusWheelCircumference: FitnessMachineStatus {

    /// Status Code
    private(set) public var statusCode: FitnessMachineStatusCode

    /// New Wheel Circumference
    private(set) public var circumference: FitnessMachineWheelCircumferenceType

    /// Create Fitness Machine Status for Wheel Circumference Changed
    ///
    /// - Parameter circumference: FitnessMachineWheelCircumferenceType
    public init(circumference: FitnessMachineWheelCircumferenceType) {
        self.statusCode = .wheelCircumferenceChanged
        self.circumference = circumference
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let circumference = self.circumference.encode()
        var msgData = Data()

        msgData.append(statusCode.rawValue)
        msgData.append(circumference)

        return.success(msgData)
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

    /// Create Fitness Machine Status for Machine Spin Down Status
    ///
    /// - Parameter status: SpinDownStatus
    public init(status: SpinDownStatus) {
        self.statusCode = .spinDownStatus
        self.status = status
    }

    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(statusCode.rawValue)
        msgData.append(status.rawValue)

        return.success(msgData)
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
    private(set) public var cadence: FitnessMachineTargetCadence

    /// Create Fitness Machine Status for Targeted Cadence Changed
    ///
    /// - Parameter cadence: FitnessMachineTargetCadence
    public init(cadence: FitnessMachineTargetCadence) {
        self.statusCode = .targetedCadenceChanged
        self.cadence = cadence
    }
    
    /// Encodes Status into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        //Not Yet Supported
        return.failure(BluetoothEncodeError.notSupported)
    }
}
