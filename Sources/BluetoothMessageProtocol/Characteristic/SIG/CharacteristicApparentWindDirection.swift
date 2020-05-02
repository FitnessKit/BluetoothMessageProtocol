//
//  CharacteristicApparentWindDirection.swift
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

/// BLE Apparent Wind Direction Characteristic
///
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicApparentWindDirection: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Apparent Wind Direction" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A73" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Wind Direction
    ///
    /// The apparent wind is the wind experienced by an observer in motion and is
    /// the relative velocity of the wind in relation to the observer.
    ///
    /// For example, an apparent wind coming from a direction that is 45 degrees
    /// clockwise relative to the heading of the observer is given as 45 degrees;
    /// one that is from a direction 45 degrees anti-clockwise relative to the
    /// heading of the observer is given as 315 degrees.
    ///
    private(set) public var windDirection: Measurement<UnitAngle>
    
    /// Creates Apparent Wind Direction Characteristic
    ///
    /// - Parameter windDirection: Angle of Wind Direction
    public init(windDirection: Measurement<UnitAngle>) {
        self.windDirection = windDirection
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let direction = decoder.decodeUInt16(data).resolution(.removing, resolution: .oneHundredth)
        
        let wind = Measurement(value: direction, unit: UnitAngle.degrees)
        
        let char = CharacteristicApparentWindDirection(windDirection: wind)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        //Make sure we put this back to deg before we create Data
        let direction = windDirection.converted(to: UnitAngle.degrees).value.resolution(.adding, resolution: .oneHundredth)
        
        msgData.append(Data(from: UInt16(direction).littleEndian))
        
        return.success(msgData)
    }
}

extension CharacteristicApparentWindDirection: Hashable {
    
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
        hasher.combine(windDirection)
    }
}

extension CharacteristicApparentWindDirection: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicApparentWindDirection, rhs: CharacteristicApparentWindDirection) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.windDirection == rhs.windDirection)
    }
}
