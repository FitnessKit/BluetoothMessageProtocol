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

/// Bluetooth Service Data AD Type base Class
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceData: Encodable {

    /// Name of the Service Data AD Type
    open internal(set) var name: String

    /// Service Data AD Type UUID String
    open internal(set) var uuidString: String

    /// Creates a Bluetooth Service Data AD Type
    ///
    /// - Parameter name: Service Name
    /// - Parameter uuidString: UUID String
    /// - Parameter payload: Service Data Payload
    public init(name: String, uuidString: String) {

        self.name = name
        self.uuidString = uuidString
    }

    /// Deocdes the Service Data AD Type Data
    ///
    /// - Parameter data: Data from Service Data AD Type
    /// - Returns: ServiceData Instance
    /// - Throws: BluetoothMessageProtocolError
    open class func decode(data: Data) throws -> Self {
        fatalError("*** You must override in your class.")
    }

    /// Encodes the Service Data AD Type into Data
    ///
    /// - Returns: Data representation of the Service Data AD Type
    /// - Throws: BluetoothMessageProtocolError
    open func encode() throws -> Data {
        fatalError("*** You must override in your class.")
    }

}

@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension ServiceData {

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    public var hashValue: Int {
        return "\(name)\(uuidString)".hashValue
    }
}

@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension ServiceData {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static public func == (lhs: ServiceData, rhs: ServiceData) -> Bool {
        return (lhs.name == rhs.name) &&
            (lhs.uuidString == rhs.uuidString)
    }
}
