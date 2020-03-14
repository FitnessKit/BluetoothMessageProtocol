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
final public class CharacteristicTrainingStatus: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Training Status" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2AD3" }
    
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
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
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
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let flags = Flags(rawValue: decoder.decodeUInt8(data))
        
        if flags.rawValue > 3 {
            return.failure(BluetoothDecodeError.general("Training Status Flags don't match spec.")) 
        }
        
        let status = TrainingStatus(rawValue: decoder.decodeUInt8(data)) ?? .other
        
        var statusString: String?
        if flags.contains([.trainingStatusStringPresent]) {
            let stringData = Data(data[2..<data.count])
            statusString = stringData.safeStringValue
        }
        
        let char = CharacteristicTrainingStatus(status: status,
                                                statusString: statusString)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
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
        
        return.success(msgData)
    }
}

extension CharacteristicTrainingStatus: Hashable {
    
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
        hasher.combine(status)
        hasher.combine(statusString)
    }
}

extension CharacteristicTrainingStatus: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicTrainingStatus, rhs: CharacteristicTrainingStatus) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.status == rhs.status)
            && (lhs.statusString == rhs.statusString)
    }
}

private extension CharacteristicTrainingStatus {
    
    /// Flags
    struct Flags: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        /// Training Status String present
        public static let trainingStatusStringPresent    = Flags(rawValue: 1 << 0)
        /// Extended String present
        public static let extendedStringPresent          = Flags(rawValue: 1 << 1)
    }
}
