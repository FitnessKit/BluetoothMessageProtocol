//
//  CharacteristicCyclingSpeedCadence.swift
//  BluetoothMessageProtocol
//
//  Created by Joe Blau on 9/10/20.
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

/// BLE Cadence and Speed Characteristic
///
/// The CSC Measurement characteristic (CSC refers to Cycling Speed and Cadence) is a variable length structure containing a Flags field and, based on the contents of the Flags field, may contain one or more additional fields as shown in the tables below.
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicCyclingSpeedCadence: Characteristic {
    
    /// Characteristic Name
    public static var name: String { " Cycling Speed and Cadence" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A5B" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    public enum Flags: UInt8 {
        case wheelPresent = 0
        case crankPresent = 1
    }
    
    private(set) public var flags: Flags
    
    public enum Revolution: Equatable, Hashable {
        case crank(UInt16)
        case wheel(UInt32)
    }
        
    public struct PresentData: Equatable, Hashable {
        var revolution: Revolution
        var lastEventTime: UInt16
    }
    
    private(set) public var presentData: PresentData
    
    public init(flags: Flags,
                presentData: PresentData) {
        self.flags = flags
        self.presentData = presentData
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        guard let flags = Flags(rawValue: decoder.decodeUInt8(data)) else {
            return.failure(.properySize("Can not decode flag"))
        }
        let presentData: PresentData
        
        switch flags {
        case .wheelPresent:
            presentData = PresentData(revolution: .wheel(decoder.decodeUInt32(data)),
                                      lastEventTime: decoder.decodeUInt16(data))
        case .crankPresent:
            presentData = PresentData(revolution: .crank(decoder.decodeUInt16(data)),
                                      lastEventTime: decoder.decodeUInt16(data))
        default:
            return.failure(.invalidStringValue)
        }

        let char = CharacteristicCyclingSpeedCadence(flags: flags,
                                                     presentData: presentData)
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
        hasher.combine(presentData)
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
            && (lhs.presentData == rhs.presentData)
    }
}
