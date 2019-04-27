//
//  ProvisioningDataUnitInvite.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/4/18.
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

/// Provisioning Attention Timer
///
/// The Attention Timer state determines if the Attention Timer state is on or off.
/// This is generally intended to allow an element to attract human attention and,
/// among others, is used during provisioning.
///
/// When the Attention Timer state is on, the value determines how long the element
/// shall remain attracting human’s attention. The element does that by behaving in a
/// human-recognizable way (e.g., a lamp flashes, a motor makes noise, an LED blinks).
/// The exact behavior is implementation specific and depends on the type of device.
/// Normal behavior of the element is still active, although the method of identification
/// may override the physical state of the device
public enum ProvisioningAttentionTimer {
    /// Off
    case off
    /// Remaining time in seconds
    case time(_: UInt8)

    /// Raw Value
    public var rawValue: UInt8 {
        switch self {
        case .off:
            return UInt8.min
        case .time(let num):
            return num
        }
    }

    /// Creates a ProvisioningAuthenticationSize
    ///
    /// - Parameter value: raw value
    /// - Returns: ProvisioningAttentionTimer
    public static func create(_ value: UInt8) -> ProvisioningAttentionTimer {
        if value == UInt8.min {
            return ProvisioningAttentionTimer.off
        } else {
            return ProvisioningAttentionTimer.time(value)
        }
    }
}

/// Provisioning Data Unit Invite
///
/// A Provisioner sends this PDU to indicate to the device that the provisioning process is starting
public struct ProvisioningDataUnitInvite: ProvisioningDataUnit {

    /// Provisioning Protocol Data Unit Type
    private(set) public var unitType: ProvisioningDataUnitType

    /// Attention Duration
    private(set) public var timerState: ProvisioningAttentionTimer

    /// Create Provisioning Data Unit
    ///
    /// - Parameter timerState: Attention Duration
    public init(timerState: ProvisioningAttentionTimer) {
        self.unitType = .invite
        self.timerState = timerState
    }

    /// Encodes Provisioning Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(unitType.rawValue)
        msgData.append(timerState.rawValue)

        return.success(msgData)
    }
}
