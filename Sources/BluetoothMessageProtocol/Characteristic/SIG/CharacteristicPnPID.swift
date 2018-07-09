//
//  CharacteristicPnPID.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/20/17.
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

/// BLE PnP ID Characteristic
///
/// The PnP_ID characteristic is a set of values that used to create a device ID
/// value that is unique for this device. Included in the characteristic is a Vendor
/// ID Source field, a Vendor ID field, a Product ID field and a Product Version field.
/// These values are used to identify all devices of a given type/model/version using numbers
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicPnPID: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "PnP ID"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A50"
    }

    /// Vendor Source Types
    public enum VendorSource: UInt8 {
        /// Unknown
        case unknown                    = 0
        /// Bluetooth SIG assigned Company Identifier value from the Assigned Numbers document
        case assignedCompanyIdentifer   = 1
        /// USB Implementer’s Forum assigned Vendor ID value
        case usbAssignedVendorIdentifer = 2
    }

    /// Vendor ID Source
    ///
    /// Identifies the source of the Vendor ID field
    private(set) public var vendorIdSource: VendorSource

    /// Vendor ID
    ///
    /// Identifies the product vendor from the namespace in the Vendor ID Source
    private(set) public var vendorId: UInt16

    /// Product ID
    ///
    /// Manufacturer managed identifier for this product
    private(set) public var productId: UInt16

    /// Product Version
    ///
    /// Manufacturer managed version for this product
    private(set) public var productVersion: UInt16

    /// Creates PnP ID Charateristic
    ///
    /// - Parameters:
    ///   - vendorIdSource: Identifies the source of the Vendor ID field
    ///   - vendorId: Identifies the product vendor from the namespace in the Vendor ID Source
    ///   - productId: Manufacturer managed identifier for this product
    ///   - productVersion: Manufacturer managed version for this product
    public init(vendorIdSource: VendorSource, vendorId: UInt16, productId: UInt16, productVersion: UInt16) {
        self.vendorIdSource = vendorIdSource
        self.vendorId = vendorId
        self.productId = productId
        self.productVersion = productVersion

        super.init(name: CharacteristicPnPID.name,
                   uuidString: CharacteristicPnPID.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicPnPID {
        var decoder = DecodeData()

        let vendorIdSource = VendorSource(rawValue: decoder.decodeUInt8(data)) ?? .unknown

        let vendorId = decoder.decodeUInt16(data)
        let productId = decoder.decodeUInt16(data)
        let productVersion = decoder.decodeUInt16(data)

        return CharacteristicPnPID(vendorIdSource: vendorIdSource,
                                   vendorId: vendorId,
                                   productId: productId,
                                   productVersion: productVersion)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(vendorIdSource.rawValue)
        msgData.append(Data(from: vendorId.littleEndian))
        msgData.append(Data(from: productId.littleEndian))
        msgData.append(Data(from: productVersion.littleEndian))

        return msgData
    }
}
