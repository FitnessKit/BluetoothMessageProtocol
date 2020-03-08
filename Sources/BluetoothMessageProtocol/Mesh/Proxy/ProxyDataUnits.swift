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

/// Protocol for Proxy Protocol Data Unit
public protocol ProxyDataUnit: BluetoothEncodable {
    
    /// Proxy Protocol Message Type
    var messageType: ProxyMessageType { get }
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
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(messageType.rawValue)
        switch beacon.encode() {
        case .success(let beacon):
            msgData.append(beacon)
        case .failure(let error):
            return.failure(error)
        }

        return.success(msgData)
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
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(messageType.rawValue)

        switch provisioningMessage.encode() {
        case .success(let provisioningMessage):
            msgData.append(provisioningMessage)
        case .failure(let error):
            return.failure(error)
        }

        return.success(msgData)
    }
}
