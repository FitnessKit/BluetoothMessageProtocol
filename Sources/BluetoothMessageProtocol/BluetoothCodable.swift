//
//  BluetoothCodable.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 4/27/19.
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

/// A type that can convert itself into and out of an external representation.
///
/// `ServiceDataCodable` is a type alias for the `BluetoothEncodable` and `ServiceDataDecodable` protocols.
/// When you use `ServiceDataCodable` as a type or a generic constraint, it matches
/// any type that conforms to both protocols.
public typealias ServiceDataCodable = ServiceDataDecodable & BluetoothEncodable

/// A type that can convert itself into and out of an external representation.
///
/// `ManufacturerDataCodable` is a type alias for the `BluetoothEncodable` and `ManufacturerDataDecodable` protocols.
/// When you use `ManufacturerDataCodable` as a type or a generic constraint, it matches
/// any type that conforms to both protocols.
public typealias ManufacturerDataCodable = ManufacturerDataDecodable & BluetoothEncodable

/// Allows for Encoding of Objects into Data
public protocol BluetoothEncodable {
    
    /// Encodes Object into Data
    ///
    /// - Returns: Encoded Data Result
    func encode() -> Result<Data, BluetoothEncodeError>
}

/// Allows for Decoding Characteristics
public protocol CharacteristicDecodable: AnyObject {
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    static func decoder<C: Characteristic>(data: Data) -> Result<C, BluetoothDecodeError>
}

/// Allows for Decoding ServiceData
public protocol ServiceDataDecodable: AnyObject {
    
    /// Decodes Service Data AD Data into ServiceData
    ///
    /// - Parameter data: ServiceData Data
    /// - Returns: ServiceData Result
    static func decode<S: ServiceData>(with: Data) -> Result<S, BluetoothDecodeError>
}

/// Allows for Decoding ManufacturerData
public protocol ManufacturerDataDecodable: AnyObject {
    
    /// Decodes Manufacturer Specific Data into ManufacturerData
    ///
    /// - Parameter data: ManufacturerData Data
    /// - Returns: ManufacturerData Result
    static func decode<M: ManufacturerData>(with data: Data) -> Result<M, BluetoothDecodeError>
}
