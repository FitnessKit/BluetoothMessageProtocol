//
//  ManufacturerData.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/6/17.
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

/// Bluetooth Manufacturer Specific Data
///
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ManufacturerData: Encodable {

    /// Manufacturer
    open internal(set) var manufacturer: CompanyIdentifier

    /// Data
    open internal(set) var specificData: Data?

    /// Creates Manufactur Data Object
    ///
    /// - Parameter rawData: Manufacturer Raw Data (everything after 0xFF
    public init(rawData: Data) {

        var decoder = DecodeData()

        let companyID = decoder.decodeUInt16(rawData)

        if let company = CompanyIdentifier.company(id: companyID) {
            self.manufacturer = company
        } else {
            //Create a CompanyIdentifer with the ID... set name to unknown.
            self.manufacturer = CompanyIdentifier(id: companyID, name: "Unknown")
        }

        let rest = rawData.count - MemoryLayout<UInt16>.size

        self.specificData = decoder.decodeData(rawData, length: rest)
    }

    /// Creates Manufactur Data Object
    ///
    /// - Parameter manufacturer: Manufacturer enum
    /// - Parameter specificData: Manufacturer Data
    public init(manufacturer: CompanyIdentifier, specificData: Data?) {

        self.manufacturer = manufacturer
        self.specificData = specificData
    }

    /// Deocdes the Manufacturer Specific Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: ManufacturerData Instance
    /// - Throws: BluetoothDecodeError
    open class func decode(data: Data) throws -> ManufacturerData {
        fatalError("*** You must override in your class.")
    }

    /// Encodes the ManufacturerData into Data
    ///
    /// - Returns: Data representation of the ManufacturerData
    /// - Throws: BluetoothEncodeError
    open func encode() throws -> Data {
        fatalError("*** You must override in your class.")
    }

}

@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
extension ManufacturerData: Hashable {

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
        hasher.combine(manufacturer)
    }
}

@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
extension ManufacturerData: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ManufacturerData, rhs: ManufacturerData) -> Bool {
        return (lhs.manufacturer == rhs.manufacturer)
    }
    
}
