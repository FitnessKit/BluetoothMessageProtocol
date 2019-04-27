//
//  MeshMessageGenericLevel.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/28/18.
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

/// Mesh Message Generic Level Get
///
/// Generic Level Get is an acknowledged message used to get the Generic
/// Level state of an element
///
/// The response to the Generic Level Get message is a Generic Level Status message.
public struct MeshMessageGenericLevelGet: MeshMessage {

    /// Op Code
    private(set) public var opCode: Data

    /// Create Message
    public init() {
        self.opCode = Data([0x82, 0x05])
    }

    /// Encodes into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(opCode)

        return.success(msgData)
    }
}

/// Mesh Message Generic Level Set
///
/// Generic Level Set is an acknowledged message used to set the Generic
/// Level state of an element
///
/// The response to the Generic Level Set message is a Generic Level Status message.
public struct MeshMessageGenericLevelSet: MeshMessage {

    /// Op Code
    private(set) public var opCode: Data

    /// Level State
    private(set) public var state: Int16

    /// Transaction Identifier
    private(set) public var transaction: UInt8

    /// Transition Time
    private(set) public var transition: MeshTransitionTime?

    /// Message execution delay
    ///
    /// Message execution delay in 5 millisecond steps
    private(set) public var delay: UInt8?

    /// Create Message
    ///
    /// - Parameters:
    ///   - state: Level State
    ///   - transaction: Transaction Identifier
    ///   - transition: Transition Time
    ///   - delay: Message execution delay
    public init(state: Int16, transaction: UInt8, transition: MeshTransitionTime?, delay: UInt8?) {
        self.opCode = Data([0x82, 0x06])

        self.state = state
        self.transaction = transaction
        self.transition = transition
        self.delay = delay
    }

    /// Encodes into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(opCode)
        msgData.append(Data(from: state.littleEndian))

        // C.1: If the Transition Time field is present, the Delay field shall
        // also be present; otherwise these fields shall not be present.
        if let transition = transition {

            msgData.append(transition.rawValue)

            if let delay = delay {
                msgData.append(delay)
            } else {
                return.failure(BluetoothEncodeError.missingProperties("Delay must be present."))
            }
        }

        return.success(msgData)
    }
}

/// Mesh Message Generic Level Set Unacknowledged
///
/// Generic Level Set Unacknowledged is an unacknowledged message used to
/// set the Generic Level state of an element
public struct MeshMessageGenericLevelSetUnacknowledged: MeshMessage {

    /// Op Code
    private(set) public var opCode: Data

    /// Level State
    private(set) public var state: Int16

    /// Transaction Identifier
    private(set) public var transaction: UInt8

    /// Transition Time
    private(set) public var transition: MeshTransitionTime?

    /// Message execution delay
    ///
    /// Message execution delay in 5 millisecond steps
    private(set) public var delay: UInt8?

    /// Create Message
    ///
    /// - Parameters:
    ///   - state: Level State
    ///   - transaction: Transaction Identifier
    ///   - transition: Transition Time
    ///   - delay: Message execution delay
    public init(state: Int16, transaction: UInt8, transition: MeshTransitionTime?, delay: UInt8?) {
        self.opCode = Data([0x82, 0x07])

        self.state = state
        self.transaction = transaction
        self.transition = transition
        self.delay = delay
    }

    /// Encodes into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(opCode)
        msgData.append(Data(from: state.littleEndian))

        // C.1: If the Transition Time field is present, the Delay field shall
        // also be present; otherwise these fields shall not be present.
        if let transition = transition {

            msgData.append(transition.rawValue)

            if let delay = delay {
                msgData.append(delay)
            } else {
                return.failure(BluetoothEncodeError.missingProperties("Delay must be present."))
            }
        }

        return.success(msgData)
    }
}

/// Mesh Message Generic Level Status
///
/// Generic Level Status is an unacknowledged message used to report the Generic
/// Level state of an element
public struct MeshMessageGenericLevelSatus: MeshMessage {

    /// Op Code
    private(set) public var opCode: Data

    /// Present Level
    private(set) public var present: Int16

    /// Target Level
    private(set) public var target: Int16?

    /// Remaining Time
    private(set) public var remainingTime: MeshTransitionTime?

    /// Create Message
    public init(present: Int16, target: Int16?, remainingTime: MeshTransitionTime?) {
        self.opCode = Data([0x82, 0x08])

        self.present = present
        self.target = target
        self.remainingTime = remainingTime
    }

    /// Encodes into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(opCode)

        msgData.append(Data(from: present.littleEndian))

        // C.1: If the Target Level field is present, the Remaining Time field
        /// shall also be present; otherwise these fields shall not be present.
        if let target = target {

            msgData.append(Data(from: target.littleEndian))

            if let remainingTime = remainingTime {
                msgData.append(remainingTime.rawValue)
            } else {
                return.failure(BluetoothEncodeError.missingProperties("Remaining Time must be present."))
            }
        }

        return.success(msgData)
    }
}


/// Mesh Message Generic Move Set
public struct MeshMessageGenericMoveSet: MeshMessage {

    /// Op Code
    private(set) public var opCode: Data

    /// Create Message
    public init() {
        self.opCode = Data([0x82, 0x0B])
    }

    /// Encodes into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(opCode)

        return.success(msgData)
    }
}

/// Mesh Message Generic Move Set Unacknowledged
public struct MeshMessageGenericMoveSetUnacknowledged: MeshMessage {

    /// Op Code
    private(set) public var opCode: Data

    /// Create Message
    public init() {
        self.opCode = Data([0x82, 0x0C])
    }

    /// Encodes into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(opCode)

        return.success(msgData)
    }
}
