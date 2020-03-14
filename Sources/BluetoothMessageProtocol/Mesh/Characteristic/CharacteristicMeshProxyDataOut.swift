//
//  CharacteristicMeshProxyDataOut.swift
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

/// BLE Mesh Proxy Data Out Characteristic
///
/// The Mesh Proxy Data Out characteristic is used by the server to send Proxy PDUs to the client
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicMeshProxyDataOut: Characteristic {

    /// Characteristic Name
    public static var name: String { "Mesh Proxy Data Out" }

    /// Characteristic UUID
    public static var uuidString: String { "2ADE" }

    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }

    /// Proxy Protocol Data Unit (PDU) Message
    ///
    /// The Mesh Proxy Data Out characteristic shall support Proxy PDU message
    /// containing Network PDUs, mesh beacons, and proxy configuration messages
    /// and shall not support other Proxy PDU type messages
    private(set) public var pduMessage: Data

    /// Creates Characteristic
    ///
    /// - Parameter pduMessage: Proxy PDU Message
    public init(pduMessage: Data) {
        self.pduMessage = pduMessage
    }

    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        if let pduType = decoder.decodeUInt8IfPresent(data) {
            
            do {
                let type = try ProxyMessageType(pduType)
                
                guard type.message != .provisioning else {
                    return.failure(BluetoothDecodeError.general("Proxy Data Unit of type Provisioning is not supported."))
                }

            } catch let error as BluetoothDecodeError {
                return.failure(error)
            } catch {
                return.failure(BluetoothDecodeError.general(error.localizedDescription))
            }

        } else {
            return.failure(BluetoothDecodeError.properySize("Proxy Data size too small."))
        }

        let char = CharacteristicMeshProxyDataOut(pduMessage: data[decoder.index...])
        return.success(char as! C)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        /// Not Yet Supported
        return.failure(BluetoothEncodeError.notSupported)
    }
}

extension CharacteristicMeshProxyDataOut: Hashable {
    
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
        hasher.combine(pduMessage)
    }
}

extension CharacteristicMeshProxyDataOut: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicMeshProxyDataOut, rhs: CharacteristicMeshProxyDataOut) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.pduMessage == rhs.pduMessage)
    }
}
