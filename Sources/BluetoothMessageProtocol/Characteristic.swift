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

/// A type that can convert itself into and out of an external representation.
///
/// `CharacteristicCodable` is a type alias for the `BluetoothEncodable` and `CharacteristicDecodable` protocols.
/// When you use `CharacteristicCodable` as a type or a generic constraint, it matches
/// any type that conforms to both protocols.
public typealias CharacteristicCodable = CharacteristicDecodable & BluetoothEncodable

/// Allows for Decoding Characteristics
public protocol CharacteristicDecodable: AnyObject {
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    static func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError>
}

/// Bluetooth Characteristic
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public protocol Characteristic: CharacteristicCodable {
    
    /// Name of the Characteristic
    var name: String { get }
    
    /// Characteristic UUID String
    var uuidString: String { get }
}
