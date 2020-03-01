//
//  ServiceDataMeshProvisioning.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/7/18.
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
import FitnessUnits

/// BLE Mesh Provisioning Service Data
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class ServiceDataMeshProvisioning: ServiceData {

    /// Service Data Name
    public static var name: String { "Mesh Provisioning" }

    /// Service Data UUID
    public static var uuidString: String { "1827" }

    /// Name of the Service Data AD Type
    public var name: String { Self.name }
    
    /// Service Data AD Type UUID String
    public var uuidString: String { Self.uuidString }

    /// Device UUID
    private(set) public var deviceUUID: String

    /// OOB Information
    private(set) public var oobInformation: MeshOutOfBandInformation

    /// Service Data for Mesh Provisioning
    ///
    /// - Parameters:
    ///   - deviceUUID: UUID For Device
    ///   - oobInformation: OOB Information
    public init(deviceUUID: String, oobInformation: MeshOutOfBandInformation) {
        self.deviceUUID = deviceUUID
        self.oobInformation = oobInformation
    }

    /// Decodes Service Data AD Data into ServiceData
    ///
    /// - Parameter data: ServiceData Data
    /// - Returns: ServiceData Result
    public class func decode(with data: Data) -> Result<ServiceDataMeshProvisioning, BluetoothDecodeError> {
        guard data.count == 18 else {
            return.failure(BluetoothDecodeError.properySize("Mesh Provisioning must be 18 Bytes Long."))
        }
        
        var decoder = DecodeData()
        
        let uuidData = decoder.decodeData(data, length: 16)
        let deviceUUID = uuidData.create128BitUuid(reverseData: false)
        
        let oobInformation = MeshOutOfBandInformation(rawValue: decoder.decodeUInt16(data).bigEndian)
        
        let serviceData = ServiceDataMeshProvisioning(deviceUUID: deviceUUID,
                                                      oobInformation: oobInformation)
        return.success(serviceData)
    }

    /// Encodes the Service Data AD Type into Data
    ///
    /// - Returns: Service Data AD Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        //Not Yet Supported
        return.failure(BluetoothEncodeError.notSupported)
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
        var container = encoder.container(keyedBy: StringKey.self)

        let dataKey = StringKey(stringValue: "data")!
        let uuidKey = StringKey(stringValue: "deviceUUID")!
        let oobKey = StringKey(stringValue: "oobInformation")!

        var unitContainer = container.nestedContainer(keyedBy: StringKey.self, forKey: dataKey)
        try unitContainer.encode(deviceUUID, forKey: uuidKey)
        try unitContainer.encode(oobInformation, forKey: oobKey)
    }
}

extension ServiceDataMeshProvisioning: Hashable {

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
        hasher.combine(deviceUUID)
        hasher.combine(oobInformation)
    }
}

extension ServiceDataMeshProvisioning: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ServiceDataMeshProvisioning, rhs: ServiceDataMeshProvisioning) -> Bool {
        return (lhs.deviceUUID == rhs.deviceUUID) &&
            (lhs.oobInformation == rhs.oobInformation)
    }
}
