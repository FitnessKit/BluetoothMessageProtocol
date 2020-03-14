//
//  ManufacturerDataAltBeacon.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 1/6/18.
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

/// AltBeacon Manufacturer Specific Data
///
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class ManufacturerDataAltBeacon: ManufacturerData {
    
    enum CodeKeys: CodingKey {
        case manufacturer
        case beaconID
        case referencePower
        case manufacturerReserved
    }
    
    /// Manufacturer
    public var manufacturer: CompanyIdentifier
    
    /// Data
    public var specificData: Data?
    
    /// Beacon ID
    ///
    /// A 20-byte value uniquely identifying the beacon
    private(set) public var beaconID: [UInt8]
    
    /// Reference Power
    ///
    /// Average received signal strength at 1m from the advertiser
    private(set) public var referencePower: Int8
    
    /// Manufacturer Reserved Value
    ///
    /// Reserved for use by the manufacturer to implement special features
    private(set) public var manufacturerReserved: UInt8
    
    /// Creates an AltBeacon Manufacturer Specific Data Class
    ///
    /// - Parameters:
    ///   - manufacturer: Company Identifier
    ///   - beaconID: Beacon ID
    ///   - referencePower: Reference Power
    ///   - manufacturerReserved: Manufacturer Reserved Value
    public init(manufacturer: CompanyIdentifier,
                beaconID: [UInt8],
                referencePower: Int8,
                manufacturerReserved: UInt8) {
        self.manufacturer = manufacturer
        self.specificData = nil
        self.beaconID = beaconID
        self.referencePower = referencePower
        self.manufacturerReserved = manufacturerReserved
    }
    
    internal init(manufacturer: CompanyIdentifier,
                  beaconID: [UInt8],
                  referencePower: Int8,
                  manufacturerReserved: UInt8,
                  rawData: Data) {
        self.manufacturer = manufacturer
        self.specificData = rawData
        self.beaconID = beaconID
        self.referencePower = referencePower
        self.manufacturerReserved = manufacturerReserved
    }
    
    public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    /// Decodes Manufacturer Specific Data into ManufacturerData
    ///
    /// - Parameter data: ManufacturerData Data
    /// - Returns: ManufacturerData Result
    public class func decode(with data: Data) -> Result<ManufacturerDataAltBeacon, BluetoothDecodeError> {
        let man = ManufacturerSpecificData(rawData: data)
        
        guard let data = man.specificData else {return.failure(BluetoothDecodeError.noManufacturerSpecificData)}
        
        var decoder = DecodeData()
        
        let beaconCode = decoder.decodeUInt16(data).bigEndian
        
        if beaconCode != 0xBEAC {
            return.failure(BluetoothDecodeError.general("Not an AltBeacon Message."))
        }
        
        let beacData = decoder.decodeData(data, length: 20)
        let beacBytes = [UInt8](beacData)
        
        let referencePower = decoder.decodeInt8(data)
        let manData = decoder.decodeUInt8(data)
        
        let beacon = ManufacturerDataAltBeacon(manufacturer: man.manufacturer,
                                               beaconID: beacBytes,
                                               referencePower: referencePower,
                                               manufacturerReserved: manData,
                                               rawData: data)
        return.success(beacon)
    }
    
    /// Encodes AltBeacon Manufacturer Specific Data
    ///
    /// - Returns: ManufacturerData Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        
        guard beaconID.count == 20 else {
            return.failure(BluetoothEncodeError.properySize("Beacon ID must be 20 bytes.")) 
        }
        
        var msgData = Data()
        
        msgData.append(Data(from: manufacturer.companyID.littleEndian))
        msgData.append(Data(from: UInt16(0xBEAC).bigEndian))
        
        for byte in beaconID {
            msgData.append(byte)
        }
        
        msgData.append(UInt8(referencePower))
        msgData.append(manufacturerReserved)
        
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
        try container.encode(beaconID, forKey: .beaconID)
        try container.encode(referencePower, forKey: .referencePower)
        try container.encode(manufacturerReserved, forKey: .manufacturerReserved)
    }
}

extension ManufacturerDataAltBeacon: Hashable {

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
        hasher.combine(beaconID)
        hasher.combine(referencePower)
        hasher.combine(manufacturerReserved)
    }
}

extension ManufacturerDataAltBeacon: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ManufacturerDataAltBeacon, rhs: ManufacturerDataAltBeacon) -> Bool {
        return (lhs.manufacturer == rhs.manufacturer) &&
            (lhs.specificData == rhs.specificData) &&
            (lhs.beaconID == rhs.beaconID) &&
            (lhs.referencePower == rhs.referencePower) &&
            (lhs.manufacturerReserved == rhs.manufacturerReserved)
    }
}
