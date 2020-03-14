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
final public class CharacteristicContinuousGlucoseMonitoringFeature: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Continuous Glucose Monitoring Feature" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2AA8" }
    
    /// Characteristic Supported Features
    public struct Features: OptionSet, Hashable {
        public let rawValue: UInt32
        public init(rawValue: UInt32) { self.rawValue = rawValue }
        
        /// Calibration Supported
        public static let calibrationSupported                  = Features(rawValue: 1 << 0)
        /// Patient High/Low Alerts supported
        public static let patientAlertsSupported                = Features(rawValue: 1 << 1)
        /// Hypo Alerts supported
        public static let hypoAlertsSupported                   = Features(rawValue: 1 << 2)
        /// Hyper Alerts supported
        public static let hyperAlertsSupported                  = Features(rawValue: 1 << 3)
        /// Rate of Increase/Decrease Alerts supported
        public static let rateAlertsSupported                   = Features(rawValue: 1 << 4)
        /// Device Specific Alert supported
        public static let deviceSpecificAlertsSupported         = Features(rawValue: 1 << 5)
        /// Sensor Malfunction Detection supported
        public static let sensorMalfunctionDetectionSupported   = Features(rawValue: 1 << 6)
        /// Sensor Temperature High-Low Detection supported
        public static let sensorTemperatureDetectionSupported   = Features(rawValue: 1 << 7)
        /// Sensor Result High-Low Detection supported
        public static let sensorResultsDetectionSupported       = Features(rawValue: 1 << 8)
        /// Low Battery Detection supported
        public static let lowBatteryDetectionSupported          = Features(rawValue: 1 << 9)
        /// Sensor Type Error Detection supported
        public static let sensorTypeErrorDetectionSupported     = Features(rawValue: 1 << 10)
        /// General Device Fault supported
        public static let generalDefaultFaultSupported          = Features(rawValue: 1 << 11)
        /// E2E-CRC supported
        public static let e2eCRCSupported                       = Features(rawValue: 1 << 12)
        /// Multiple Bond supported
        public static let multipleBondSupported                 = Features(rawValue: 1 << 13)
        /// Multiple Sessions supported
        public static let multipleSessionsSupported             = Features(rawValue: 1 << 14)
        /// CGM Trend Information supported
        public static let trendInformationSupported             = Features(rawValue: 1 << 15)
        /// CGM Quality supported
        public static let qualitySupported                      = Features(rawValue: 1 << 16)
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
    
    /// Location of Continuous Glucose Monitors
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
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Supported Features
    private(set) public var features: Features
    
    /// Type of CGM Test
    private(set) public var testType: TestType
    
    /// Sample Location
    private(set) public var sampleLocation: Location
    
    /// E2E-CRC
    private(set) public var crcValue: UInt16?
    
    /// Creates Continuous Glucose Monitoring Feature Characteristic
    ///
    /// - Parameters:
    ///   - features: Supported Features
    ///   - testType: Type of CGM Test
    ///   - sampleLocation: Sample Location
    ///   - crcValue: E2E-CRC
    public init(features: Features, testType: TestType, sampleLocation: Location, crcValue: UInt16?) {
        self.features = features
        self.testType = testType
        self.sampleLocation = sampleLocation
        self.crcValue = crcValue
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let featureVal = decoder.decodeUInt24(data)
        let features: Features = Features(rawValue: UInt32(featureVal))
        
        let nibble = decoder.decodeNibble(data)
        let testType = TestType(rawValue: nibble.lower) ?? .reserved
        let sampleLocation = Location(rawValue: nibble.upper) ?? .notAvailable
        
        var crc: UInt16?
        
        let crcValue = decoder.decodeUInt16(data)
        if crcValue != UInt16.max {
            crc = crcValue
        }
        
        let char = CharacteristicContinuousGlucoseMonitoringFeature(features: features,
                                                                    testType: testType,
                                                                    sampleLocation: sampleLocation,
                                                                    crcValue: crc)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        /// Not Yet Supported
        return.failure(BluetoothEncodeError.notSupported)
    }
}

extension CharacteristicContinuousGlucoseMonitoringFeature: Hashable {
    
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuidString)
        hasher.combine(features)
        hasher.combine(testType)
        hasher.combine(sampleLocation)
        hasher.combine(crcValue)
    }
}

extension CharacteristicContinuousGlucoseMonitoringFeature: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicContinuousGlucoseMonitoringFeature, rhs: CharacteristicContinuousGlucoseMonitoringFeature) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.features == rhs.features)
            && (lhs.testType == rhs.testType)
            && (lhs.sampleLocation == rhs.sampleLocation)
            && (lhs.crcValue == rhs.crcValue)
    }
}
