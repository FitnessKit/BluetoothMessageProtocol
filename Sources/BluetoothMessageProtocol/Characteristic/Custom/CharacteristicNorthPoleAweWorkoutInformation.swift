//
//  CharacteristicNorthPoleAweWorkoutInformation.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 12/21/17.
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

/// BLE AWE Workout Information Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicNorthPoleAweWorkoutInformation: Characteristic {
    
    private static let commandRange = ClosedRange(uncheckedBounds: (lower: 1, upper: 254))
    
    /// Characteristic Name
    public static var name: String { "AWE Workout Information" }
    
    /// Characteristic UUID
    public static var uuidString: String { "4B486402-6E6F-7274-6870-6F6C65656E67" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Points Earned
    private(set) public var points: UInt16?
    
    /// Energy Expanded
    private(set) public var energyExpended: Measurement<UnitEnergy>?
    
    /// Command
    ///
    /// Values of 0 and 255 are Invalid
    private(set) public var command: UInt8?
    
    /// Creates Workout Information Characteristic
    ///
    /// - Parameters:
    ///   - points: Points Earned
    ///   - energyExpended: Energy Expended
    ///   - command: Command
    public init(points: UInt16?, energyExpended: Measurement<UnitEnergy>?, command: UInt8?) {
        
        self.points = points
        self.energyExpended = energyExpended
        
        if let command = command {
            if CharacteristicNorthPoleAweWorkoutInformation.commandRange.contains(Int(command)) {
                self.command = command
            }
        } else {
            self.command = nil
        }
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let flags = Flags(decoder.decodeUInt8(data))
        
        var points: UInt16? = nil
        
        if flags.isPointsPresent {
            points = decoder.decodeUInt16(data)
        }
        
        var energy: Measurement<UnitEnergy>? = nil
        
        if flags.isEnergyExpendedPresent {
            let expended = decoder.decodeUInt16(data)
            energy = Measurement(value: Double(expended), unit: UnitEnergy.kilojoules)
        }
        
        var command: UInt8? = nil
        if flags.isCommandPresent {
            let value = decoder.decodeUInt8(data)
            if CharacteristicNorthPoleAweWorkoutInformation.commandRange.contains(Int(value)) {
                command = value
            }
        }
        
        let char = CharacteristicNorthPoleAweWorkoutInformation(points: points,
                                                                energyExpended: energy,
                                                                command: command)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        /// not writeable
        return.failure(BluetoothEncodeError.notSupported)
    }
}

extension CharacteristicNorthPoleAweWorkoutInformation: Hashable {
    
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
        hasher.combine(points)
        hasher.combine(energyExpended)
        hasher.combine(command)
    }
}

extension CharacteristicNorthPoleAweWorkoutInformation: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicNorthPoleAweWorkoutInformation, rhs: CharacteristicNorthPoleAweWorkoutInformation) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.points == rhs.points)
            && (lhs.energyExpended == rhs.energyExpended)
            && (lhs.command == rhs.command)
    }
}

private extension CharacteristicNorthPoleAweWorkoutInformation {
    
    struct Flags {
        /// Points Present
        private(set) public var isPointsPresent: Bool
        /// Energy Expended (Calories) Present
        private(set) public var isEnergyExpendedPresent: Bool
        /// Command Present
        private(set) public var isCommandPresent: Bool
        
        /// Rawvalue
        public var rawValue: UInt8 {
            var value: UInt8 = UInt8(isPointsPresent ? 1 : 0)
            
            value |= UInt8(isEnergyExpendedPresent ? 1 : 0) << 1
            value |= UInt8(isCommandPresent ? 1 : 0) << 2
            
            return UInt8(value)
        }
        
        /// Creates Flags Struct
        ///
        /// - Parameter value: UInt8 Flag Data
        public init(_ value: UInt8) {
            self.isPointsPresent = (value & 0x01 == 0x01)
            self.isEnergyExpendedPresent = (value & 0x02 == 0x02)
            self.isCommandPresent = (value & 0x04 == 0x04)
        }
        
        /// Creates Flags Structs
        ///
        /// - Parameters:
        ///   - isPointsPresent: Points Present
        ///   - isEnergyExpendedPresent: Energy Expended Present
        public init(isPointsPresent: Bool, isEnergyExpendedPresent: Bool, isCommandPresent: Bool) {
            self.isPointsPresent = isPointsPresent
            self.isEnergyExpendedPresent = isEnergyExpendedPresent
            self.isCommandPresent = isCommandPresent
        }
    }
    
}
