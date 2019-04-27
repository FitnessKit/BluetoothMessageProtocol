//
//  ProvisioningDataUnitStart.swift
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

/// Provisioning Data Unit Start
///
/// This Provisioner sends this PDU to deliver the public key to be used in the ECDH calculations
public struct ProvisioningDataUnitStart: ProvisioningDataUnit {

    /// Provisioning Protocol Data Unit Type
    private(set) public var unitType: ProvisioningDataUnitType

    /// Provisioning Algorithm
    public enum Algorithm: UInt8 {
        /// FIPS P-256 Elliptic Curve
        case fipsP256   = 0x00
    }

    /// Public Key Type
    public enum PublicKeyType: UInt8 {
        /// No OOB Public Key is used
        case none       = 0
        /// OOB Public Key is used
        case oobPublic  = 1
    }

    /// Algorithm
    ///
    /// The algorithm used for provisioning
    private(set) public var algorithm: Algorithm

    /// Public Key
    ///
    /// Public Key used
    private(set) public var publicKey: PublicKeyType

    /// Authentication
    private(set) public var authentiction: ProvisioningAuthentication

    /// Create Provisioning Data Unit
    ///
    /// - Parameter algorithm: Algorithm
    /// - Parameter publicKey: Public Key
    /// - Parameter authentiction: ProvisioningAuthentication
    public init(algorithm: Algorithm, publicKey: PublicKeyType, authentiction: ProvisioningAuthentication) {
        self.unitType = .start
        self.algorithm = algorithm
        self.publicKey = publicKey
        self.authentiction = authentiction
    }

    /// Encodes Provisioning Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(unitType.rawValue)
        msgData.append(algorithm.rawValue)
        msgData.append(publicKey.rawValue)
        
        switch authentiction.encode() {
        case .success(let authentiction):
            msgData.append(authentiction)
        case .failure(let error):
            return.failure(error)
        }

        return.success(msgData)
    }
}

extension ProvisioningDataUnitStart.Algorithm {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension ProvisioningDataUnitStart.Algorithm: Encodable {

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

extension ProvisioningDataUnitStart.PublicKeyType {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension ProvisioningDataUnitStart.PublicKeyType: Encodable {

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
