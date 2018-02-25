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


/// Protocl for Fitness Machine Control Point Procedure
public protocol FitnessMachineControlProcedure {

    /// Control Code
    var controlCode: FitnessMachineControlCode { get }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    func encode() throws -> Data
}

/// Fitness Machine Procecure for Requesting Control
public struct FitnessMachineProcedureRequestControl: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    public init() {
        self.controlCode = .reqeustControl
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(controlCode.rawValue)

        return msgData
    }
}

/// Fitness Machine Procecure for Reset
public struct FitnessMachineProcedureReset: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    public init() {
        self.controlCode = .reset
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(controlCode.rawValue)

        return msgData
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

    public init(target: FitnessMachineSpeedType) {
        self.controlCode = .setTargetSpeed
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        let target = try self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)
        
        return msgData
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

    public init(target: FitnessMachineInclinationType) {
        self.controlCode = .setTargetInclination
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        let target = try self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return msgData
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

    public init(target: FitnessMachineTargetResistanceLevelType) {
        self.controlCode = .setTargetResistanceLevel
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        let target = try self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return msgData
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

    public init(target: FitnessMachinePowerType) {
        self.controlCode = .setTargetPower
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        let target = try self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return msgData
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

    public init(target: UInt8) {
        self.controlCode = .setTargetHeartRate
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return msgData
    }
}

/// Fitness Machine Procecure for Start/Resume
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureStartResume: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    public init() {
        self.controlCode = .startResume
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(controlCode.rawValue)

        return msgData
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

    public init(target: FitnessMachineStopPauseType) {
        self.controlCode = .stopPause
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target.rawValue)

        return msgData
    }
}

/// Fitness Machine Procecure for Set the targeted expended energy
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedExpendedEnergy: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Expended Energy
    private(set) public var target: FitnessMachineTargetExpendedEnergy

    public init(target: FitnessMachineTargetExpendedEnergy) {
        self.controlCode = .setTargetedExpendedEnergy
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        let target = try self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return msgData
    }
}

/// Fitness Machine Procecure for Set the targeted number of steps
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedNumberOfSteps: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Steps
    private(set) public var target: UInt16

    public init(target: UInt16) {
        self.controlCode = .setTargetedNumberOfSteps
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(Data(from: target.littleEndian))

        return msgData
    }
}

/// Fitness Machine Procecure for Set the targeted number of strides
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedNumberOfStrides: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Steps
    private(set) public var target: UInt16

    public init(target: UInt16) {
        self.controlCode = .setTargetedNumberOfStrides
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(Data(from: target.littleEndian))

        return msgData
    }
}

/// Fitness Machine Procecure for Set the targeted distance
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedDistance: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Distance
    private(set) public var target: FitnessMachineTargetDistance

    public init(target: FitnessMachineTargetDistance) {
        self.controlCode = .setTargetedDistance
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        let target = try self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return msgData
    }
}

/// Fitness Machine Procecure for Set the targeted Training Time
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedTrainingTime: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Training Time
    private(set) public var target: FitnessMachineTargetTime

    public init(target: FitnessMachineTargetTime) {
        self.controlCode = .setTargetedTrainingTime
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        let target = try self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return msgData
    }
}

/// Fitness Machine Procecure for Set the targeted Time in Two Heart Rate Zone
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedTimeInTwoHrZone: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Time in Two Heart Rate Zone
    private(set) public var target: FitnessMachineTargetTimeInTwoHrZone

    public init(target: FitnessMachineTargetTimeInTwoHrZone) {
        self.controlCode = .setTargetedTimeInTwoHrZone
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        let target = try self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return msgData
    }
}

/// Fitness Machine Procecure for Set the targeted Time in Three Heart Rate Zone
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedTimeInThreeHrZone: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Time in Three Heart Rate Zone
    private(set) public var target: FitnessMachineTargetTimeInThreeHrZone

    public init(target: FitnessMachineTargetTimeInThreeHrZone) {
        self.controlCode = .setTargetedTimeInThreeHrZone
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        let target = try self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return msgData
    }
}

/// Fitness Machine Procecure for Set the targeted Time in Five Heart Rate Zone
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedTimeInFiveHrZone: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target Time in Five Heart Rate Zone
    private(set) public var target: FitnessMachineTargetTimeInFiveHrZone

    public init(target: FitnessMachineTargetTimeInFiveHrZone) {
        self.controlCode = .setTargetedTimeInFiveHrZone
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        let target = try self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return msgData
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

    public init(target: FitnessMachineWheelCircumferenceType) {
        self.controlCode = .setWheelCircumference
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        let target = try self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return msgData
    }
}

/// Fitness Machine Procecure for Control the spin down procedure
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

    public init(target: Control) {
        self.controlCode = .setSpinDownControl
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target.rawValue)

        return msgData
    }
}

/// Fitness Machine Procecure for Set the targeted cadence for a training session
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct FitnessMachineProcedureSetTargetedCadence: FitnessMachineControlProcedure {

    /// Control Code
    private(set) public var controlCode: FitnessMachineControlCode

    /// Target cadence
    private(set) public var target: FitnessMachineTargetCadence

    public init(target: FitnessMachineTargetCadence) {
        self.controlCode = .setTargetedCadence
        self.target = target
    }

    /// Encodes Control Procedure into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        let target = try self.target.encode()
        var msgData = Data()

        msgData.append(controlCode.rawValue)
        msgData.append(target)

        return msgData
    }
}

