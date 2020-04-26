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
final public class CharacteristicBloodPressureFeature: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Blood Pressure Feature" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A49" }
    
    /// Supported Feature Types
    public struct Feature: OptionSet, Hashable {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }
        
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
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Supported Features
    private(set) public var supportedFeatures: Feature
    
    /// Creates Blood Pressure Feature Characteristic
    ///
    /// - Parameter status: Blood Pressure Features
    public init(status: Feature) {
        self.supportedFeatures = status
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let status = Feature(rawValue: decoder.decodeUInt16(data))
        
        let char = CharacteristicBloodPressureFeature(status: status)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        msgData.append(Data(from: UInt16(supportedFeatures.rawValue.littleEndian)))

        return.success(msgData)
    }
}

extension CharacteristicBloodPressureFeature: Hashable {
    
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
        hasher.combine(supportedFeatures)
    }
}

extension CharacteristicBloodPressureFeature: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicBloodPressureFeature, rhs: CharacteristicBloodPressureFeature) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.supportedFeatures == rhs.supportedFeatures)
    }
}
