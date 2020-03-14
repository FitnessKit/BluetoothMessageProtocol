//
//  ManufacturerDataGymConnect.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 10/19/18.
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

/// GymConnect Manufacturer Specific Data
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class ManufacturerDataGymConnect: ManufacturerData {
    
    enum CodeKeys: CodingKey {
        case manufacturer
        case equipment
        case status
    }
    
    /// Status Flags
    public struct StatusFlags: OptionSet, Hashable {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        /// Has Static QR Code Advertising ID
        ///
        /// If this bit is set, then the GymConnect peripheral supports device
        /// discovery/connection via a fixed/static advertising ID (ID contained
        /// in the device name). This advertising ID is present on a QR code which
        /// is attached to the device. Smartphone apps etc. can use this flag to
        /// determine if a QR code reader should be displayed during device discovery.
        public static let qrCodeAdvertising     = StatusFlags(rawValue: 1 << 0)
        /// Solicited Advertising Status Valid
        ///
        /// This flag indicates if the "Solicited Advertising Status" flag
        /// (the next flag) is valid/should be interpreted.
        public static let solicitedAdvertising  = StatusFlags(rawValue: 1 << 1)
        /// Solicited Advertising Status
        ///
        /// If the "solicitedAdvertising" (previous flag) is unset, then the state
        /// of this flag must be ignored/should not be interpreted.
        /// This flag being set means that advertising was "solicited";
        /// The advertising was started as a result of an action by the user, as
        //// opposed to automatic/"always on" advertising.
        public static let wasSolicited          = StatusFlags(rawValue: 1 << 1)
        
    }
    
    /// Manufacturer
    public var manufacturer: CompanyIdentifier
    
    /// Data
    public var specificData: Data?
    
    /// Equipment Type
    private(set) public var equipment: GymConnectEquipmentType
    
    /// Status
    private(set) public var status: StatusFlags
    
    /// Creates Manufacturer Specific Data class
    ///
    /// - Parameter equipment: Equipment Type
    /// - Parameter status: StatusFlags
    public init(equipment: GymConnectEquipmentType, status: StatusFlags) {
        self.manufacturer = .wahooFitness
        self.specificData = nil
        self.equipment = equipment
        self.status = status
    }
    
    internal init(equipment: GymConnectEquipmentType, status: StatusFlags, rawData: Data) {
        self.manufacturer = .wahooFitness
        self.specificData = rawData
        self.equipment = equipment
        self.status = status
    }
    
    public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    /// Decodes Manufacturer Specific Data into ManufacturerData
    ///
    /// - Parameter data: ManufacturerData Data
    /// - Returns: ManufacturerData Result
    public class func decode(with data: Data) -> Result<ManufacturerDataGymConnect, BluetoothDecodeError> {
        let man = ManufacturerSpecificData(rawData: data)
        
        guard man.manufacturer == .wahooFitness else {
            return.failure(BluetoothDecodeError.wrongIdentifier(.wahooFitness)) 
        }
        
        guard let data = man.specificData else {return.failure(BluetoothDecodeError.noManufacturerSpecificData)}
        
        var decoder = DecodeData()
        
        let type = decoder.decodeUInt8(data)
        
        let equip = GymConnectEquipmentType.create(type)
        
        let flags = StatusFlags(rawValue: decoder.decodeUInt8(data))
        
        let gymConn = ManufacturerDataGymConnect(equipment: equip,
                                                 status: flags,
                                                 rawData: data)
        return.success(gymConn)
    }
    
    /// Encodes Manufacturer Specific Data
    ///
    /// - Returns: ManufacturerData Result
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
        var container = encoder.container(keyedBy: CodeKeys.self)
        
        try container.encode(manufacturer, forKey: .manufacturer)
        try container.encode(equipment, forKey: .equipment)
        try container.encode(status, forKey: .status)
    }
}

@available(swift 4.0)
extension ManufacturerDataGymConnect.StatusFlags: Encodable {
    
    enum CodeKeys: CodingKey {
        case qrCodeAdvertising
        case solicitedAdvertising
        case wasSolicited
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
        
        try container.encode(self.contains(.qrCodeAdvertising), forKey: .qrCodeAdvertising)
        try container.encode(self.contains(.solicitedAdvertising), forKey: .solicitedAdvertising)
        try container.encode(self.contains(.wasSolicited), forKey: .wasSolicited)
    }
}

extension ManufacturerDataGymConnect: Hashable {

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
        hasher.combine(equipment)
        hasher.combine(status)
    }
}

extension ManufacturerDataGymConnect: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ManufacturerDataGymConnect, rhs: ManufacturerDataGymConnect) -> Bool {
        return (lhs.manufacturer == rhs.manufacturer) &&
            (lhs.specificData == rhs.specificData) &&
            (lhs.equipment == rhs.equipment) &&
            (lhs.status == rhs.status)
    }
}
