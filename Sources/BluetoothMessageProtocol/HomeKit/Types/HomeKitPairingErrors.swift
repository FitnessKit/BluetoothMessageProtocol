//
//  HomeKitPairingErrors.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/21/18.
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

/// HomeKit Pairing Errors
public enum HomeKitPairingErrorType: UInt8 {
    /// Reserved
    case none               = 0x00
    /// Generic error to handle unexpected errors
    case unknown            = 0x01
    /// Setup code or signature verification failed
    case authentication     = 0x02
    /// Client must look at the retry delay TLV item and wait that many
    /// seconds before retrying
    case backoff            = 0x03
    /// Server cannot accept any more pairings.
    case maxPeers           = 0x04
    /// Server reached its maximum number of authentication attempts
    case maxTries           = 0x05
    /// Server pairing method is unavailable
    case unavailable        = 0x06
    /// Server is busy and cannot accept a pairing request at this time.
    case busy               = 0x07
}

public extension HomeKitPairingErrorType {

    /// Name of the Type
    var name: String {
        switch self {
        case .none:
            return "kTLVError_None"
        case .unknown:
            return "kTLVError_Unknown"
        case .authentication:
            return "kTLVError_Authentication"
        case .backoff:
            return "kTLVError_Backoff"
        case .maxPeers:
            return "kTLVError_MaxPeers"
        case .maxTries:
            return "kTLVError_MaxTries"
        case .unavailable:
            return "kTLVError_Unavailable"
        case .busy:
            return "kTLVError_Busy"
        }
    }
}

extension HomeKitPairingErrorType {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension HomeKitPairingErrorType: Encodable {

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
