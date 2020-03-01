//
//  ServiceData.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 2/24/18.
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
/// `ServiceDataCodable` is a type alias for the `BluetoothEncodable` and `ServiceDataDecodable` protocols.
/// When you use `ServiceDataCodable` as a type or a generic constraint, it matches
/// any type that conforms to both protocols.
public typealias ServiceDataCodable = ServiceDataDecodable & BluetoothEncodable


/// Allows for Decoding ServiceData
public protocol ServiceDataDecodable: AnyObject {
    
    /// Decodes Service Data AD Data into ServiceData
    ///
    /// - Parameter data: ServiceData Data
    /// - Returns: ServiceData Result
    static func decode(with data: Data) -> Result<Self, BluetoothDecodeError>
}

/// Bluetooth Characteristic
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public protocol ServiceData: Encodable, ServiceDataCodable {
    
    /// Name of the Service Data AD Type
    var name: String { get }
    
    /// Service Data AD Type UUID String
    var uuidString: String { get }
}

///// Bluetooth Service Data AD Type base Class
//@available(swift 4.0)
//@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
//open class ServiceData: Encodable, ServiceDataCodable {
//
//    /// Name of the Service Data AD Type
//    open internal(set) var name: String
//
//    /// Service Data AD Type UUID String
//    open internal(set) var uuidString: String
//
//    /// Creates a Bluetooth Service Data AD Type
//    ///
//    /// - Parameter name: Service Name
//    /// - Parameter uuidString: UUID String
//    /// - Parameter payload: Service Data Payload
//    public init(name: String, uuidString: String) {
//
//        self.name = name
//        self.uuidString = uuidString
//    }
//
//    /// Decodes Service Data AD Data into ServiceData
//    ///
//    /// - Parameter data: ServiceData Data
//    /// - Returns: ServiceData Result
//    open class func decode<S: ServiceData>(with data: Data) -> Result<S, BluetoothDecodeError> {
//        fatalError("*** You must override in your class.")
//    }
//
//    /// Encodes the Service Data AD Type into Data
//    ///
//    /// - Returns: Service Data AD Result
//    open func encode() -> Result<Data, BluetoothEncodeError> {
//        fatalError("*** You must override in your class.")
//    }
//
//}

//@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
//extension ServiceData: Hashable {
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
//extension ServiceData: Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: ServiceData, rhs: ServiceData) -> Bool {
//        return (lhs.name == rhs.name) && (lhs.uuidString == rhs.uuidString)
//    }
//}
