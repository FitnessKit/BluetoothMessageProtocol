//
//  ProvisioningData.swift
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

/// Provisioning Data
///
/// Once the device has been authenticated, the Provisioner and device shall use the
/// calculated Diffie-Hellman shared secret ECDHSecret and generate a session key
/// from that shared secret. That session key shall then be used to encrypt and
/// authenticate the provisioning data. The Provisioner then shall send the Provisioning
/// Data PDU containing the encrypted and authenticated provisioning data to the device
public struct ProvisioningData: BluetoothEncodable {

    /// Flags
    public struct Flags: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }

        /// Key Refresh Phase 2 (If not set then phase 0)
        public static let refreshPhase2     = Flags(rawValue: 1 << 0)
        /// IV Update Active (else normal operation)
        public static let ivUpdateActive    = Flags(rawValue: 1 << 1)
    }

    /// Network Key
    private(set) public var networkKey: Data

    /// Key Index
    private(set) public var keyIndex: UInt16

    /// Flags
    private(set) public var flag: Flags

    /// IV Index Value
    ///
    /// Current value of the IV Index
    private(set) public var ivIndex: UInt32

    /// Unicast Address
    ///
    /// Unicast address of the primary element
    private(set) public var unicastAddress: UInt16

    /// Creates a ProvisioningData
    ///
    /// - Parameters:
    ///   - networkKey: Network Key
    ///   - keyIndex: Key Index
    ///   - flag: Flags
    ///   - ivIndex: IV Index Value
    ///   - unicastAddress: Unicast Address
    public init(networkKey: Data, keyIndex: UInt16, flag: Flags, ivIndex: UInt32, unicastAddress: UInt16) {
        self.networkKey = networkKey
        self.keyIndex = keyIndex
        self.flag = flag
        self.ivIndex = ivIndex
        self.unicastAddress = unicastAddress
    }

    /// Encodes ProvisioningData Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(networkKey)
        msgData.append(Data(from: keyIndex.bigEndian))
        msgData.append(flag.rawValue)
        msgData.append(Data(from: ivIndex.bigEndian))
        msgData.append(Data(from: unicastAddress.bigEndian))

        return.success(msgData)
    }
}

@available(swift 4.0)
extension ProvisioningData.Flags: Encodable {

    enum CodeKeys: CodingKey {
        case refreshPhase2
        case ivUpdateActive
    }

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
        var container = encoder.container(keyedBy: CodeKeys.self)

        try container.encode(self.contains(.refreshPhase2), forKey: .refreshPhase2)
        try container.encode(self.contains(.ivUpdateActive), forKey: .ivUpdateActive)
    }
}
