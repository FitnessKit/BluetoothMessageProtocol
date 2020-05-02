//
//  CharacteristicTrueWindDirection.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/26/17.
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

/// BLE True Wind Direction Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicTrueWindDirection: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "True Wind Direction" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A71" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// True Wind Direction
    ///
    /// Wind direction is reported by the direction from which it originates and is
    /// an angle measured clockwise relative to Geographic North. For example, a wind
    /// coming from the north is given as 0 degrees, a wind coming from the south is
    /// given as 180 degrees, a wind coming from the east is given as 90 degrees and
    /// a wind coming from the west is given as 270 degrees
    private(set) public var windDirection: Measurement<UnitAngle>
    
    /// Creates True Wind Direction Characteristic
    ///
    /// - Parameter windDirection: True Wind Direction
    public init(windDirection: Measurement<UnitAngle>) {
        self.windDirection = windDirection
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let value = decoder.decodeUInt16(data).resolution(.removing, resolution: .oneHundredth)
        let direction = Measurement(value: value, unit: UnitAngle.degrees)
        
        let char = CharacteristicTrueWindDirection(windDirection: direction)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        let value = windDirection.converted(to: UnitAngle.degrees).value.resolution(.adding, resolution: .oneHundredth)
        
        msgData.append(Data(from: UInt16(value).littleEndian))
        
        return.success(msgData)
    }
}

extension CharacteristicTrueWindDirection: Hashable {
    
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

extension CharacteristicTrueWindDirection: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicTrueWindDirection, rhs: CharacteristicTrueWindDirection) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.windDirection == rhs.windDirection)
    }
}
