//
//  CharacteristicMagneticDeclination.swift
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

/// BLE Magnetic Declination Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicMagneticDeclination: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Magnetic Declination" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A2C" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Magnetic Declination
    ///
    /// The magnetic declination is the angle on the horizontal plane between the
    /// direction of True North (geographic) and the direction of Magnetic North,
    /// measured clockwise from True North to Magnetic North
    private(set) public var declination: Measurement<UnitAngle>
    
    /// Creates Magnetic Declination
    ///
    /// - Parameter declination: Magnetic Declination
    public init(declination: Measurement<UnitAngle>) {
        self.declination = declination
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let value = decoder.decodeUInt16(data).resolution(.removing, resolution: .oneHundredth)
        
        let dec = Measurement(value: value, unit: UnitAngle.degrees)
        
        let char = CharacteristicMagneticDeclination(declination: dec)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        //Make sure we put this back to Degress before we create Data
        let value = declination.converted(to: UnitAngle.degrees).value
        
        guard kBluetoothMagneticDeclinationBounds.contains(value) else {
            return.failure(BluetoothEncodeError.boundsError(title: "Magnetic Declination must be between",
                                                            msg: "degress",
                                                            range: kBluetoothMagneticDeclinationBounds))
        }
        
        //put it back to uint16
        let dec = UInt16(value.resolution(.adding, resolution: .oneTenth))
        
        msgData.append(Data(from: dec.littleEndian))
        
        return.success(msgData)
    }
}

extension CharacteristicMagneticDeclination: Hashable {
    
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
        hasher.combine(declination)
    }
}

extension CharacteristicMagneticDeclination: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicMagneticDeclination, rhs: CharacteristicMagneticDeclination) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.declination == rhs.declination)
    }
}
