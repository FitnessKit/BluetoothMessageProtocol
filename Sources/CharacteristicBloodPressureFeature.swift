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

    public static var name: String {
        return "Blood Pressure Feature"
    }

    public static var uuidString: String {
        return "2A49"
    }

    public struct Feature: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }

        public static let bodyMovementDetectionSupported: Feature           = Feature(rawValue: 1 << 0)
        public static let cuffFitDetectionSupported: Feature                = Feature(rawValue: 1 << 1)
        public static let irregularPulseDetectionSupported: Feature         = Feature(rawValue: 1 << 2)
        public static let pulseRateRangeDetectionSupported: Feature         = Feature(rawValue: 1 << 3)
        public static let measurementPositionDetectionSupported: Feature    = Feature(rawValue: 1 << 4)
        public static let multipleBondsSupported: Feature                   = Feature(rawValue: 1 << 5)

    }

    /// Supported Features
    fileprivate(set) public var supportedFeatures: Feature


    public init(status: Feature) {

        self.supportedFeatures = status

        super.init(name: CharacteristicBloodPressureFeature.name, uuidString: CharacteristicBloodPressureFeature.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicBloodPressureFeature {

        var decoder = DataDecoder(data)

        let status: Feature = Feature(rawValue: decoder.decodeUInt8())

        return CharacteristicBloodPressureFeature(status: status)
    }

    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(supportedFeatures.rawValue)
        
        return msgData
    }
    
}
