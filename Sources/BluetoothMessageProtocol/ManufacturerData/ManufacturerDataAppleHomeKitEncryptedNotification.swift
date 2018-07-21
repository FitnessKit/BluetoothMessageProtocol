//
//  ManufacturerDataAppleHomeKitEncryptedNotification.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/15/18.
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

/// HAP BLE Encrypted Notification Advertisement Format Manufacturer Specific Data
///
/// This advertisment must only be used to notify changes in characteristic values
/// that are configured for Broadcasted Events.
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ManufacturerDataAppleHomeKitEncryptedNotification: ManufacturerData {

    /// Sub Type
    private(set) public var subType: UInt8

    /// Accessory Advertising Identifier
    private(set) public var accessoryIdentifier: MACAddress

    /// Global State Number
    ///
    /// Represents a change in the value of any of the characteristics
    /// that supports Disconnected Events.
    private(set) public var globalState: UInt16

    /// Characteristic Instance id
    ///
    /// ID of the Characteristic value included in the notification
    private(set) public var characteristicInstance: UInt16

    /// Auth Tag
    private(set) public var authTag: UInt32

    /// Creates an Apple HomeKit Manufacturer Specific Data Class
    ///
    /// - Parameters:
    ///   - subType: Sub Type
    ///   - accessoryIdentifier: Accessory Advertising Identifier
    ///   - globalState: Global State Number
    ///   - characteristicInstance: Characteristic Instance id
    ///   - authTag: Auth Tag
    public init(subType: UInt8,
                accessoryIdentifier: MACAddress,
                globalState: UInt16,
                characteristicInstance: UInt16,
                authTag: UInt32) {

        self.subType = subType
        self.accessoryIdentifier = accessoryIdentifier
        self.globalState = globalState
        self.characteristicInstance = characteristicInstance
        self.authTag = authTag

        super.init(manufacturer: .apple, specificData: nil)
    }

    internal init(subType: UInt8,
                  accessoryIdentifier: MACAddress,
                  globalState: UInt16,
                  characteristicInstance: UInt16,
                  authTag: UInt32,
                  rawData: Data) {
        self.subType = subType
        self.accessoryIdentifier = accessoryIdentifier
        self.globalState = globalState
        self.characteristicInstance = characteristicInstance
        self.authTag = authTag

        super.init(manufacturer: .apple, specificData: rawData)
    }

    /// Decodes Apple HomeKit Manufacturer Specific Data
    ///
    /// - Parameter data: Manufacturer Specific Data
    /// - Returns: ManufacturerDataAppleHomeKitEncryptedNotification
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> ManufacturerDataAppleHomeKitEncryptedNotification {

        let man = ManufacturerData(rawData: data)

        guard man.manufacturer == .apple else {
            throw BluetoothMessageProtocolError(.decodeError(msg: "Manufacturer is not Apple"))
        }

        if let data = man.specificData {
            var decoder = DecodeData()

            let type = decoder.decodeUInt8(data)

            guard type == AppleDeviceType.hapEncrypted.rawValue else {
                throw BluetoothMessageProtocolError(.decodeError(msg: "Type wrong for HomeKit Encrypted Notification"))
            }

            let ail = decoder.decodeUInt8(data)

            let ailNib = Nibble(ail)

            guard ailNib.lower == 22 else {
                throw BluetoothMessageProtocolError(.decodeError(msg: "HomeKit Message Length issue"))
            }

            let subType = (ail & 0xE0) >> 5

            let accessoryIdentifier = decoder.decodeMACAddress(data)

            let globalState = decoder.decodeUInt16(data)

            let characteristicInstance = decoder.decodeUInt16(data)

            /// characteristicValue
            _ = decoder.decodeUInt64(data)

            let authTag = decoder.decodeUInt32(data)

            return ManufacturerDataAppleHomeKitEncryptedNotification(subType: subType,
                                                                     accessoryIdentifier: accessoryIdentifier,
                                                                     globalState: globalState,
                                                                     characteristicInstance: characteristicInstance,
                                                                     authTag: authTag,
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
        msgData.append(AppleDeviceType.hapEncrypted.rawValue) //Type Proximity

        let ail = Nibble(lower: 16, upper: self.subType)
        msgData.append(ail.uint8Value)
        msgData.append(accessoryIdentifier.dataValue)
        msgData.append(Data(from: globalState.littleEndian))
        msgData.append(Data(from: characteristicInstance.littleEndian))

        return msgData
    }

    enum CodeKeys: CodingKey {
        case subType
        case accessoryIdentifier
        case globalState
        case characteristicInstance
        case authTag
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

        try container.encode(subType, forKey: .subType)
        try container.encode(accessoryIdentifier.stringValue, forKey: .accessoryIdentifier)
        try container.encode(globalState, forKey: .globalState)
        try container.encode(characteristicInstance, forKey: .characteristicInstance)
        try container.encode(authTag, forKey: .authTag)
    }
}
