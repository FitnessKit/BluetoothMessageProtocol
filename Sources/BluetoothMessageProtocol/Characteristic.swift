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

/// Bluetooth Characteristic base Class
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class Characteristic {

    /// Name of the Characteristic
    open internal(set) var name: String

    /// Characteristic UUID String
    open internal(set) var uuidString: String

    /// Init Characteristic
    ///
    /// - Parameters:
    ///   - name: Name of Characteristic
    ///   - uuidString: UUID String for Characteristic
    public init(name: String, uuidString: String) {

        self.name = name
        self.uuidString = uuidString
    }

//    /// Validates the BLE Data
//    ///
//    /// - Parameter data: Data from sensor
//    /// - Returns: Bool value based on validation
//    /// - Throws: BluetoothMessageProtocolError
//    open class func validate(data: Data) throws -> Bool {
//        fatalError("*** You must override in your class.")
//    }

    /// Deocdes the Characteristic Data
    ///
    /// - Parameter data: Data from sensor characteristic
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open class func decode(data: Data) throws -> Self {
        fatalError("*** You must override in your class.")
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open func encode() throws -> Data {
        fatalError("*** You must override in your class.")
    }
}

@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension Characteristic {

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    public var hashValue: Int {
        return "\(name)\(uuidString)".hashValue
    }
}

@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension Characteristic {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static public func == (lhs: Characteristic, rhs: Characteristic) -> Bool {
        return (lhs.name == rhs.name) && (lhs.uuidString == rhs.uuidString)
    }
    
}
