//
//  GapAdvertisingType.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 6/23/18.
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

/// Generic Access Profile Advertising Type
public enum GapAdvertisingType: UInt8 {
    /// Connectable undirected advertising
    case connectableUndirected      = 0
    /// Connectable directed
    case connectableDirected        = 1
    /// Scannable undirected
    case scannableUndirected        = 2
    /// Non Connectable undirected
    case nonConnectableUndirected   = 3
    /// Scan Response
    case scanResponse               = 4

    // Unknown
    case unknown                    = 255
}

@available(swift 4.0)
extension GapAdvertisingType: Encodable {

    public var description: String {
        return String(describing: self)
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
        var container = encoder.container(keyedBy: TypeValueCodingKeys.self)

        try container.encode(self.description, forKey: .type)
        try container.encode(self.rawValue, forKey: .value)

    }
}
