//
//  CharacteristicHTTPControlPoint.swift
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

/// BLE HTTP Control Point Characteristic
///
/// The HTTP Control Point is used to initiate a request to send an HTTP request
/// message from the device contgaining the HTTP Proxy Service, acting as an HTTP
/// Client, and an HTTP Server
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicHTTPControlPoint: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "HTTP Control Point"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2ABA"
    }

    /// Command Types
    public enum Command: UInt8 {
        /// Unknow
        case unknown        = 0
        /// Initiates an HTTP GET Request
        case httpGet        = 1
        /// Initiates an HTTP HEAD Request
        case httpHead       = 2
        /// Initiates an HTTP POST Request
        case httpPost       = 3
        /// Initiates an HTTP PUT Request
        case httpPut        = 4
        /// Initiates an HTTP DELETE Request
        case httpDelete     = 5
        /// Initiates an HTTPS GET Request
        case httpsGet       = 6
        /// Initiates an HTTPS HEAD Request
        case httpsHead      = 7
        /// Initiates an HTTPS POST Request
        case httpsPost      = 8
        /// Initiates an HTTPS PUT Request
        case httpsPut       = 9
        /// Initiates an HTTPS DELETE Request
        case httpsDelete    = 10
        /// Terminates any executing HTTP Request from the HPS Client
        case httpCancel     = 11
    }

    /// Op Code
    ///
    /// Control Point Operations
    private(set) public var opCode: Command

    /// Creates HTTP Control Point Characteristic
    ///
    /// - Parameter opCode: OpCode Commands
    public init(opCode: Command) {
        self.opCode = opCode

        super.init(name: CharacteristicHTTPControlPoint.name,
                   uuidString: CharacteristicHTTPControlPoint.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicHTTPControlPoint {
        var decoder = DecodeData()

        let value = Command(rawValue: decoder.decodeUInt8(data)) ?? .unknown

        return CharacteristicHTTPControlPoint(opCode: value)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(opCode.rawValue)

        return msgData
    }
}
