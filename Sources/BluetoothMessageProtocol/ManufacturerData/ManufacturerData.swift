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
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ManufacturerData {

    /// Manufacturer
    open internal(set) var manufacturer: CompanyIdentifier

    /// Data
    open internal(set) var specificData: Data?

    /// Creates Manufactur Data Object
    ///
    /// - Parameter rawData: Manufacturer Raw Data (everything after 0xFF
    public init(rawData: Data) {

        var decoder = DataDecoder(rawData)

        if let company = CompanyIdentifier.company(id: decoder.decodeUInt16()) {
            self.manufacturer = company
        } else {
            //Create a CompanyIdentifer with the ID... set name to unknown.
            self.manufacturer = CompanyIdentifier(id: decoder.decodeUInt16(), name: "Unknown")
        }

        let rest = rawData.count - MemoryLayout<UInt16>.size

        self.specificData = decoder.decodeData(length: rest)
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
    /// - Throws: BluetoothMessageProtocolError
    open class func decode(data: Data) throws -> Self {
        fatalError("*** You must override in your class.")
    }

    /// Encodes the ManufacturerData into Data
    ///
    /// - Returns: Data representation of the ManufacturerData
    /// - Throws: BluetoothMessageProtocolError
    open func encode() throws -> Data {
        fatalError("*** You must override in your class.")
    }

}

@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension ManufacturerData {

    public var hashValue: Int {
        get {
            return manufacturer.hashValue
        }
    }
}

@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension ManufacturerData {

    static public func == (lhs: ManufacturerData, rhs: ManufacturerData) -> Bool {
        return (lhs.manufacturer == rhs.manufacturer)
    }
    
}
