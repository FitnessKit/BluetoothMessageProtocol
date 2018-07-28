//
//  MeshModelIdentifier.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/28/18.
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


/// BLE Mesh Model Identifier
///
/// All SIG Model IDs that are not defined by this specification
/// or other Bluetooth specifications are Reserved for Future Use (RFU)
@available(swift 4.0)
open class MeshModelIdentifier: Encodable {

    /// Model Id
    open internal(set) var modelId: UInt16

    /// Model Name
    open internal(set) var name: String

    /// Creates Mesh Model Identifier
    ///
    /// - Parameters:
    ///   - modelId: Model Identifier
    ///   - name: Model Name
    public init(model modelId: UInt16, name: String) {

        self.modelId = modelId
        self.name = name
    }
}

extension MeshModelIdentifier: Hashable {

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    public var hashValue: Int {
        return "\(name)\(modelId)".hashValue
    }
}

extension MeshModelIdentifier: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static public func == (lhs: MeshModelIdentifier, rhs: MeshModelIdentifier) -> Bool {
        return (lhs.name == rhs.name) && (lhs.modelId == rhs.modelId)
    }
}
