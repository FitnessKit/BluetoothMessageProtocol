//
//  CharacteristicFiveZoneHeartRateLimits.swift
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

/// BLE Five Zone Heart Rate Limits Characteristic
///
/// The limits between the heart rate zones for the 5-zone heart rate definition
/// - Maximum
/// - Hard
/// - Moderate
/// - Light
/// - Very Light
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicFiveZoneHeartRateLimits: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Five Zone Heart Rate Limits" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A8B" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Very light / Light Limit
    private(set) public var lightHeartRate: Measurement<UnitCadence>
    
    /// Light / Moderate Limit
    private(set) public var moderateHeartRate: Measurement<UnitCadence>
    
    /// Moderate / Hard Limit
    private(set) public var hardHeartRate: Measurement<UnitCadence>
    
    /// Hard / Maximum Limit
    private(set) public var maximumHeartRate: Measurement<UnitCadence>
    
    /// Creates Five Zone Heart Rate Limits Characteristic
    ///
    /// - Parameters:
    ///   - lightHeartRate: Very light / Light Limit Heart Rate
    ///   - moderateHeartRate: Light / Moderate Limit Heart Rate
    ///   - hardHeartRate: Moderate / Hard Limit Heart Rate
    ///   - maximumHeartRate: Hard / Maximum Limit Heart Rate
    public init(lightHeartRate: UInt8, moderateHeartRate: UInt8, hardHeartRate: UInt8, maximumHeartRate: UInt8) {
        self.lightHeartRate = Measurement(value: Double(lightHeartRate), unit: UnitCadence.beatsPerMinute)
        self.moderateHeartRate = Measurement(value: Double(moderateHeartRate), unit: UnitCadence.beatsPerMinute)
        self.hardHeartRate = Measurement(value: Double(hardHeartRate), unit: UnitCadence.beatsPerMinute)
        self.maximumHeartRate = Measurement(value: Double(maximumHeartRate), unit: UnitCadence.beatsPerMinute)
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let lightHeartRate: UInt8 = decoder.decodeUInt8(data)
        let moderateHeartRate: UInt8 = decoder.decodeUInt8(data)
        let hardHeartRate: UInt8 = decoder.decodeUInt8(data)
        let maximumHeartRate: UInt8 = decoder.decodeUInt8(data)
        
        let char = CharacteristicFiveZoneHeartRateLimits(lightHeartRate: lightHeartRate,
                                                         moderateHeartRate: moderateHeartRate,
                                                         hardHeartRate: hardHeartRate,
                                                         maximumHeartRate: maximumHeartRate)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        msgData.append(Data(from: UInt8(lightHeartRate.value)))
        msgData.append(Data(from: UInt8(moderateHeartRate.value)))
        msgData.append(Data(from: UInt8(hardHeartRate.value)))
        msgData.append(Data(from: UInt8(maximumHeartRate.value)))
        
        return.success(msgData)
    }
}

extension CharacteristicFiveZoneHeartRateLimits: Hashable {
    
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
        hasher.combine(lightHeartRate)
        hasher.combine(moderateHeartRate)
        hasher.combine(hardHeartRate)
        hasher.combine(maximumHeartRate)
    }
}

extension CharacteristicFiveZoneHeartRateLimits: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicFiveZoneHeartRateLimits, rhs: CharacteristicFiveZoneHeartRateLimits) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.lightHeartRate == rhs.lightHeartRate)
            && (lhs.moderateHeartRate == rhs.moderateHeartRate)
            && (lhs.hardHeartRate == rhs.hardHeartRate)
            && (lhs.maximumHeartRate == rhs.maximumHeartRate)
    }
}
