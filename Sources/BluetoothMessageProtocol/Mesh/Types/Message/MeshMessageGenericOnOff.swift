//
//  MeshMessageGenericOnOff.swift
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

/// The Generic OnOff state represents the state of an element.
public enum GenericOnOffState: UInt8 {
    /// On
    case on     = 0x00
    /// Off
    case off    = 0x01
}

extension GenericOnOffState {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension GenericOnOffState: Encodable {

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

/// Mesh Message Generic OnOff Get
///
/// Generic OnOff Get is an acknowledged message used to get the Generic OnOff
/// state of an element.
///
/// The response to the Generic OnOff Get message is a Generic OnOff Status message
public struct MeshMessageGenericOnOffGet: MeshMessage {

    /// Op Code
    private(set) public var opCode: Data

    /// Create Message
    public init() {
        self.opCode = Data([0x82, 0x01])
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

/// Mesh Message Generic OnOff Set
///
/// Generic OnOff Set is an acknowledged message used to set the Generic OnOff
/// state of an element.
///
/// The response to the Generic OnOff Set message is a Generic OnOff Status message
public struct MeshMessageGenericOnOffSet: MeshMessage {

    /// Op Code
    private(set) public var opCode: Data

    /// State
    private(set) public var state: GenericOnOffState

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
    ///   - state: OnOff State
    ///   - transaction: Transaction Identifier
    ///   - transition: Transition Time
    ///   - delay: Message execution delay
    public init(state: GenericOnOffState, transaction: UInt8, transition: MeshTransitionTime?, delay: UInt8?) {
        self.opCode = Data([0x82, 0x02])

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
        msgData.append(state.rawValue)
        msgData.append(transaction)

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

/// Mesh Message Generic OnOff Set Unacknowledged
///
/// Generic OnOff Set Unacknowledged is an unacknowledged message used to set the
/// Generic OnOff state of an element.
public struct MeshMessageGenericOnOffSetUnacknowledged: MeshMessage {

    /// Op Code
    private(set) public var opCode: Data

    /// State
    private(set) public var state: GenericOnOffState

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
    ///   - state: OnOff State
    ///   - transaction: Transaction Identifier
    ///   - transition: Transition Time
    ///   - delay: Message execution delay
    public init(state: GenericOnOffState, transaction: UInt8, transition: MeshTransitionTime?, delay: UInt8?) {
        self.opCode = Data([0x82, 0x03])

        self.state = state
        self.transaction = transaction
        self.transition = transition
        self.delay = delay
    }

    /// Encodes into Data
    ///
    /// - Returns: Encoded Data
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(opCode)
        msgData.append(state.rawValue)
        msgData.append(transaction)

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

/// Mesh Message Generic OnOff Status
///
/// Generic OnOff Status is an unacknowledged message used to report the Generic
/// OnOff state of an element.
public struct MeshMessageGenericOnOffStatus: MeshMessage {

    /// Op Code
    private(set) public var opCode: Data

    /// Present OnOff
    private(set) public var present: GenericOnOffState

    /// Target OnOff
    private(set) public var target: GenericOnOffState?

    /// Remaining Time
    private(set) public var remainingTime: MeshTransitionTime?

    /// Create Message
    ///
    /// - Parameters:
    ///   - present: Present OnOff
    ///   - target: Target OnOff
    ///   - remainingTime: Remaining Time
    public init(present: GenericOnOffState, target: GenericOnOffState?, remainingTime: MeshTransitionTime?) {
        self.opCode = Data([0x82, 0x04])

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
        msgData.append(present.rawValue)

        // C.1: If the Target OnOff field is present, the Remaining Time field
        /// shall also be present; otherwise these fields shall not be present.
        if let target = target {

            msgData.append(target.rawValue)

            if let remainingTime = remainingTime {
                msgData.append(remainingTime.rawValue)
            } else {
                return.failure(BluetoothEncodeError.missingProperties("Remaining Time must be present."))
            }
        }

        return.success(msgData)
    }
}
