//
//  CharacteristicTrainingStatus.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/27/17.
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

/// BLE Training Status Characteristic
///
/// Provides the current training state while a user is exercising
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicTrainingStatus: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Training Status"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2AD3"
    }

    /// Flags
    private struct Flags: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }

        /// Training Status String present
        public static let trainingStatusStringPresent    = Flags(rawValue: 1 << 0)
        /// Extended String present
        public static let extendedStringPresent          = Flags(rawValue: 1 << 1)
    }

    /// Training Status
    public enum TrainingStatus: UInt8 {
        /// Other
        case other                          = 0
        /// Idle
        case idle                           = 1
        /// Warming Up
        case warmingUp                      = 2
        /// Low Intensity Interval
        case lowIntensityInterval           = 3
        /// High Intensity Interval
        case highIntensityInterval          = 4
        /// Recovery Interval
        case recoveryInterval               = 5
        /// Isometric
        case isometric                      = 6
        /// Heart Rate Control
        case heartRateControl               = 7
        /// Fitness Test
        case fitnessTest                    = 8
        /// Speed Outside of Control Region - Low (increase speed to return to controllable region)
        case lowSpeedOutsideControlRegion   = 9
        /// Speed Outside of Control Region - High (decrease speed to return to controllable region)
        case highSpeedOutsideControlRegion  = 10
        /// Cool Down
        case coolDown                       = 11
        /// Watt Control
        case wattControl                    = 12
        /// Manual Mode (Quick Start)
        case manualMode                     = 13
        /// Pre-Workout
        case preWorkout                     = 14
        /// Post-Workout
        case postWorkout                    = 15
    }

    /// Training Status
    private(set) public var status: TrainingStatus

    /// Training Status String
    private(set) public var statusString: String?

    /// Creates Training Status Characteristic
    ///
    /// - Parameters:
    ///   - status: Training Status
    ///   - statusString: Training Status String
    public init(status: TrainingStatus, statusString: String?) {
        self.status = status
        self.statusString = statusString

        super.init(name: CharacteristicTrainingStatus.name,
                   uuidString: CharacteristicTrainingStatus.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicTrainingStatus {
        var decoder = DecodeData()

        let flags = Flags(rawValue: decoder.decodeUInt8(data))
        
        if flags.rawValue > 3 {
            throw BluetoothMessageProtocolError.decode("Training Status Flags don't match spec.")
        }

        let status = TrainingStatus(rawValue: decoder.decodeUInt8(data)) ?? .other

        var statusString: String?
        if flags.contains([.trainingStatusStringPresent]) {
            let stringData = Data(data[2..<data.count])
            statusString = stringData.safeStringValue
        }

        return CharacteristicTrainingStatus(status: status,
                                            statusString: statusString)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        var flags = Flags()

        if statusString != nil {
            flags.update(with: .trainingStatusStringPresent)
        }

        msgData.append(flags.rawValue)
        msgData.append(status.rawValue)

        if let stringData = statusString?.data(using: .utf8) {
            if flags.contains(.trainingStatusStringPresent) {
                msgData.append(stringData)
            }
        }

        return msgData
    }
}
