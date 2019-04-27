//
//  FitnessMachineControlProcedure.swift
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

/// Protocol for Fitness Machine Control Point Procedure
public protocol FitnessMachineControlProcedure: BluetoothEncodable {

    /// Control Code
    var controlCode: FitnessMachineControlCode { get }
    
}

/// Fitness Machine Procecure for Requesting Control
public struct FitnessMachineProcedureRequestControl: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Create Procecure for Requesting Control
    public init() {
        self.controlCode = .reqeustControl
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(controlCode.rawValue)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Reset
public struct FitnessMachineProcedureReset: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Create Procecure for Reset
    public init() {
        self.controlCode = .reset
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(controlCode.rawValue)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Target Speed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetSpeed: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Speed
    private(set) public var target: FitnessMachineSpeedType

    /// Create Procecure for Set the Target Speed
    ///
    /// - Parameter target: Target Speed
    public init(target: FitnessMachineSpeedType) {
        self.controlCode = .setTargetSpeed
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let target = self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)
        
        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Target Inclination
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetInclination: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Inclination
    private(set) public var target: FitnessMachineInclinationType

    /// Create Procecure for Set the Target Inclination
    ///
    /// - Parameter target: Target Inclination
    public init(target: FitnessMachineInclinationType) {
        self.controlCode = .setTargetInclination
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let target = self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Target Resistance Level
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetResistanceLevel: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Resistance Level
    private(set) public var target: FitnessMachineTargetResistanceLevelType

    /// Create Procecure for Set the Target Resistance Level
    ///
    /// - Parameter target: Target Resistance Level
    public init(target: FitnessMachineTargetResistanceLevelType) {
        self.controlCode = .setTargetResistanceLevel
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let target = self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Target Power
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetPower: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Power
    private(set) public var target: FitnessMachinePowerType

    /// Create Procecure for Set the Target Resistance Power
    ///
    /// - Parameter target: Target Power
    public init(target: FitnessMachinePowerType) {
        self.controlCode = .setTargetPower
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let target = self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Target Heart Rate
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetHeartRate: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Power
    private(set) public var target: UInt8

    /// Create Procecure for Set the Target Heart Rate
    ///
    /// - Parameter target: Target Heart Rate
    public init(target: UInt8) {
        self.controlCode = .setTargetHeartRate
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Start/Resume
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureStartResume: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Create Procecure for Start/Resume
    public init() {
        self.controlCode = .startResume
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(controlCode.rawValue)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Stop/Pause
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureStopPause: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Command
    private(set) public var target: FitnessMachineStopPauseType

    /// Create Procecure for Stop/Pause
    ///
    /// - Parameter target: Stop - Pause
    public init(target: FitnessMachineStopPauseType) {
        self.controlCode = .stopPause
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target.rawValue)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Targeted Expended Energy
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedExpendedEnergy: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Expended Energy
    private(set) public var target: FitnessMachineTargetExpendedEnergy

    /// Create Procecure for Set the Targeted Expended Energy
    ///
    /// - Parameter target: Targeted Expended Energy
    public init(target: FitnessMachineTargetExpendedEnergy) {
        self.controlCode = .setTargetedExpendedEnergy
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let target = self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Targeted Number of Steps
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedNumberOfSteps: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Steps
    private(set) public var target: UInt16

    /// Create Procecure for Set the Targeted Number of Steps
    ///
    /// - Parameter target: Targeted Number of Steps
    public init(target: UInt16) {
        self.controlCode = .setTargetedNumberOfSteps
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(Data(from: target.littleEndian))

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Targeted Number of Strides
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedNumberOfStrides: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Steps
    private(set) public var target: UInt16

    /// Create Procecure for Set the Targeted Number of Strides
    ///
    /// - Parameter target: Targeted Number of Strides
    public init(target: UInt16) {
        self.controlCode = .setTargetedNumberOfStrides
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(Data(from: target.littleEndian))

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Targeted Distance
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedDistance: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Distance
    private(set) public var target: FitnessMachineTargetDistance

    /// Create Procecure for Set the Targeted Distance
    ///
    /// - Parameter target: Targeted Distance
    public init(target: FitnessMachineTargetDistance) {
        self.controlCode = .setTargetedDistance
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let target = self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Targeted Training Time
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedTrainingTime: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Training Time
    private(set) public var target: FitnessMachineTargetTime

    /// Create Procecure for Set the Targeted Training Time
    ///
    /// - Parameter target: Targeted Training Time
    public init(target: FitnessMachineTargetTime) {
        self.controlCode = .setTargetedTrainingTime
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let target = self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Targeted Time in Two Heart Rate Zone
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedTimeInTwoHrZone: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Time in Two Heart Rate Zone
    private(set) public var target: FitnessMachineTargetTimeInTwoHrZone

    /// Create Procecure for Set the Targeted Time in Two Heart Rate Zone
    ///
    /// - Parameter target: Targeted Time in Two Heart Rate Zone
    public init(target: FitnessMachineTargetTimeInTwoHrZone) {
        self.controlCode = .setTargetedTimeInTwoHrZone
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let target = self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Targeted Time in Three Heart Rate Zone
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedTimeInThreeHrZone: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Time in Three Heart Rate Zone
    private(set) public var target: FitnessMachineTargetTimeInThreeHrZone

    /// Create Procecure for Set the Targeted Time in Three Heart Rate Zone
    ///
    /// - Parameter target: Targeted Time in Three Heart Rate Zone
    public init(target: FitnessMachineTargetTimeInThreeHrZone) {
        self.controlCode = .setTargetedTimeInThreeHrZone
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let target = self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Targeted Time in Five Heart Rate Zone
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedTimeInFiveHrZone: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Time in Five Heart Rate Zone
    private(set) public var target: FitnessMachineTargetTimeInFiveHrZone

    /// Create Procecure for Set the Targeted Time in Five Heart Rate Zone
    ///
    /// - Parameter target: Targeted Time in Five Heart Rate Zone
    public init(target: FitnessMachineTargetTimeInFiveHrZone) {
        self.controlCode = .setTargetedTimeInFiveHrZone
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let target = self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the wheel circumference for a training session
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSeWheelCircumference: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target wheel circumference
    private(set) public var target: FitnessMachineWheelCircumferenceType

    /// Create Procecure for Set the wheel circumference for a training session
    ///
    /// - Parameter target: wheel circumference
    public init(target: FitnessMachineWheelCircumferenceType) {
        self.controlCode = .setWheelCircumference
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let target = self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Control the Spin Down Procedure
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetSpinDownControl: FitnessMachineControlProcedure {

    /// Spin Down Control
    public enum Control: UInt8 {
        /// Start
        case start      = 1
        /// Ignore
        case ignore     = 2
    }
    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Spin Down Control
    private(set) public var target: Control

    /// Create Procecure for Control the Spin Down Procedure
    ///
    /// - Parameter target: Spin Down Control
    public init(target: Control) {
        self.controlCode = .setSpinDownControl
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target.rawValue)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure for Set the Targeted Cadence for a Training Session
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedCadence: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target cadence
    private(set) public var target: FitnessMachineTargetCadence

    /// Create Procecure for Set the Targeted Cadence for a Training Session
    ///
    /// - Parameter target: Targeted Cadence
    public init(target: FitnessMachineTargetCadence) {
        self.controlCode = .setTargetedCadence
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        let target = self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return.success(msgData)
    }
}

/// Fitness Machine Procecure to identify the response to the Control Point
public struct FitnessMachineProcedureResponse: FitnessMachineControlProcedure {

    /// Control Response Result Codes
    public enum ResultCode: UInt8 {
        /// Reserved
        case reserved               = 0
        /// Success
        case success                = 1
        /// Op Code not supported
        case notSupported           = 2
        /// Invalid Parameter
        case invalidParameter       = 3
        /// Operationm Failed
        case operationFailed        = 4
        /// Control Not Permitted
        case controlNotPermitted    = 5

        /// If the Result Code can have Params
        ///
        /// Does not mean that it does have params
        /// one still needs to look at the FitnessMachineControlCode
        /// to determine if there is a optional param value on response
        internal var mayIncludeParam: Bool {
            switch self {
            case .success:
                return true
            default:
                return false
            }
        }
    }

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Requested Code
    ///
    /// This is the FitnessMachineControlCode which is being Responded to
    private(set) public var requestCode: FitnessMachineControlCode

    /// Result of the Requested Procedure
    private(set) public var resultCode: ResultCode

    /// Response Parameter
    private(set) public var responseParam: FitnessMachineControlResponseType?

    /// Create Control Procedure for Response
    ///
    /// - Parameters:
    ///   - requestCode: Code Requested which is being responded to
    ///   - resultCode: Result Code for response
    ///   - responseParam: Optional Parameter for response
    public init(requestCode: FitnessMachineControlCode, resultCode: ResultCode, responseParam: FitnessMachineControlResponseType?) {
        self.controlCode = .responseCode
        self.requestCode = requestCode
        self.resultCode = resultCode
        self.responseParam = responseParam
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        //Not Yet Supported
        return.failure(BluetoothEncodeError.notSupported)
    }
}
