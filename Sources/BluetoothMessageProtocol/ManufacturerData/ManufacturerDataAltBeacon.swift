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
open class ManufacturerDataAltBeacon: ManufacturerData {

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

        self.beaconID = beaconID
        self.referencePower = referencePower
        self.manufacturerReserved = manufacturerReserved

        super.init(manufacturer: manufacturer, specificData: nil)
    }

    internal init(manufacturer: CompanyIdentifier,
                  beaconID: [UInt8],
                  referencePower: Int8,
                  manufacturerReserved: UInt8,
                  rawData: Data) {

        self.beaconID = beaconID
        self.referencePower = referencePower
        self.manufacturerReserved = manufacturerReserved

        super.init(manufacturer: manufacturer, specificData: rawData)
    }

    /// Decodes AltBeacon Manufacturer Specific Data
    ///
    /// - Parameter data: Manufacturer Specific Data
    /// - Returns: ManufacturerDataAltBeacon
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> ManufacturerDataAltBeacon {

        let man = ManufacturerData(rawData: data)

        if let data = man.specificData {

            var decoder = DecodeData()

            let beaconCode = decoder.decodeUInt16(data).bigEndian

            if beaconCode != 0xBEAC {
                throw BluetoothMessageProtocolError.decode("Not an AltBeacon Message.")
            }

            let beacData = decoder.decodeData(data, length: 20)
            let beacBytes = [UInt8](beacData)

            let referencePower = decoder.decodeInt8(data)
            let manData = decoder.decodeUInt8(data)

            return ManufacturerDataAltBeacon(manufacturer: man.manufacturer,
                                             beaconID: beacBytes,
                                             referencePower: referencePower,
                                             manufacturerReserved: manData,
                                             rawData: data)

        } else {
            throw BluetoothMessageProtocolError.noManufacturerSpecificData
        }
    }

    /// Encodes AltBeacon Manufacturer Specific Data
    ///
    /// - Returns: Manufacturer Specific Data
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {

        guard beaconID.count == 20 else {
            throw BluetoothMessageProtocolError.encode("Beacon ID must be 20 bytes.")
        }

        var msgData = Data()

        msgData.append(Data(from: manufacturer.companyID.littleEndian))
        msgData.append(Data(from: UInt16(0xBEAC).bigEndian))

        for byte in beaconID {
            msgData.append(byte)
        }

        msgData.append(UInt8(referencePower))
        msgData.append(manufacturerReserved)

        return msgData
    }

    enum CodeKeys: CodingKey {
        case beaconID
        case referencePower
        case manufacturerReserved
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

        try container.encode(beaconID, forKey: .beaconID)
        try container.encode(referencePower, forKey: .referencePower)
        try container.encode(manufacturerReserved, forKey: .manufacturerReserved)
    }

}
