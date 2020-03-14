//
//  CharacteristicHTTPStatusCode.swift
//  BluetoothMessageProtocol
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

/// BLE HTTP Status Code Characteristic
///
/// The HTTP Status Code characteristic contains the Status-Code from the Status-Line
/// of the first line of the HTTP Response Message, followed by one octet indicating
/// the Data Status Bit Field indicating the status of the data received
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicHTTPStatusCode: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "HTTP Status Code" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2AB8" }
    
    /// Types of Data Status
    public struct DataStatus: OptionSet, Hashable {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        /// The response-header and entity-header fields were received in the HTTP
        /// response and stored in the HTTP Headers characteristic for the Client to read
        public static let headersReceived   = DataStatus(rawValue: 1 << 0)
        /// The response-header and entity-header fields exceeded 512 octets in length
        /// and the first 512 octets were saved in the HTTP Headers characteristic
        public static let headersTruncated  = DataStatus(rawValue: 1 << 1)
        /// The entity-body field was received in the HTTP response and stored in the
        /// HTTP Entity Body characteristic for the Client to read
        public static let bodyReceived      = DataStatus(rawValue: 1 << 2)
        /// The entity-body field exceeded 512 octets in length and the first 512 octets
        /// were saved in the HTTP Headers characteristic
        public static let bodyTruncated     = DataStatus(rawValue: 1 << 3)
    }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Status Code
    private(set) public var statusCode: UInt16
    
    /// Data Status
    private(set) public var dataStatus: DataStatus
    
    /// Creates HTTP Status Code Characteristic
    ///
    /// - Parameters:
    ///   - statusCode: Status Code
    ///   - dataStatus: Data Status
    public init(statusCode: UInt16, dataStatus: DataStatus) {
        self.statusCode = statusCode
        self.dataStatus = dataStatus
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let statusCode = decoder.decodeUInt16(data)
        let dataStatus = DataStatus(rawValue: decoder.decodeUInt8(data))
        
        let char = CharacteristicHTTPStatusCode(statusCode: statusCode, dataStatus: dataStatus)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        msgData.append(Data(from: statusCode))
        msgData.append(dataStatus.rawValue)
        
        return.success(msgData)
    }
}

extension CharacteristicHTTPStatusCode: Hashable {
    
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
        hasher.combine(uuidString)
        hasher.combine(statusCode)
        hasher.combine(dataStatus)
    }
}

extension CharacteristicHTTPStatusCode: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicHTTPStatusCode, rhs: CharacteristicHTTPStatusCode) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.statusCode == rhs.statusCode)
            && (lhs.dataStatus == rhs.dataStatus)
    }
}
