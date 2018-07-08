//
//  CharacteristicTimeSource.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/26/17.
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
import FitnessUnits

/// BLE Time Source Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicTimeSource: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Time Source"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A13"
    }

    /// Time Source Types
    public enum TimeSource: UInt8 {
        /// Unknown
        case unknown                = 0
        /// Network Time Protocol
        case networkTimeProtocol    = 1
        /// GPS
        case gps                    = 2
        /// Radio Time Signal
        case radioTimeSignal        = 3
        /// Manual
        case manual                 = 4
        /// Atomic Clock
        case atomicClock            = 5
        /// Cellular Network
        case cellularNetwork        = 6
    }

    /// Time Source
    private(set) public var source: TimeSource

    /// Creates Time Source Characteristic
    ///
    /// - Parameter source: Time Source
    public init(source: TimeSource) {
        self.source = source

        super.init(name: CharacteristicTimeSource.name,
                   uuidString: CharacteristicTimeSource.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicTimeSource {
        var decoder = DecodeData()

        let source = TimeSource(rawValue: decoder.decodeUInt8(data)) ?? .unknown

        return CharacteristicTimeSource(source: source)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(source.rawValue)

        return msgData
    }
}
