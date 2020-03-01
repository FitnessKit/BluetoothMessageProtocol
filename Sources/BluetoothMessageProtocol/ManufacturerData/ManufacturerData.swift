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

/// A type that can convert itself into and out of an external representation.
///
/// `ManufacturerDataCodable` is a type alias for the `BluetoothEncodable` and `ManufacturerDataDecodable` protocols.
/// When you use `ManufacturerDataCodable` as a type or a generic constraint, it matches
/// any type that conforms to both protocols.
public typealias ManufacturerDataCodable = ManufacturerDataDecodable & BluetoothEncodable

/// Allows for Decoding ManufacturerData
public protocol ManufacturerDataDecodable: AnyObject {
    
    /// Decodes Manufacturer Specific Data into ManufacturerData
    ///
    /// - Parameter data: ManufacturerData Data
    /// - Returns: ManufacturerData Result
    static func decode(with data: Data) -> Result<Self, BluetoothDecodeError>
}

/// Bluetooth Manufacturer Specific Data
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public protocol ManufacturerData: Encodable, Hashable, ManufacturerDataCodable {
    
    /// Manufacturer
    var manufacturer: CompanyIdentifier { get set }
    
    /// Data
    var specificData: Data? { get set }
}

internal struct ManufacturerSpecificData {
    /// Manufacturer
    var manufacturer: CompanyIdentifier
    
    /// Data
    var specificData: Data?

    /// Creates Manufacturer Data Object
    ///
    /// - Parameter rawData: Manufacturer Raw Data (everything after 0xFF)
    init(rawData: Data) {
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

}
