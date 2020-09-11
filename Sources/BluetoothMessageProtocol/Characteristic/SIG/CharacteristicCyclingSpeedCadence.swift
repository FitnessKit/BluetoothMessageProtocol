//
//  File.swift
//  
//
//  Created by Joe Blau on 9/10/20.
//

import Foundation
import DataDecoder
import FitnessUnits

/// BLE Alert Level Characteristic
///
/// The CSC Measurement characteristic (CSC refers to Cycling Speed and Cadence) is a variable length structure containing a Flags field and, based on the contents of the Flags field, may contain one or more additional fields as shown in the tables below.
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicCyclingSpeedCadence: Characteristic {
    
    /// Characteristic Name
    public static var name: String { " Cycling Speed and Cadence" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A5B" }
    
    
    public struct Flags: OptionSet, Hashable {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        /// Ringer State active
        public static let wheelRevolutionDataPresent = Flags(rawValue: 1 << 0)
        /// Vibrate State active
        public static let crankRevolutionDataPresent = Flags(rawValue: 1 << 1)

    }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    private(set) public var flags: Flags

    private(set) public var cumulativeWheelRevoluations: UInt32
    private(set) public var lastWheelEventTime: UInt16
    private(set) public var cumulativeCrankRevolutions: UInt16
    private(set) public var lastCrankEventTime: UInt16
        
    public init(flags: Flags,
                cumulativeWheelRevoluations: UInt32,
                lastWheelEventTime: UInt16,
                cumulativeCrankRevolutions: UInt16,
                lastCrankEventTime: UInt16){
        self.flags = flags
        self.cumulativeWheelRevoluations = cumulativeWheelRevoluations
        self.lastWheelEventTime = lastWheelEventTime
        self.cumulativeCrankRevolutions = cumulativeCrankRevolutions
        self.lastCrankEventTime = lastCrankEventTime
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let flags: Flags = Flags(rawValue: decoder.decodeUInt8(data))
        var cumulativeWheelRevoluations: UInt32 = 0
        var lastWheelEventTime: UInt16 = 0
        var cumulativeCrankRevolutions: UInt16 = 0
        var lastCrankEventTime: UInt16 = 0
        
        if flags == .wheelRevolutionDataPresent {
            cumulativeWheelRevoluations = decoder.decodeUInt32(data)
            lastWheelEventTime = decoder.decodeUInt16(data)
        }
        if flags == .crankRevolutionDataPresent {
            cumulativeCrankRevolutions = decoder.decodeUInt16(data)
            lastCrankEventTime = decoder.decodeUInt16(data)
        }
        
        let char = CharacteristicCyclingSpeedCadence(flags: flags,
                                                     cumulativeWheelRevoluations: cumulativeWheelRevoluations,
                                                     lastWheelEventTime: lastWheelEventTime,
                                                     cumulativeCrankRevolutions: cumulativeCrankRevolutions,
                                                     lastCrankEventTime: lastCrankEventTime)
        
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

extension CharacteristicCyclingSpeedCadence: Hashable {
    
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
        hasher.combine(flags)
        hasher.combine(cumulativeWheelRevoluations)
        hasher.combine(lastWheelEventTime)
        hasher.combine(cumulativeCrankRevolutions)
        hasher.combine(lastCrankEventTime)
    }
}

extension CharacteristicCyclingSpeedCadence: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicCyclingSpeedCadence, rhs: CharacteristicCyclingSpeedCadence) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.flags == rhs.flags)
            && (lhs.cumulativeWheelRevoluations == rhs.cumulativeWheelRevoluations)
            && (lhs.lastWheelEventTime == rhs.lastWheelEventTime)
            && (lhs.cumulativeCrankRevolutions == rhs.cumulativeCrankRevolutions)
            && (lhs.lastCrankEventTime == rhs.lastCrankEventTime)
    }
}
