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

/// BLE Mesh Model Identifier Type
///
/// Models may contain either a SIG Model ID or a Vendor Model ID
public enum ModelIdentifierType: BluetoothEncodable {
    /// SIG Model Identifier
    case sig(UInt16)
    /// Vendor Model ID
    ///
    /// The Vendor Model ID is composed of two values: a 16-bit Bluetooth-assigned
    /// Company Identifier and a 16-bit vendor-assigned model identifier.
    case vendor(CompanyIdentifier, id: UInt16)

    /// Encodes into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        // Access Layer Endianness
        // All multiple-octet numeric values in this layer shall
        // be “little endian” as described in Section 3.1.1.2
        switch self {
        case .sig(let id):
            msgData.append(Data(from: id))

        case .vendor(let vendor, let id):
            msgData.append(Data(from: vendor.companyID))
            msgData.append(Data(from: id))
        }

        return.success(msgData)
    }
}

extension ModelIdentifierType {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension ModelIdentifierType: Encodable {

    /// CodingKeys
    public enum CodingKeys: CodingKey {
        case type
        case value
        case vendor
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
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .sig(let id):
            try container.encode(id, forKey: .value)
            // should we do the BLE SIG Vendor or some other value
            // here to show it is a SIG type??

        case .vendor(let vendor, let id):
            try container.encode(id, forKey: .value)
            try container.encode(vendor, forKey: .vendor)
        }

        //try container.encode(self.description, forKey: .type)
    }
}

/// BLE Mesh Model Identifier
///
/// All SIG Model IDs that are not defined by this specification
/// or other Bluetooth specifications are Reserved for Future Use (RFU)
@available(swift 4.0)
open class MeshModelIdentifier: Encodable {

    /// Model Id
    open internal(set) var modelId: ModelIdentifierType

    /// Model Name
    open internal(set) var name: String

    /// Creates Mesh Model Identifier
    ///
    /// - Parameters:
    ///   - modelId: Model Identifier
    ///   - name: Model Name
    public init(model modelId: ModelIdentifierType, name: String) {

        self.modelId = modelId
        self.name = name
    }
}

extension MeshModelIdentifier: Hashable {

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
        hasher.combine(modelId.description)
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
        return (lhs.name == rhs.name) && (lhs.modelId.description == rhs.modelId.description)
    }
}
