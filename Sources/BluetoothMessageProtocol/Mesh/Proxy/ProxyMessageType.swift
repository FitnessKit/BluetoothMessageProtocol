//
//  ProxyMessageType.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 3/8/20.
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
public struct ProxyMessageType: Hashable {

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
    /// - Throws: BluetoothDecodeError
    internal init(_ value: UInt8) throws {
        guard let message = ProxyDataUnitType(rawValue: (value & 0x3F)) else {
            throw BluetoothDecodeError.general("Message Type not supported")
        }
        guard let segment = MessageSegment(rawValue: (value & 0xC0) >> 6) else {
            throw BluetoothDecodeError.general("Segment Type not supported")
        }

        self.segment = segment
        self.message = message
    }
}
