//
//  PairingTlvType.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/15/18.
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

/// HomeKit TLV8 Types for Pairing
public enum HomeKitPairingTlvType: UInt8 {
    /// Method to use for pairing
    case method             = 0x00
    /// Identifier for authentication
    case identifier         = 0x01
    /// 16+ bytes of random salt
    case salt               = 0x02
    /// Curve25519, SRP public key, or signed Ed25519 key
    case publicKey          = 0x03
    /// Ed25519 or SRP proof
    case proof              = 0x04
    /// Encrypted data with auth tag at end
    case encryptedData      = 0x05
    /// State of the pairing process.
    /// 1=M1, 2=M2, etc
    case state              = 0x06
    /// Error code.
    /// Must only be present if error code is not 0.
    case errorCode          = 0x07
    /// Seconds to delay until retrying a setup code
    case retryDelay         = 0x08
    /// X.509 Certificate
    case certificate        = 0x09
    /// Ed25519 or Apple Authentication Coprocessor signature
    case signature          = 0x0A
    /// Bit value describing permissions of the controller
    /// being added.
    /// - None (0x00) : Regular user
    /// - Bit 1 (0x01) : Admin that is able to add and remove
    ///   pairings against the accessory.
    case permissions        = 0x0B
    /// Non-last fragment of data.
    /// If length is 0, itʼs an ACK
    case fragmentData       = 0x0C
    /// Last fragment of data
    case fragmentLast       = 0x0D
    /// Pairing Type Flags
    case flags              = 0x13
    /// Zero-length TLV that separates different TLVs in a list
    case separator          = 0xFF
}

public extension HomeKitPairingTlvType {

    /// Name of the Type
    var name: String {
        switch self {
        case .method:
            return "kTLVType_Method"
        case .identifier:
            return "kTLVType_Identifier"
        case .salt:
            return "kTLVType_Salt"
        case .publicKey:
            return "kTLVType_PublicKey"
        case .proof:
            return "kTLVType_Proof"
        case .encryptedData:
            return "kTLVType_EncryptedData"
        case .state:
            return "kTLVType_State"
        case .errorCode:
            return "kTLVType_Error"
        case .retryDelay:
            return "kTLVType_RetryDelay"
        case .certificate:
            return "kTLVType_Certificate"
        case .signature:
            return "kTLVType_Signature"
        case .permissions:
            return "kTLVType_Permissions"
        case .fragmentData:
            return "kTLVType_FragmentData"
        case .fragmentLast:
            return "kTLVType_FragmentLast"
        case .flags:
            return "kTLVType_Flags"
        case .separator:
            return "kTLVType_Separator"
        }
    }
}

extension HomeKitPairingTlvType {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension HomeKitPairingTlvType: Encodable {

    /// CodingKey with a Type and Value
    public enum CodingKeys: CodingKey {
        case type
        case value
        case name
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
        var container = encoder.container(keyedBy: CodingKeys.self)

        /// Prefer the name of the type over a raw value
        try container.encode(self.rawValue, forKey: .value)
        try container.encode(self.description, forKey: .type)
        try container.encode(self.name, forKey: .name)
    }
}

internal extension HomeKitPairingTlvType {

    /// Provides the Format for the Type
    var format: HomeKitTlvFormat {
        switch self {
        case .method:
            return .integer
        case .identifier:
            return .string
        case .salt:
            return .data
        case .publicKey:
            return .data
        case .proof:
            return .data
        case .encryptedData:
            return .data
        case .state:
            return .integer
        case .errorCode:
            return .integer
        case .retryDelay:
            return .integer
        case .certificate:
            return .data
        case .signature:
            return .data
        case .permissions:
            return .integer
        case .fragmentData:
            return .data
        case .fragmentLast:
            return .data
        case .flags:
            return .integer
        case .separator:
            return .null
        }
    }
}
