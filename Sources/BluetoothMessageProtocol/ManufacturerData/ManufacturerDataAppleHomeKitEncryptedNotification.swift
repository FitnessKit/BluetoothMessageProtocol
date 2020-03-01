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

/// HAP BLE Encrypted Notification Advertisement Format Manufacturer Specific Data
///
/// This advertisment must only be used to notify changes in characteristic values
/// that are configured for Broadcasted Events.
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class ManufacturerDataAppleHomeKitEncryptedNotification: ManufacturerData {
    
    enum CodeKeys: CodingKey {
        case manufacturer
        case subType
        case accessoryIdentifier
        case globalState
        case characteristicInstance
        case authTag
    }
    
    /// Manufacturer
    public var manufacturer: CompanyIdentifier
    
    /// Data
    public var specificData: Data?
    
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
        self.manufacturer = .apple
        self.specificData = nil
        self.subType = subType
        self.accessoryIdentifier = accessoryIdentifier
        self.globalState = globalState
        self.characteristicInstance = characteristicInstance
        self.authTag = authTag
    }
    
    internal init(subType: UInt8,
                  accessoryIdentifier: MACAddress,
                  globalState: UInt16,
                  characteristicInstance: UInt16,
                  authTag: UInt32,
                  specificData: Data) {
        self.manufacturer = .apple
        self.specificData = specificData
        self.subType = subType
        self.accessoryIdentifier = accessoryIdentifier
        self.globalState = globalState
        self.characteristicInstance = characteristicInstance
        self.authTag = authTag
    }
    
    public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    /// Decodes Apple HomeKit Manufacturer Specific Data
    ///
    /// - Parameter data: ManufacturerData Data
    /// - Returns: ManufacturerData Result
    public class func decode(with data: Data) -> Result<ManufacturerDataAppleHomeKitEncryptedNotification, BluetoothDecodeError> {
        let man = ManufacturerSpecificData(rawData: data)
        
        guard man.manufacturer == .apple else {
            return.failure(BluetoothDecodeError.wrongIdentifier(.apple)) 
        }
        
        guard let data = man.specificData else {return.failure(BluetoothDecodeError.noManufacturerSpecificData)}
        
        var decoder = DecodeData()
        
        let type = decoder.decodeUInt8(data)
        
        guard type == AppleDeviceType.hapEncrypted.rawValue else {
            return.failure(BluetoothDecodeError.specIssue("Type wrong for HomeKit Encrypted Notification."))
        }
        
        /// 8 bits for HomeKit SubType and Length, the 3 significant bits specify the
        /// HomeKit SubType, and the remaining 5 bits is the length of the remaining bytes
        /// in the manufacturer specific data which shall be set to the value 22 (i.e the
        /// lower nibble must be set to 0x16).
        
        let ail = decoder.decodeUInt8(data)
        
        let ailNib = Nibble(ail)
        
        guard ailNib.lower == 22 else {
            return.failure(BluetoothDecodeError.specIssue("HomeKit Message Length issue."))
        }
        
        let subType = (ail & 0xE0) >> 5
        
        let accessoryIdentifier = decoder.decodeMACAddress(data)
        
        let globalState = decoder.decodeUInt16(data)
        
        let characteristicInstance = decoder.decodeUInt16(data)
        
        /// characteristicValue
        _ = decoder.decodeUInt64(data)
        
        let authTag = decoder.decodeUInt32(data)
        
        let homekit = ManufacturerDataAppleHomeKitEncryptedNotification(subType: subType,
                                                                        accessoryIdentifier: accessoryIdentifier,
                                                                        globalState: globalState,
                                                                        characteristicInstance: characteristicInstance,
                                                                        authTag: authTag,
                                                                        specificData: data)
        return.success(homekit)
    }
    
    /// Encodes Apple HomeKit Manufacturer Specific Data
    ///
    /// - Returns: ManufacturerData Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        
        var msgData = Data()
        
        msgData.append(Data(from: CompanyIdentifier.apple.companyID.littleEndian))
        msgData.append(AppleDeviceType.hapEncrypted.rawValue) //Type Proximity
        
        let ail = Nibble(lower: 22, upper: self.subType)
        msgData.append(ail.uint8Value)
        msgData.append(accessoryIdentifier.dataValue)
        msgData.append(Data(from: globalState.littleEndian))
        msgData.append(Data(from: characteristicInstance.littleEndian))
        
        return.success(msgData)
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
        
        try container.encode(manufacturer, forKey: .manufacturer)
        try container.encode(subType, forKey: .subType)
        try container.encode(accessoryIdentifier.stringValue, forKey: .accessoryIdentifier)
        try container.encode(globalState, forKey: .globalState)
        try container.encode(characteristicInstance, forKey: .characteristicInstance)
        try container.encode(authTag, forKey: .authTag)
    }
}

extension ManufacturerDataAppleHomeKitEncryptedNotification: Hashable {

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
        hasher.combine(manufacturer)
        hasher.combine(specificData)
        hasher.combine(subType)
        hasher.combine(accessoryIdentifier)
        hasher.combine(globalState)
        hasher.combine(characteristicInstance)
        hasher.combine(authTag)
    }
}

extension ManufacturerDataAppleHomeKitEncryptedNotification: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ManufacturerDataAppleHomeKitEncryptedNotification, rhs: ManufacturerDataAppleHomeKitEncryptedNotification) -> Bool {
        return (lhs.manufacturer == rhs.manufacturer) &&
            (lhs.specificData == rhs.specificData) &&
            (lhs.subType == rhs.subType) &&
            (lhs.accessoryIdentifier == rhs.accessoryIdentifier) &&
            (lhs.globalState == rhs.globalState) &&
            (lhs.characteristicInstance == rhs.characteristicInstance) &&
            (lhs.authTag == rhs.authTag)
    }
}
