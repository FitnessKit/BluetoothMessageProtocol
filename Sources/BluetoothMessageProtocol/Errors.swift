//
//  Errors.swift
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

/// Errors for Encoding
public enum BluetoothEncodeError {
    /// Encoding Not Supported
    case notSupported
    /// Property Size Issue
    case properySize(String)
    /// Property Bounds Issue
    case properyBounds(String)
    /// Missing Property
    case missingProperties(String)

    /// General Error
    case general(String)
}

extension BluetoothEncodeError {
    
    public var description: String {
        return String(describing: self)
    }
}

extension BluetoothEncodeError: LocalizedError {

    /// A localized message describing what error occurred.
    public var errorDescription: String? {
        switch self {
        case .notSupported:
            return "Encoding Not Supported"
        case .properySize(let msg):
            return msg
        case .properyBounds(let msg):
            return msg
        case .missingProperties(let msg):
            return msg
        case .general(let msg):
            return msg
        }
    }
}

@available(swift 4.0)
extension BluetoothEncodeError: Encodable {
    
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
        var container = encoder.container(keyedBy: StringKey.self)
        
        let errkey = StringKey(stringValue: "message")!
        let typeKey = StringKey(stringValue: "error")!
        
        try container.encode("BluetoothEncodeError", forKey: StringKey(stringValue: "type")!)

        switch self {
        case .notSupported:
            try container.encode(self.description, forKey: typeKey)
            try container.encode(self.localizedDescription, forKey: errkey)

        case .properySize(_):
            try container.encode("properySize", forKey: typeKey)
            try container.encode(self.localizedDescription, forKey: errkey)

        case .properyBounds(_):
            try container.encode("properyBounds", forKey: typeKey)
            try container.encode(self.localizedDescription, forKey: errkey)

        case .missingProperties(_):
            try container.encode("missingProperties", forKey: typeKey)
            try container.encode(self.localizedDescription, forKey: errkey)

        case .general(_):
            try container.encode("general", forKey: typeKey)
            try container.encode(self.localizedDescription, forKey: errkey)
        }
    }
}

internal extension BluetoothEncodeError {
    
    /// Create a BluetoothEncodeError Message for Bounded Types
    ///
    /// - Parameters:
    ///   - title: Title of Error
    ///   - msg: Optional Message at the end of error
    ///   - range: Bunded Range
    /// - Returns: BluetoothEncodeError
    static func boundsError<T>(title: String,
                               msg: String? = nil,
                               range: ClosedRange<T>) -> BluetoothEncodeError {
        if let msg = msg {
            return BluetoothEncodeError.properyBounds("\(title) \(range.lowerBound) and \(range.upperBound) \(msg).")
        }

        return BluetoothEncodeError.properyBounds("\(title) \(range.lowerBound) and \(range.upperBound).")
    }

}

/// Errors for Decoding
public enum BluetoothDecodeError {
    /// Decoding Not Supported
    case notSupported
    /// Property Size Issue
    case properySize(String)
    /// Manufacturer Not Correct
    case manufacturer(String)
    /// No Manufacturer Specific Data
    case noManufacturerSpecificData
    /// Specification Mismatch
    case specIssue(String)
    /// String Value Could not be Decoded
    case invalidStringValue

    /// General Error
    case general(String)
}

extension BluetoothDecodeError {
    
    public var description: String {
        return String(describing: self)
    }
}

extension BluetoothDecodeError: LocalizedError {
    
    /// A localized message describing what error occurred.
    public var errorDescription: String? {
        switch self {
        case .notSupported:
            return "Decoding Not Supported"
        case .properySize(let msg):
            return msg
        case .manufacturer(let msg):
            return msg
        case .noManufacturerSpecificData:
            return "No Manufacturer Specific Data"
        case .specIssue(let msg):
            return msg
        case .invalidStringValue:
            return "String Value Could not be Decoded"
        case .general(let msg):
            return msg
        }
    }
}

@available(swift 4.0)
extension BluetoothDecodeError: Encodable {
    
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
        var container = encoder.container(keyedBy: StringKey.self)
        
        let errkey = StringKey(stringValue: "message")!
        let typeKey = StringKey(stringValue: "error")!
        
        try container.encode("BluetoothDecodeError", forKey: StringKey(stringValue: "type")!)

        switch self {
        case .notSupported:
            try container.encode(self.description, forKey: typeKey)
            try container.encode(self.localizedDescription, forKey: errkey)

        case .properySize(_):
            try container.encode("properySize", forKey: typeKey)
            try container.encode(self.localizedDescription, forKey: errkey)

        case .manufacturer(_):
            try container.encode("manufacturer", forKey: typeKey)
            try container.encode(self.localizedDescription, forKey: errkey)

        case .noManufacturerSpecificData:
            try container.encode(self.description, forKey: typeKey)
            try container.encode(self.localizedDescription, forKey: errkey)

        case .specIssue(_):
            try container.encode("specIssue", forKey: typeKey)
            try container.encode(self.localizedDescription, forKey: errkey)

        case .invalidStringValue:
            try container.encode(self.description, forKey: typeKey)
            try container.encode(self.localizedDescription, forKey: errkey)

        case .general(_):
            try container.encode("general", forKey: typeKey)
            try container.encode(self.localizedDescription, forKey: errkey)
        }
    }
}

internal extension BluetoothDecodeError {
    
    /// Create Error for Wrong Company Identifier
    ///
    /// - Parameter company: Company Identifier
    /// - Returns: BluetoothDecodeError
    static func wrongIdentifier(_ company: CompanyIdentifier) -> BluetoothDecodeError {
        return BluetoothDecodeError.manufacturer("Manufacturer is not \(company.name).")
    }
}
