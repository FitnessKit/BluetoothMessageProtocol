//
//  CharacteristicTimeUpdateState.swift
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

/// BLE Time Update State Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicTimeUpdateState: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Time Update State"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A0E"
    }

    /// Current State Types
    public enum CurrentStateType: UInt8 {
        /// Idle
        case idle           = 0
        /// Update Pending
        case updatePending  = 1
    }

    /// Update Result Types
    public enum UpdateResultType: UInt8 {
        /// Successful
        case successful         = 0
        /// Canceled
        case canceled           = 1
        /// No Connection To Reference
        case noConnection       = 2
        /// Reference responded with an error
        case referenceError     = 3
        /// Timeout
        case timeout            = 4
        /// Update not attempted after reset
        case noAttempt          = 5
    }

    /// Current State
    private(set) public var currentState: CurrentStateType

    /// Result
    private(set) public var result: UpdateResultType

    /// Creates Time Update State Characteristic
    ///
    /// - Parameters:
    ///   - currentState: Current State
    ///   - result: Update Result
    public init(currentState: CurrentStateType, result: UpdateResultType) {
        self.currentState = currentState
        self.result = result

        super.init(name: CharacteristicTimeUpdateState.name,
                   uuidString: CharacteristicTimeUpdateState.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicTimeUpdateState {
        var decoder = DecodeData()

        let state = CurrentStateType(rawValue: decoder.decodeUInt8(data)) ?? .idle
        let result = UpdateResultType(rawValue: decoder.decodeUInt8(data)) ?? .successful

        return CharacteristicTimeUpdateState(currentState: state,
                                             result: result)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(currentState.rawValue)
        msgData.append(result.rawValue)

        return msgData
    }
}
