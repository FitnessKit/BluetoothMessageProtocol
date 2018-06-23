//
//  PeerAddress.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 6/16/18.
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

/// BLE Peer Address
public struct PeerAddress {

    /// Type of Peer Address
    public enum PeerType: UInt8 {
        /// Public
        case `public`                   = 0
        /// Random Static
        case randomStatic               = 1
        /// Random Private Resolvable
        case randomPrivateResolvable    = 2
        /// Random Private Non-Resolvable
        case randomPrivate              = 3

        case unknown                    = 255
    }

    /// Peer Address Type
    private(set) public var type: PeerType

    /// Address
    private(set) public var address: String

    public init(type: PeerType, address: String) {
        self.type = type
        self.address = address
    }
}
