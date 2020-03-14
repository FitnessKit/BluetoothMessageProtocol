//
//  CharacteristicFitnessMachineFeature.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 2/24/18.
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

/// BLE Fitness Machine Features Characteristic
///
/// The Fitness Machine Feature characteristic exposes which optional features are
/// supported by the Server implementation
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicFitnessMachineFeature: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Fitness Machine Feature" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2ACC" }
    
    /// Supported Machine Features
    public struct MachineFeatures: OptionSet, Hashable {
        public let rawValue: UInt32
        public init(rawValue: UInt32) { self.rawValue = rawValue }
        
        /// Average Speed Supported
        public static let averageSpeedSupported     = MachineFeatures(rawValue: 1 << 0)
        /// Cadence Supported
        public static let cadenceSupported          = MachineFeatures(rawValue: 1 << 1)
        /// Total Distance Supported
        public static let totalDistanceSupported    = MachineFeatures(rawValue: 1 << 2)
        /// Inclination Supported
        public static let inclinationSupported      = MachineFeatures(rawValue: 1 << 3)
        /// Elevation Gain Supported
        public static let elevationGainSupported    = MachineFeatures(rawValue: 1 << 4)
        /// Pace Supported
        public static let paceSupported             = MachineFeatures(rawValue: 1 << 5)
        /// Step Count Supported
        public static let stepCountSupported        = MachineFeatures(rawValue: 1 << 6)
        /// Resistance Level Supported
        public static let resistanceLevelSupported  = MachineFeatures(rawValue: 1 << 7)
        /// Stride Count Supported
        public static let strideCountSupported      = MachineFeatures(rawValue: 1 << 8)
        /// Expended Energy Supported
        public static let expendedEnergySupported   = MachineFeatures(rawValue: 1 << 9)
        /// Heart Rate Measurement Supported
        public static let heartRateSupported        = MachineFeatures(rawValue: 1 << 10)
        /// Metabolic Equivalent Supported
        public static let metsSupported             = MachineFeatures(rawValue: 1 << 11)
        /// Elapsed Time Supported
        public static let elapsedTimeSupported      = MachineFeatures(rawValue: 1 << 12)
        /// Remaining Time Supported
        public static let remainingTimeSupported    = MachineFeatures(rawValue: 1 << 13)
        /// Power Measurement Supported
        public static let powerSupported            = MachineFeatures(rawValue: 1 << 14)
        /// Force on Belt and Power Output Supported
        public static let forceOnBeltSupported      = MachineFeatures(rawValue: 1 << 15)
        /// User Data Retention Supported
        public static let userDataSupported         = MachineFeatures(rawValue: 1 << 16)
    }
    
    /// Target Settings Features
    public struct TargetFeatures: OptionSet, Hashable {
        public let rawValue: UInt32
        public init(rawValue: UInt32) { self.rawValue = rawValue }
        
        /// Speed Target Setting Supported
        public static let speedSupported                = TargetFeatures(rawValue: 1 << 0)
        /// Inclination Target Setting Supported
        public static let inclinationSupported          = TargetFeatures(rawValue: 1 << 1)
        /// Resistance Target Setting Supported
        public static let resistanceSupported           = TargetFeatures(rawValue: 1 << 2)
        /// Power Target Setting Supported
        public static let powerSupported                = TargetFeatures(rawValue: 1 << 3)
        /// Heart Rate Target Setting Supported
        public static let heartRateSupported            = TargetFeatures(rawValue: 1 << 4)
        /// Targeted Expended Energy Configuration Supported
        public static let expendedEnergySupported       = TargetFeatures(rawValue: 1 << 4)
        /// Targeted Step Number Configuration Supported
        public static let stepNumberSupported           = TargetFeatures(rawValue: 1 << 4)
        /// Targeted Stride Number Configuration Supported
        public static let strideNumberSupported         = TargetFeatures(rawValue: 1 << 4)
        /// Targeted Distance Configuration Supported
        public static let distanceSupported             = TargetFeatures(rawValue: 1 << 4)
        /// Targeted Training Time Configuration Supported
        public static let trainingTimeSupported         = TargetFeatures(rawValue: 1 << 4)
        /// Targeted Time in Two Heart Rate Zones Configuration Supported
        public static let timeInTwoHRZoneSupported      = TargetFeatures(rawValue: 1 << 4)
        /// Targeted Time in Three Heart Rate Zones Configuration Supported
        public static let timeInThreeHRZoneSupported    = TargetFeatures(rawValue: 1 << 4)
        /// Targeted Time in Fie Heart Rate Zones Configuration Supported
        public static let timeInFiveHRZoneSupported     = TargetFeatures(rawValue: 1 << 4)
        /// Indoor Bike Simulation Parameters Supported
        public static let indoorBikeSimulationSupported = TargetFeatures(rawValue: 1 << 4)
        /// Wheel Circumference Configuration Supported
        public static let wheelCircumferenceSupported   = TargetFeatures(rawValue: 1 << 4)
        /// Spin Down Control Supported
        public static let spinDownControlSupported      = TargetFeatures(rawValue: 1 << 4)
        /// Targeted Cadence Configuration Supported
        public static let cadenceConfigSupported        = TargetFeatures(rawValue: 1 << 4)
    }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Supported Machine Features
    private(set) public var supportedMachineFeatures: MachineFeatures
    
    /// Supported Target Settings Features
    private(set) public var supportedTargetSettings: TargetFeatures
    
    /// Creates Fitness Machine Feature Characteristic
    ///
    /// - Parameters:
    ///   - supportedMachineFeatures: Supported Machine Features
    ///   - supportedTargetSettings: Supported Target Settings Features
    public init(supportedMachineFeatures: MachineFeatures, supportedTargetSettings: TargetFeatures) {
        self.supportedMachineFeatures = supportedMachineFeatures
        self.supportedTargetSettings = supportedTargetSettings
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let features = MachineFeatures(rawValue: decoder.decodeUInt32(data))
        let targets = TargetFeatures(rawValue: decoder.decodeUInt32(data))
        
        let char = CharacteristicFitnessMachineFeature(supportedMachineFeatures: features,
                                                       supportedTargetSettings: targets)
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

extension CharacteristicFitnessMachineFeature: Hashable {
    
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
        hasher.combine(supportedMachineFeatures)
        hasher.combine(supportedTargetSettings)
    }
}

extension CharacteristicFitnessMachineFeature: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicFitnessMachineFeature, rhs: CharacteristicFitnessMachineFeature) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.supportedMachineFeatures == rhs.supportedMachineFeatures)
            && (lhs.supportedTargetSettings == rhs.supportedTargetSettings)
    }
}
