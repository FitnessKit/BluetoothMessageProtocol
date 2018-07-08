//
//  CharacteristicAlertStatus.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/6/17.
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

/// BLE Alert Status Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicAlertStatus: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Alert Status"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A3F"
    }

    /// Types of Alert Status
    public struct AlertStatus: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }

        /// Ringer State active
        public static let ringerStateActive     = AlertStatus(rawValue: 1 << 0)
        /// Vibrate State active
        public static let vibrateStateActive    = AlertStatus(rawValue: 1 << 1)
        /// Display Alert Status State active
        public static let displayAlertActive    = AlertStatus(rawValue: 1 << 2)
    }

    /// Alert Status Type
    private(set) public var status: AlertStatus

    /// Creates Alert Status Characteristic
    ///
    /// - Parameter status: AlertStatus options
    public init(status: AlertStatus) {
        self.status = status

        super.init(name: CharacteristicAlertStatus.name,
                   uuidString: CharacteristicAlertStatus.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicAlertStatus {
        var decoder = DecodeData()

        let status: AlertStatus = AlertStatus(rawValue: decoder.decodeUInt8(data))

        return CharacteristicAlertStatus(status: status)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()
        
        msgData.append(status.rawValue)
        
        return msgData
    }
}
