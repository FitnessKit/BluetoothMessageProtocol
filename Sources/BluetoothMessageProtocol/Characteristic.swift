//
//  Characteristic.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/5/17.
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

/// A type that can convert itself into and out of an external representation.
///
/// `CharacteristicCodable` is a type alias for the `BluetoothEncodable` and `CharacteristicDecodable` protocols.
/// When you use `CharacteristicCodable` as a type or a generic constraint, it matches
/// any type that conforms to both protocols.
public typealias CharacteristicCodable = CharacteristicDecodable & BluetoothEncodable

/// Allows for Decoding Characteristics
public protocol CharacteristicDecodable: AnyObject {
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    static func decode(with data: Data) -> Result<Self, BluetoothDecodeError>
}

/// Bluetooth Characteristic
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public protocol Characteristic: CharacteristicCodable {
    
    /// Name of the Characteristic
    var name: String { get }
    
    /// Characteristic UUID String
    var uuidString: String { get }
}

//extension Characteristic {
//    /// Hashes the essential components of this value by feeding them into the
//    /// given hasher.
//    ///
//    /// Implement this method to conform to the `Hashable` protocol. The
//    /// components used for hashing must be the same as the components compared
//    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
//    /// with each of these components.
//    ///
//    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
//    ///   compile-time error in the future.
//    ///
//    /// - Parameter hasher: The hasher to use when combining the components
//    ///   of this instance.
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//        hasher.combine(uuidString)
//    }
//    
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Self, rhs: Self) -> Bool {
//        return (lhs.name == rhs.name) && (lhs.uuidString == rhs.uuidString)
//    }
//
//}
//
//@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
//extension Characteristic: Hashable {
//
//    /// Hashes the essential components of this value by feeding them into the
//    /// given hasher.
//    ///
//    /// Implement this method to conform to the `Hashable` protocol. The
//    /// components used for hashing must be the same as the components compared
//    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
//    /// with each of these components.
//    ///
//    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
//    ///   compile-time error in the future.
//    ///
//    /// - Parameter hasher: The hasher to use when combining the components
//    ///   of this instance.
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//        hasher.combine(uuidString)
//    }
//}
//
//@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
//extension Characteristic: Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Characteristic, rhs: Characteristic) -> Bool {
//        return (lhs.name == rhs.name) && (lhs.uuidString == rhs.uuidString)
//    }
//
//}
