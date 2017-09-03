//
//  CharacteristicContinuousGlucoseMonitoringFeature.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/19/17.
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

/// BLE Continuous Glucose Monitoring Feature Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicContinuousGlucoseMonitoringFeature: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Continuous Glucose Monitoring Feature"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2AA8"
    }

    public struct Features: OptionSet {
        public let rawValue: UInt32
        public init(rawValue: UInt32) { self.rawValue = rawValue }

        /// Calibration Supported
        public static let calibrationSupported: Features                    = Features(rawValue: 1 << 0)
        /// Patient High/Low Alerts supported
        public static let patientAlertsSupported: Features                  = Features(rawValue: 1 << 1)
        /// Hypo Alerts supported
        public static let hypoAlertsSupported: Features                     = Features(rawValue: 1 << 2)
        /// Hyper Alerts supported
        public static let hyperAlertsSupported: Features                    = Features(rawValue: 1 << 3)
        /// Rate of Increase/Decrease Alerts supported
        public static let rateAlertsSupported: Features                     = Features(rawValue: 1 << 4)
        /// Device Specific Alert supported
        public static let deviceSpecificAlertsSupported: Features           = Features(rawValue: 1 << 5)
        /// Sensor Malfunction Detection supported
        public static let sensorMalfunctionDetectionSupported: Features     = Features(rawValue: 1 << 6)
        /// Sensor Temperature High-Low Detection supported
        public static let sensorTemperatureDetectionSupported: Features     = Features(rawValue: 1 << 7)
        /// Sensor Result High-Low Detection supported
        public static let sensorResultsDetectionSupported: Features         = Features(rawValue: 1 << 8)
        /// Low Battery Detection supported
        public static let lowBatteryDetectionSupported: Features            = Features(rawValue: 1 << 9)
        /// Sensor Type Error Detection supported
        public static let sensorTypeErrorDetectionSupported: Features       = Features(rawValue: 1 << 10)
        /// General Device Fault supported
        public static let generalDefaultFaultSupported: Features            = Features(rawValue: 1 << 11)
        /// E2E-CRC supported
        public static let e2eCRCSupported: Features                         = Features(rawValue: 1 << 12)
        /// Multiple Bond supported
        public static let multipleBondSupported: Features                   = Features(rawValue: 1 << 13)
        /// Multiple Sessions supported
        public static let multipleSessionsSupported: Features               = Features(rawValue: 1 << 14)
        /// CGM Trend Information supported
        public static let trendInformationSupported: Features               = Features(rawValue: 1 << 15)
        /// CGM Quality supported
        public static let qualitySupported: Features                        = Features(rawValue: 1 << 16)
    }

    /// Type of Continuous Glucose Monitor
    public enum TestType: UInt8 {
        /// Reserved for future use
        case reserved                   = 0
        /// Capillary Whole blood
        case capillaryWholeBlood        = 1
        /// Capillary Plasma
        case capillaryPlasma            = 2
        /// Capillary Whole blood
        case capWholeBlood              = 3 //Same as 1
        /// Venous Plasma
        case venousPlasma               = 4
        /// Arterial Whole blood
        case arterialWholeBlood         = 5
        /// Arterial Plasma
        case arterialPlasma             = 6
        /// Undetermined Whole blood
        case undetermindedWholeBlood    = 7
        /// Undetermined Plasma
        case undeterminedPlasma         = 8
        /// Interstitial Fluid (ISF)
        case intersitialFluid           = 9
        /// Control Solution
        case controlSolutions           = 10
    }

    public enum Location: UInt8 {
        /// Reserved for future use
        case reserved                   = 0
        /// Finger
        case finger                     = 1
        /// Alternate Site Test (AST)
        case alternateSiteTest          = 2
        /// Earlobe
        case earlobe                    = 3
        /// Control solution
        case controlSolution            = 4
        /// Subcutaneous tissue
        case subcutaneousTissue         = 5
        /// Sample Location value not available
        case notAvailable               = 6
    }

    /// Supported Features
    private(set) public var features: Features

    /// Type of CGM Test
    private(set) public var testType: TestType

    /// Sample Location
    private(set) public var sampleLocation: Location

    /// E2E-CRC
    private(set) public var crcValue: UInt16?

    public init(features: Features, testType: TestType, sampleLocation: Location, crcValue: UInt16?) {

        self.features = features
        self.testType = testType
        self.sampleLocation = sampleLocation
        self.crcValue = crcValue

        super.init(name: CharacteristicContinuousGlucoseMonitoringFeature.name, uuidString: CharacteristicContinuousGlucoseMonitoringFeature.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicContinuousGlucoseMonitoringFeature {

        var decoder = DataDecoder(data)

        let featureVal = decoder.decodeUInt24()
        let features: Features = Features(rawValue: UInt32(featureVal))

        let nibble = decoder.decodeNibble()
        let testType = TestType(rawValue: nibble.lower) ?? .reserved
        let sampleLocation = Location(rawValue: nibble.upper) ?? .notAvailable

        var crc: UInt16?

        let crcValue = decoder.decodeUInt16()
        if crcValue != UInt16.max {
            crc = crcValue
        }

        return CharacteristicContinuousGlucoseMonitoringFeature(features: features, testType: testType, sampleLocation: sampleLocation, crcValue: crc)
    }

    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError.init(.unsupported)
    }
}
