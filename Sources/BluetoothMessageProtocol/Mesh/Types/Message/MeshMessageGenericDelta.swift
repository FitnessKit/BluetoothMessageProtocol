//
//  MeshMessageGenericDelta.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/29/18.
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

/// Mesh Message Generic Delta Set
public struct MeshMessageGenericDeltaSet: MeshMessage {

    /// Op Code
    private(set) public var opCode: Data

    /// Create Message
    public init() {
        self.opCode = Data([0x82, 0x09])
    }

    /// Encodes into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(opCode)

        return.success(msgData)
    }
}

/// Mesh Message Generic Delta Set Unacknowledged
public struct MeshMessageGenericDeltaSetUnacknowledged: MeshMessage {

    /// Op Code
    private(set) public var opCode: Data

    /// Create Message
    public init() {
        self.opCode = Data([0x82, 0x0A])
    }

    /// Encodes into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(opCode)

        return.success(msgData)
    }
}
