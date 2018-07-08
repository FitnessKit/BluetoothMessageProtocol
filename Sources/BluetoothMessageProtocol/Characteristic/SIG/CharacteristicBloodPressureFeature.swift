//
//  CharacteristicBloodPressureFeature.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/12/17.
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

/// BLE Blood Pressure Feature Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicBloodPressureFeature: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Blood Pressure Feature"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A49"
    }

    /// Supported Feature Types
    public struct Feature: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }

        /// Body Movement Detection feature supported
        public static let bodyMovementDetectionSupported            = Feature(rawValue: 1 << 0)
        /// Cuff Fit Detection feature supported
        public static let cuffFitDetectionSupported                 = Feature(rawValue: 1 << 1)
        /// Irregular Pulse Detection feature supported
        public static let irregularPulseDetectionSupported          = Feature(rawValue: 1 << 2)
        /// Pulse Rate Range Detection feature supported
        public static let pulseRateRangeDetectionSupported          = Feature(rawValue: 1 << 3)
        /// Measurement Position Detection feature supported
        public static let measurementPositionDetectionSupported     = Feature(rawValue: 1 << 4)
        /// Multiple Bonds supported
        public static let multipleBondsSupported                    = Feature(rawValue: 1 << 5)
    }

    /// Supported Features
    private(set) public var supportedFeatures: Feature

    /// Creates Blood Pressure Feature Characteristic
    ///
    /// - Parameter status: Blood Pressure Features
    public init(status: Feature) {
        self.supportedFeatures = status

        super.init(name: CharacteristicBloodPressureFeature.name,
                   uuidString: CharacteristicBloodPressureFeature.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicBloodPressureFeature {
        var decoder = DecodeData()

        let status = Feature(rawValue: decoder.decodeUInt8(data))

        return CharacteristicBloodPressureFeature(status: status)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(supportedFeatures.rawValue)
        
        return msgData
    }
}
