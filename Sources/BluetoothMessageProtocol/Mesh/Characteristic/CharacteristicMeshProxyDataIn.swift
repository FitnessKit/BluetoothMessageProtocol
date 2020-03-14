//
//  CharacteristicMeshProxyDataIn.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/4/18.
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

/// BLE Mesh Proxy Data In Characteristic
///
/// The Mesh Proxy Data In characteristic is used by the client to send Proxy PDUs to the server
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicMeshProxyDataIn: Characteristic {

    /// Characteristic Name
    public static var name: String { "Mesh Proxy Data In" }

    /// Characteristic UUID
    public static var uuidString: String { "2ADD" }

    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }

    /// Proxy Protocol Data Unit (PDU) Message
    ///
    /// The Mesh Proxy Data In characteristic shall support Proxy PDU messages
    /// containing Network PDUs, mesh beacons, and proxy configuration messages
    /// and shall not support other Proxy PDU type messages
    private(set) public var pduMessage: ProxyDataUnit

    /// Creates Characteristic
    ///
    /// - Parameter pduMessage: Proxy PDU Message
    public init(pduMessage: ProxyDataUnit) {
        self.pduMessage = pduMessage
    }

    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        return.failure(BluetoothDecodeError.notSupported)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {

        guard pduMessage is ProxyDataUnitProvisioning == false else {
            return.failure(BluetoothEncodeError.general("P roxy Data Unit of type Provisioning is not supported."))
        }

        switch pduMessage.encode() {
        case .success(let pduMessage):
            var msgData = Data()
            
            msgData.append(pduMessage)
            
            return.success(msgData)

        case .failure(let error):
            return.failure(error)
        }
    }
}

extension CharacteristicMeshProxyDataIn: Hashable {
    
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
        hasher.combine(pduMessage.messageType.segment)
        hasher.combine(pduMessage.messageType.message)
    }
}

extension CharacteristicMeshProxyDataIn: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicMeshProxyDataIn, rhs: CharacteristicMeshProxyDataIn) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.pduMessage.messageType.segment == rhs.pduMessage.messageType.segment)
            && (lhs.pduMessage.messageType.message == rhs.pduMessage.messageType.message)
    }
}
