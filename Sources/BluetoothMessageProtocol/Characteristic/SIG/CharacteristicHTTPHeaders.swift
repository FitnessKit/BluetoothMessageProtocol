//
//  CharacteristicHTTPHeaders.swift
//  BluetoothMessageProtocol
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
import DataDecoder

/// BLE HTTP Headers Characteristic
///
/// The HTTP Headers Characteristic is used to hold the headers that would be sent to
/// the HTTP Request or the headers contained within an HTTP response message from the HTTP Server
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicHTTPHeaders: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "HTTP Headers"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2AB7"
    }

    /// HTTP Headers
    ///
    /// The HTTP headers to be used in the HTTP request
    private(set) public var headers: String

    /// Creates HTTP Headers Characteristic
    ///
    /// - Parameter headers: The HTTP Headers
    public init(headers: String) {
        self.headers = headers

        super.init(name: CharacteristicHTTPHeaders.name,
                   uuidString: CharacteristicHTTPHeaders.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicHTTPHeaders {
        let header = data.safeStringValue ?? ""

        return CharacteristicHTTPHeaders(headers: header)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError(.unsupported)
    }
}
