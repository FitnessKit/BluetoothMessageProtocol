//
//  CharacteristicSportTypeForAerobicAndAnaerobicThresholds.swift
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

/// BLE Sport Type for Aerobic and Anaerobic Thresholds Characteristic
///
/// Aerobic Threshold and Anaerobic Threshold together with the Sport Type for
/// Aerobic and Anaerobic Thresholds describe the metabolic thresholds of the user.
/// The Sport Type for Aerobic and Anaerobic Thresholds identifies how the measurement was performed
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicSportTypeForAerobicAndAnaerobicThresholds: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Sport Type for Aerobic and Anaerobic Thresholds"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A93"
    }

    /// Sport Types
    public enum SportType: UInt8 {
        /// Unspecified
        case unspecified            = 0
        /// Running (Treadmill)
        case runningTreadmill       = 1
        /// Cycling (Ergometer)
        case cyclingTrainer         = 2
        /// Rowing (Ergometer)
        case rowingTrainer          = 3
        /// Cross Training (Elliptical)
        case elliptical             = 4
        /// Climbing
        case climbing               = 5
        /// Skiing
        case skiing                 = 6
        /// Skating
        case skating                = 7
        /// Arm exercising
        case armExercising          = 8
        /// Lower body exercising
        case lowerBodyExercising    = 9
        /// Upper body exercising
        case upperBodyExercising    = 10
        /// Whole body exercising
        case wholeBodyExercising    = 11
    }

    /// Sport Type for Aerobic and Anaerobic Thresholds
    private(set) public var exercise: SportType

    /// Creates Sport Type for Aerobic and Anaerobic Thresholds Characteristic
    ///
    /// - Parameter exercise: Sport Type for Aerobic and Anaerobic Thresholds
    public init(exercise: SportType) {
        self.exercise = exercise

        super.init(name: CharacteristicSportTypeForAerobicAndAnaerobicThresholds.name,
                   uuidString: CharacteristicSportTypeForAerobicAndAnaerobicThresholds.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicSportTypeForAerobicAndAnaerobicThresholds {
        var decoder = DecodeData()

        let exercise = SportType(rawValue: decoder.decodeUInt8(data)) ?? .unspecified

        return CharacteristicSportTypeForAerobicAndAnaerobicThresholds(exercise: exercise)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(exercise.rawValue)

        return msgData
    }
}
