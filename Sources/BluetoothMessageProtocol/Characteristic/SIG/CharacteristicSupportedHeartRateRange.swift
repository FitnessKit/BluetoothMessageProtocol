//
//  CharacteristicSupportedHeartRateRange.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/20/17.
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

/// BLE Supported Heart Rate Range Characteristic
///
/// The Supported Heart Rate Range characteristic is used to send the supported
/// Heart Rate range as well as the minimum Heart Rate increment supported by the Server
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicSupportedHeartRateRange: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Supported Heart Rate Range" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2AD7" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Minimum Heart Rate
    private(set) public var minimum: Measurement<UnitCadence>
    
    /// Maximum Heart Rate
    private(set) public var maximum: Measurement<UnitCadence>
    
    /// Minimum Increment
    private(set) public var minimumIncrement: Measurement<UnitCadence>
    
    /// Creates Supported Heart Rate Range Characteristic
    ///
    /// - Parameters:
    ///   - minimum: Minimum Heart Rate
    ///   - maximum: Maximum Heart Rate
    ///   - minimumIncrement: Minimum Increment
    public init(minimum: UInt8, maximum: UInt8, minimumIncrement: UInt8) {
        self.minimum = Measurement(value: Double(minimum),
                                   unit: UnitCadence.beatsPerMinute)
        
        self.maximum = Measurement(value: Double(maximum),
                                   unit: UnitCadence.beatsPerMinute)
        
        self.minimumIncrement = Measurement(value: Double(minimumIncrement), unit: UnitCadence.beatsPerMinute)
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let minimum = decoder.decodeUInt8(data)
        let maximum = decoder.decodeUInt8(data)
        let minimumIncrement = decoder.decodeUInt8(data)
        
        let char = CharacteristicSupportedHeartRateRange(minimum: minimum,
                                                         maximum: maximum,
                                                         minimumIncrement: minimumIncrement)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        msgData.append(Data(from: UInt8(minimum.value)))
        msgData.append(Data(from: UInt8(maximum.value)))
        msgData.append(Data(from: UInt8(minimumIncrement.value)))
        
        return.success(msgData)
    }
}

extension CharacteristicSupportedHeartRateRange: Hashable {
    
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
        hasher.combine(minimum)
        hasher.combine(maximum)
        hasher.combine(minimumIncrement)
    }
}

extension CharacteristicSupportedHeartRateRange: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicSupportedHeartRateRange, rhs: CharacteristicSupportedHeartRateRange) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.minimum == rhs.minimum)
            && (lhs.maximum == rhs.maximum)
            && (lhs.minimumIncrement == rhs.minimumIncrement)
    }
}
