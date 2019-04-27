//
//  Service.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/2/17.
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

/// Bluetooth Service base Class
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class Service {

    /// Name of the Service
    open internal(set) var name: String

    /// Service UUID String
    open internal(set) var uuidString: String

    /// Uniform Type Identifier
    open private(set) var uniformIdentifier: String

    /// Creates a Bluetooth Service
    ///
    /// - Parameter name: Service Name
    /// - Parameter uuidString: UUID String
    /// - Parameter uniformIdentifier: Uniform Type Information
    public init(name: String, uuidString: String, uniformIdentifier: String) {

        self.name = name
        self.uuidString = uuidString
        self.uniformIdentifier = uniformIdentifier
    }
}

extension Service: Encodable {

    enum CodeKeys: CodingKey {
        case name
        case uuidString
        case uniformIdentifier
    }

    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodeKeys.self)

        try container.encode(self.name, forKey: .name)
        try container.encode(self.uuidString, forKey: .uuidString)
        try container.encode(self.uniformIdentifier, forKey: .uniformIdentifier)
    }
}

@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
extension Service: Hashable {

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
        hasher.combine(name)
        hasher.combine(uuidString)
        hasher.combine(uniformIdentifier)
    }
}

@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
extension Service: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Service, rhs: Service) -> Bool {
        return (lhs.name == rhs.name) &&
            (lhs.uuidString == rhs.uuidString) &&
            (lhs.uniformIdentifier == rhs.uniformIdentifier)
    }

}
