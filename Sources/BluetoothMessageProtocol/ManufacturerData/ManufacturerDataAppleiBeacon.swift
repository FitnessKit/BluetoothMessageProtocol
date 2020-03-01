//
//  ManufacturerDataAppleiBeacon.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/12/17.
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

/// Apple iBeacon Manufacturer Specific Data
///
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class ManufacturerDataAppleiBeacon: ManufacturerData {
    
    enum CodeKeys: CodingKey {
        case manufacturer
        case proximityUUID
        case majorID
        case minorID
        case measuredPower
    }
    
    /// Manufacturer
    public var manufacturer: CompanyIdentifier
    
    /// Data
    public var specificData: Data?
    
    /// Proximty UUID
    private(set) public var proximityUUID: UUID
    
    /// Major ID
    private(set) public var majorID: UInt16
    
    /// Minor ID
    private(set) public var minorID: UInt16
    
    /// Measured Power
    private(set) public var measuredPower: Int8
    
    /// Creates an Apple iBeacon Manufacturer Specific Data Class
    ///
    /// - Parameters:
    ///   - proximityUUID: Proximty UUID
    ///   - majorID: Major ID
    ///   - minorID: Minor ID
    ///   - measuredPower: Measured Power
    public init(proximityUUID: UUID,
                majorID: UInt16,
                minorID: UInt16,
                measuredPower: Int8) {
        self.manufacturer = .apple
        self.specificData = nil
        self.proximityUUID = proximityUUID
        self.majorID = majorID
        self.minorID = minorID
        self.measuredPower = measuredPower
    }
    
    internal init(proximityUUID: UUID,
                  majorID: UInt16,
                  minorID: UInt16,
                  measuredPower: Int8,
                  specificData: Data) {
        self.manufacturer = .apple
        self.specificData = specificData
        self.proximityUUID = proximityUUID
        self.majorID = majorID
        self.minorID = minorID
        self.measuredPower = measuredPower
    }
    
    public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    /// Decodes Apple iBeacon Manufacturer Specific Data
    ///
    /// - Parameter data: ManufacturerData Data
    /// - Returns: ManufacturerData Result
    public class func decode(with data: Data) -> Result<ManufacturerDataAppleiBeacon, BluetoothDecodeError> {
        let man = ManufacturerSpecificData(rawData: data)
        
        guard man.manufacturer == .apple else {
            return.failure(BluetoothDecodeError.wrongIdentifier(.apple)) 
        }
        
        guard let data = man.specificData else {return.failure(BluetoothDecodeError.noManufacturerSpecificData)}
        
        //Apple iBeacon  Advert: Btye0 - 76 (apples id) byte2: Type (2 is proximity) Byte2: 15 remaining length
        //16 bytes - Proximity UUID
        //2 bytes - Major ID
        //2 bytes - Minor ID
        //1 byte - TX Power (Measured Power)
        
        var decoder = DecodeData()
        
        let type = decoder.decodeUInt8(data)
        
        guard type == AppleDeviceType.iBeaccon.rawValue else {
            return.failure(BluetoothDecodeError.specIssue("Type wrong for iBeacon."))
        }
        
        let subType = decoder.decodeUInt8(data)
        
        // subtype must be 0x15 - 21
        guard subType == 21 else {
            return.failure(BluetoothDecodeError.specIssue("SubType wrong for iBeacon. Must be 0x15"))
        }
        
        /// Build the UUID String
        var uuidString: String = ""
        uuidString += decoder.decodeData(data, length: 4).hexadecimalString(packed: true) + "-"
        uuidString += decoder.decodeData(data, length: 2).hexadecimalString(packed: true) + "-"
        uuidString += decoder.decodeData(data, length: 2).hexadecimalString(packed: true) + "-"
        uuidString += decoder.decodeData(data, length: 2).hexadecimalString(packed: true) + "-"
        uuidString += decoder.decodeData(data, length: 6).hexadecimalString(packed: true)
        
        var uuid = UUID(uuidString: uuidString)
        
        if uuid == nil {
            uuid = UUID(staticString: "00000000-0000-0000-0000-000000000000")
        }
        
        let majorID = decoder.decodeUInt16(data).bigEndian
        let minorID = decoder.decodeUInt16(data).bigEndian
        
        let measuredPower = decoder.decodeInt8(data)
        
        let beacon = ManufacturerDataAppleiBeacon(proximityUUID: uuid!,
                                                  majorID: majorID,
                                                  minorID: minorID,
                                                  measuredPower: measuredPower,
                                                  specificData: data)
        return.success(beacon)
    }
    
    /// Encodes Apple iBeacon Manufacturer Specific Data
    ///
    /// - Returns: ManufacturerData Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        msgData.append(Data(from: CompanyIdentifier.apple.companyID.littleEndian))
        msgData.append(AppleDeviceType.iBeaccon.rawValue) //Type Proximity
        msgData.append(21) //Sub Type
        msgData.append(Data(from: proximityUUID.uuidString))
        msgData.append(Data(from: majorID.bigEndian))
        msgData.append(Data(from: minorID.bigEndian))
        msgData.append(UInt8(measuredPower))
        
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
        try container.encode(proximityUUID, forKey: .proximityUUID)
        try container.encode(majorID, forKey: .majorID)
        try container.encode(minorID, forKey: .minorID)
        try container.encode(measuredPower, forKey: .measuredPower)
    }
}

extension ManufacturerDataAppleiBeacon: Hashable {

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
        hasher.combine(proximityUUID)
        hasher.combine(majorID)
        hasher.combine(minorID)
        hasher.combine(measuredPower)
    }
}

extension ManufacturerDataAppleiBeacon: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ManufacturerDataAppleiBeacon, rhs: ManufacturerDataAppleiBeacon) -> Bool {
        return (lhs.manufacturer == rhs.manufacturer) &&
            (lhs.specificData == rhs.specificData) &&
            (lhs.proximityUUID == rhs.proximityUUID) &&
            (lhs.majorID == rhs.majorID) &&
            (lhs.minorID == rhs.minorID) &&
            (lhs.measuredPower == rhs.measuredPower)
    }
}
