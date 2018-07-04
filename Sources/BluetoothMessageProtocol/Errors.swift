//
//  Errors.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/5/17.
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

/// BluetoothMessageProtocol Error Reasons
public enum ErrorReasons {
    /// Unsupported
    case unsupported
    /// Encoding error
    case encodeError(msg: String)
    /// Decoding error
    case decodeError(msg: String)
    /// Company ID Already registered
    case companyRegistration(msg: String)

    /// Generic Error
    case generic(String)
}

/// BluetoothMessageProtocol Error
public struct BluetoothMessageProtocolError: Error {
    /// Error Type
    public let type: ErrorReasons

    /// Creates BluetoothMessageProtocol Error
    ///
    /// - Parameter type: Error Reason
    public init(_ type: ErrorReasons) {
        self.type = type
    }

    /// Creates BluetoothMessageProtocol Error
    ///
    /// - Parameter message: String Message
    public init(message: String) {
        self.type = .generic(message)
    }
}

@available(swift 4.0)
extension BluetoothMessageProtocolError: Encodable {

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
        var container = encoder.container(keyedBy: StringKey.self)

        let errkey = StringKey(stringValue: "message")!
        let typeKey = StringKey(stringValue: "error")!

        switch type {
        case .unsupported:
            try container.encode("unsupported", forKey: typeKey)
        case .encodeError(let msg):
            try container.encode("Encode Error", forKey: typeKey)
            try container.encode(msg, forKey: errkey)

        case .decodeError(let msg):
            try container.encode("Decode Error", forKey: typeKey)
            try container.encode(msg, forKey: errkey)

        case .companyRegistration(let msg):
            try container.encode("Company Registration", forKey: typeKey)
            try container.encode(msg, forKey: errkey)

        case .generic(let msg):
            try container.encode("Generic", forKey: typeKey)
            try container.encode(msg, forKey: errkey)
        }
    }
}
