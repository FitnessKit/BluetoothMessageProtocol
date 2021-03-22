//
//  CharacteristicCyclingSpeedCadenceFeature.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 5/3/20.
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

/// BLE Cycling Speed and Cadence Feature Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicCyclingSpeedCadenceFeature: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Cycling Speed and Cadence Feature" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A5C" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Features
    private(set) public var features: Features
    
    /// Creates Cycling Speed and Cadence Feature Characteristic
    ///
    /// - Parameter features: Features
    public init(features: Features) {
        self.features = features
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let features = Features(rawValue: decoder.decodeUInt16(data))
        
        let char = CharacteristicCyclingSpeedCadenceFeature(features: features)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        msgData.append(Data(from: features.rawValue.littleEndian))
        
        return.success(msgData)
    }
    
}

public extension CharacteristicCyclingSpeedCadenceFeature {
    
    /// Features
    struct Features: OptionSet, Hashable {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }
        
        /// Wheel Revolution Data Supported
        public static let wheelRevolutionData       = Features(rawValue: 1 << 0)
        /// Crank Revolution Data Supported
        public static let crankRevolutionData       = Features(rawValue: 1 << 1)
        /// Multiple Sensor Locations Supported
        public static let multipleSensorLocations   = Features(rawValue: 1 << 2)
    }

}

extension CharacteristicCyclingSpeedCadenceFeature: Hashable {
    
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

extension CharacteristicCyclingSpeedCadenceFeature: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicCyclingSpeedCadenceFeature, rhs: CharacteristicCyclingSpeedCadenceFeature) -> Bool {
        return lhs.uuidString == rhs.uuidString
            && lhs.features == rhs.features
    }
}
