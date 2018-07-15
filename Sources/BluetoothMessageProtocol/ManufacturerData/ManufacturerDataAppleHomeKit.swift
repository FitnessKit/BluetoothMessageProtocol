//
//  ManufacturerDataAppleHomeKit.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/14/18.
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
import CryptoSwift

/// Apple HomeKit Manufacturer Specific Data
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ManufacturerDataAppleHomeKit: ManufacturerData {

    /// Types of Status Flags
    public struct StatusFlag: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }

        /// Pairing Enabled
        public static let pairingEnabled    = StatusFlag(rawValue: 1 << 0)
    }

    /// Advertising Interval
    private(set) public var advertisingInterval: UInt8

    /// Status Flags
    private(set) public var statusFlag: StatusFlag

    /// Device ID
    private(set) public var deviceId: MACAddress

    /// Accessory Category Identifier
    ///
    /// Identifier, which indicates the category that best describes
    /// the primary function of the accessory
    private(set) public var accessoryCategory: HomeKitAccessoryCategory

    /// Global State Number
    ///
    /// Represents a change in the value of any of the characteristics
    /// that supports Disconnected Events.
    private(set) public var globalState: UInt16

    /// Configuration Number
    ///
    /// Accessories must increment the config number after a firmware update.
    /// This value must have a range of 1-255 and wrap to 1 when it overflows.
    /// This value must persist across reboots, power cycles and firmware updates
    private(set) public var configuration: UInt8

    /// Compatible Version
    ///
    /// The version of the HomeKit Accessory Protocol Used
    private(set) public var compatibleVersion: UInt8

    /// Setup ID
    ///
    /// String of 4 Characters in Length
    private(set) public var setupID: String?

    /// Setup Hash
    private(set) public var setupHash: UInt32


    /// Creates an Apple HomeKit Manufacturer Specific Data Class
    ///
    /// - Parameters:
    ///   - advertisingInterval: Advertising Interval
    ///   - statusFlag: Status Flags
    ///   - deviceId: Device ID
    ///   - accessoryCategory: Accessory Category Identifier
    ///   - globalState: Global State Number
    ///   = configuration: Configuration Number
    ///   - compatibleVersion: Compatible Version
    ///   - setupID: Setup ID String
    public init(advertisingInterval: UInt8,
                statusFlag: StatusFlag,
                deviceId: MACAddress,
                accessoryCategory: HomeKitAccessoryCategory,
                globalState: UInt16,
                configuration: UInt8,
                compatibleVersion: UInt8 = 2,
                setupID: String) {

        self.advertisingInterval = advertisingInterval
        self.statusFlag = statusFlag
        self.deviceId = deviceId
        self.accessoryCategory = accessoryCategory
        self.globalState = globalState
        self.configuration = configuration
        self.compatibleVersion = compatibleVersion
        self.setupID = String(setupID.prefix(4))

        if let setupdata = setupID.data(using: .utf8),
            let deviceData = deviceId.stringValue.data(using: .utf8) {

            let shaTest = (setupdata + deviceData).sha512()
            self.setupHash = shaTest.prefix(4).to(type: UInt32.self)

        } else {
            self.setupHash = 0
        }

        super.init(manufacturer: .apple, specificData: nil)
    }

    internal init(advertisingInterval: UInt8,
                  statusFlag: StatusFlag,
                  deviceId: MACAddress,
                  accessoryCategory: HomeKitAccessoryCategory,
                  globalState: UInt16,
                  configuration: UInt8,
                  compatibleVersion: UInt8,
                  setupHash: UInt32,
                  rawData: Data) {
        self.advertisingInterval = advertisingInterval
        self.statusFlag = statusFlag
        self.deviceId = deviceId
        self.accessoryCategory = accessoryCategory
        self.globalState = globalState
        self.configuration = configuration
        self.compatibleVersion = compatibleVersion

        self.setupHash = setupHash

        super.init(manufacturer: .apple, specificData: rawData)
    }

    /// Decodes Apple HomeKit Manufacturer Specific Data
    ///
    /// - Parameter data: Manufacturer Specific Data
    /// - Returns: ManufacturerDataAppleHomeKit
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> ManufacturerDataAppleHomeKit {

        let man = ManufacturerData(rawData: data)

        guard man.manufacturer == .apple else {
            throw BluetoothMessageProtocolError(.decodeError(msg: "Manufacturer is not Apple"))
        }

        if let data = man.specificData {
            var decoder = DecodeData()

            let type = decoder.decodeUInt8(data)

            guard type == AppleDeviceType.hap.rawValue else {
                throw BluetoothMessageProtocolError(.decodeError(msg: "Type wrong for HomeKit"))
            }

            let ail = decoder.decodeUInt8(data)

//            guard ail & 0x1F == 13 else {
//                throw BluetoothMessageProtocolError(.decodeError(msg: "HomeKit Message Length issue"))
//            }

            let interval = (ail & 0xE0) >> 5

            let statusFlag = StatusFlag(rawValue: decoder.decodeUInt8(data))

            let deviceId = decoder.decodeMACAddress(data)

            let accessoryCategory = HomeKitAccessoryCategory(rawValue: decoder.decodeUInt16(data)) ?? .other

            let globalState = decoder.decodeUInt16(data)

            let configuration = decoder.decodeUInt8(data)

            let compatibleVersion = decoder.decodeUInt8(data)

            let setupHash = decoder.decodeUInt32(data)

            return ManufacturerDataAppleHomeKit(advertisingInterval: interval,
                                                statusFlag: statusFlag,
                                                deviceId: deviceId,
                                                accessoryCategory: accessoryCategory,
                                                globalState: globalState,
                                                configuration: configuration,
                                                compatibleVersion: compatibleVersion,
                                                setupHash: setupHash,
                                                rawData: data)

        } else {
            throw BluetoothMessageProtocolError(.decodeError(msg: "No Manufacturer Specific Data"))
        }
    }

    /// Encodes Apple HomeKit Manufacturer Specific Data
    ///
    /// - Returns: Manufacturer Specific Data
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {

        var msgData = Data()

        msgData.append(Data(from: CompanyIdentifier.apple.companyID.littleEndian))
        msgData.append(AppleDeviceType.hap.rawValue)

        let ail = Nibble(lower: 13, upper: self.advertisingInterval)
        msgData.append(ail.uint8Value)
        msgData.append(statusFlag.rawValue)
        msgData.append(deviceId.dataValue)
        msgData.append(Data(from: accessoryCategory.rawValue.littleEndian))
        msgData.append(Data(from: globalState.littleEndian))
        msgData.append(configuration)
        msgData.append(compatibleVersion)

        return msgData
    }

    enum CodeKeys: CodingKey {
        case advertisingInterval
        case statusFlag
        case deviceId
        case accessoryCategory
        case globalState
        case configuration
        case compatibleVersion
        case setupID
        case setupHash
    }

    public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
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
    open override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodeKeys.self)
        try super.encode(to: encoder)

        try container.encode(advertisingInterval, forKey: .advertisingInterval)
        try container.encode(statusFlag, forKey: .statusFlag)
        try container.encode(deviceId.stringValue, forKey: .deviceId)
        try container.encode(accessoryCategory, forKey: .accessoryCategory)
        try container.encode(globalState, forKey: .globalState)
        try container.encode(configuration, forKey: .configuration)
        try container.encode(compatibleVersion, forKey: .compatibleVersion)
        try container.encodeIfPresent(setupID, forKey: .setupID)
        try container.encode(setupHash, forKey: .setupHash)
    }
}

@available(swift 4.0)
extension ManufacturerDataAppleHomeKit.StatusFlag: Encodable {

    enum CodeKeys: CodingKey {
        case pairingEnabled
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
        var container = encoder.container(keyedBy: CodeKeys.self)

        try container.encode(self.contains(.pairingEnabled), forKey: .pairingEnabled)
    }
}
