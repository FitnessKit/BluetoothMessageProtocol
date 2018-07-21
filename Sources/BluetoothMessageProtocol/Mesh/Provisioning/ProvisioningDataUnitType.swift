//
//  ProvisioningDataUnitType.swift
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

/// Provisioning Protocol Data Unit Types
public enum ProvisioningDataUnitType: UInt8 {
    /// Invites a device to join a mesh network
    case invite                 = 0x00
    /// Indicates the capabilities of the device
    case capabilities           = 0x01
    /// Indicates the provisioning method selected by the Provisioner based on the
    /// capabilities of the device
    case start                  = 0x02
    /// Contains the Public Key of the device or the Provisioner
    case publicKey              = 0x03
    /// Indicates that the user has completed inputting a value
    case inputComplete          = 0x04
    /// Contains the provisioning confirmation value of the device or the Provisioner
    case confirmation           = 0x05
    /// Contains the provisioning random value of the device or the Provisioner
    case random                 = 0x06
    /// Includes the assigned unicast address of the primary element, a network key,
    /// NetKey Index, Flags and the IV Index
    case data                   = 0x07
    /// Indicates that provisioning is complete
    case complete               = 0x08
    /// Indicates that provisioning was unsuccessful
    case failed                 = 0x09
}

extension ProvisioningDataUnitType {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension ProvisioningDataUnitType: Encodable {

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
