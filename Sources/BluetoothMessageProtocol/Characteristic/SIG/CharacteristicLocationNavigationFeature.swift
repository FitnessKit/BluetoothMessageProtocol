//
//  CharacteristicLocationNavigationFeature.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 5/2/20.
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

/// BLE Location Navigation Feature Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicLocationNavigationFeature: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Location Navigation Feature" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2AB5" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Location Navigation Feature
    private(set) public var features: SupportedFeatures
    
    /// Creates Location Navigation Feature Characteristic
    ///
    /// - Parameter features: Supported Features
    public init(features: SupportedFeatures) {
        self.features = features
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let features = SupportedFeatures(rawValue: decoder.decodeUInt32(data))
        
        let char = CharacteristicLocationNavigationFeature(features: features)
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

extension CharacteristicLocationNavigationFeature: Hashable {
    
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
    }
}

extension CharacteristicLocationNavigationFeature: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicLocationNavigationFeature, rhs: CharacteristicLocationNavigationFeature) -> Bool {
        return lhs.uuidString == rhs.uuidString
            && lhs.features == rhs.features
    }
}

public extension CharacteristicLocationNavigationFeature {
    
    /// Supported Features
    struct SupportedFeatures: OptionSet, Hashable {
        public let rawValue: UInt32
        public init(rawValue: UInt32) { self.rawValue = rawValue }
        
        /// Instantaneous Speed Supported
        public static let instantaneousSpeed                        = SupportedFeatures(rawValue: 1 << 0)
        /// Total Distance Supported
        public static let totalDistance                             = SupportedFeatures(rawValue: 1 << 1)
        /// Location Supported
        public static let location                                  = SupportedFeatures(rawValue: 1 << 2)
        /// Elevation Supported
        public static let elevation                                 = SupportedFeatures(rawValue: 1 << 3)
        /// Heading Supported
        public static let heading                                   = SupportedFeatures(rawValue: 1 << 4)
        /// Rolling Time Supported
        public static let rollingTime                               = SupportedFeatures(rawValue: 1 << 5)
        /// UTC Time Supported
        public static let utcTime                                   = SupportedFeatures(rawValue: 1 << 6)
        /// Remaining Distance Supported
        public static let remainingDistance                         = SupportedFeatures(rawValue: 1 << 7)
        /// Remaining Vertical Distance Supported
        public static let remainingVerticalDistance                 = SupportedFeatures(rawValue: 1 << 8)
        /// Estimated Time of Arrival Supported
        public static let estimatedTimeOfArrival                    = SupportedFeatures(rawValue: 1 << 9)
        /// Number of Beacons in Solution Supported
        public static let numberOfBeaconsInSolution                 = SupportedFeatures(rawValue: 1 << 10)
        /// Number of Beacons in View Supported
        public static let numberOfBeaconsInView                     = SupportedFeatures(rawValue: 1 << 11)
        /// Time to First Fix Supported
        public static let timeToFirstFix                            = SupportedFeatures(rawValue: 1 << 12)
        /// Estimated Horizontal Position Error Supported
        public static let estimatedHorizontalPositionError          = SupportedFeatures(rawValue: 1 << 13)
        /// Estimated Vertical Position Error Supported
        public static let estimatedVerticalPositionError            = SupportedFeatures(rawValue: 1 << 14)
        /// Horizontal Dilution of Precision Supported
        public static let horizontalDilutionOfPrecision             = SupportedFeatures(rawValue: 1 << 15)
        /// Vertical Dilution of Precision Supported
        public static let verticalDilutionOfPrecision               = SupportedFeatures(rawValue: 1 << 16)
        /// Location and Speed Characteristic Content Masking Supported
        public static let locationSpeedCharacteristicContentMasking = SupportedFeatures(rawValue: 1 << 17)
        /// Fix Rate Setting Supported
        public static let fixRateSetting                            = SupportedFeatures(rawValue: 1 << 18)
        /// Elevation Setting Supported
        public static let elevationSetting                          = SupportedFeatures(rawValue: 1 << 19)
        /// Position Status Supported
        public static let positionStatus                            = SupportedFeatures(rawValue: 1 << 20)
    }
    
}
