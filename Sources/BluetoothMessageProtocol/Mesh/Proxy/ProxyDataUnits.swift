//
//  ProxyDataUnits.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/7/18.
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

/// Proxy Protocol Data Message Type
public struct ProxyMessageType {

    /// Message Segmentation Type
    public enum MessageSegment: UInt8 {
        /// Data field contains a complete message
        case completeMessage        = 0
        /// Data field contains the first segment of a message
        case firstSegment           = 1
        /// Data field contains a continuation segment of a message
        case continuationSegment    = 2
        /// Data field contains the last segment of a message
        case lastSegment            = 3
    }

    /// Proxy PDU Type
    public enum ProxyDataUnitType: UInt8 {
        /// Network PDU
        case network            = 0
        /// Mesh Beacon
        case meshBeacon         = 1
        /// Proxy Configuration
        case proxyConfiguration = 2
        /// Provisioning PDU
        case provisioning       = 3
    }

    /// Message Segmentation
    private(set) public var segment: MessageSegment

    /// Proxy Protocol Data Unit Type
    private(set) public var message: ProxyDataUnitType

    /// Raw Value
    public var rawValue: UInt8 {
        var value: UInt8 = message.rawValue
        value |= segment.rawValue << 6

        return UInt8(value)
    }

    /// Creates a ProxyMessageType Object
    ///
    /// - Parameter segment: Message Segment
    /// - Parameter message: Message Type
    public init(segment: MessageSegment, message: ProxyDataUnitType) {
        self.segment = segment
        self.message = message
    }

    /// Creates a ProxyMessageType Object
    ///
    /// - Parameter value: Raw Value
    /// - Throws: BluetoothMessageProtocolError
    internal init(_ value: UInt8) throws {
        guard let message = ProxyDataUnitType(rawValue: (value & 0x3F)) else {
            throw BluetoothMessageProtocolError(message: "Message Type not supported")
        }
        guard let segment = MessageSegment(rawValue: (value & 0xC0) >> 6) else {
            throw BluetoothMessageProtocolError(message: "Segment Type not supported")
        }

        self.segment = segment
        self.message = message
    }
}

/// Protocol for Proxy Protocol Data Unit
public protocol ProxyDataUnit {
    
    /// Proxy Protocol Message Type
    var messageType: ProxyMessageType { get }

    /// Encodes Proxy Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    func encode() throws -> Data
}

/// Proxy Protocol Data Unit for Mesh Beacon
public struct ProxyDataUnitBeacon: ProxyDataUnit {

    /// Proxy Protocol Message Type
    private(set) public var messageType: ProxyMessageType

    /// Mesh Beacon
    private(set) public var beacon: MeshBeacon

    /// Create Proxy Data Unit
    ///
    /// - Parameter segment: Message segment
    /// - Parameter beacon: Mesh Beacon
    public init(segment: ProxyMessageType.MessageSegment, beacon: MeshBeacon) {
        self.messageType = ProxyMessageType(segment: segment, message: .meshBeacon)
        self.beacon = beacon
    }

    /// Encodes Proxy Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(messageType.rawValue)
        msgData.append(try beacon.encode())

        return msgData
    }
}

/// Proxy Protocol Data Unit for Provisioning PDU
public struct ProxyDataUnitProvisioning: ProxyDataUnit {

    /// Proxy Protocol Message Type
    private(set) public var messageType: ProxyMessageType

    /// Provisioning PDU Message
    private(set) public var provisioningMessage: ProvisioningDataUnit

    /// Create Proxy Data Unit
    ///
    /// - Parameter segment: Message segment
    /// - Parameter provisioningMessage: Provisioning PDU
    public init(segment: ProxyMessageType.MessageSegment, provisioningMessage: ProvisioningDataUnit) {
        self.messageType = ProxyMessageType(segment: segment, message: .provisioning)
        self.provisioningMessage = provisioningMessage
    }

    /// Encodes Proxy Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(messageType.rawValue)
        msgData.append(try provisioningMessage.encode())

        return msgData
    }
}
