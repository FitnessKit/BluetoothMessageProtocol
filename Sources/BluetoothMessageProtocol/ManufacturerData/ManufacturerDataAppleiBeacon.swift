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
open class ManufacturerDataAppleiBeacon: ManufacturerData {

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
    public init(proximityUUID: UUID, majorID: UInt16, minorID: UInt16, measuredPower: Int8) {

        self.proximityUUID = proximityUUID
        self.majorID = majorID
        self.minorID = minorID
        self.measuredPower = measuredPower

        super.init(manufacturer: .apple, specificData: nil)
    }

    internal init(proximityUUID: UUID, majorID: UInt16, minorID: UInt16, measuredPower: Int8, rawData: Data) {
        self.proximityUUID = proximityUUID
        self.majorID = majorID
        self.minorID = minorID
        self.measuredPower = measuredPower

        super.init(manufacturer: .apple, specificData: rawData)
    }

    /// Decodes Apple iBeacon Manufacturer Specific Data
    ///
    /// - Parameter data: Manufacturer Specific Data
    /// - Returns: ManufacturerDataAppleiBeacon
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> ManufacturerDataAppleiBeacon {

        let man = ManufacturerData(rawData: data)

        guard man.manufacturer == .apple else {
            throw BluetoothMessageProtocolError.wrongIdentifier(.apple)
        }

        if let data = man.specificData {
            //Apple iBeacon  Advert: Btye0 - 76 (apples id) byte2: Type (2 is proximity) Byte2: 15 remaining length
            //16 bytes - Proximity UUID
            //2 bytes - Major ID
            //2 bytes - Minor ID
            //1 byte - TX Power (Measured Power)

            var decoder = DecodeData()

            let type = decoder.decodeUInt8(data)

            guard type == AppleDeviceType.iBeaccon.rawValue else {
                throw BluetoothMessageProtocolError.decode("Type wrong for iBeacon.")
            }

            let subType = decoder.decodeUInt8(data)

            // subtype must be 0x15 - 21
            guard subType == 21 else {
                throw BluetoothMessageProtocolError.decode("Type wrong for iBeacon.")
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
                uuid = UUID(uuidString: "00000000-0000-0000-0000-000000000000")
            }

            let majorID = decoder.decodeUInt16(data).bigEndian
            let minorID = decoder.decodeUInt16(data).bigEndian

            let measuredPower = decoder.decodeInt8(data)

            return ManufacturerDataAppleiBeacon(proximityUUID: uuid!,
                                                majorID: majorID,
                                                minorID: minorID,
                                                measuredPower: measuredPower,
                                                rawData: data)

        } else {
            throw BluetoothMessageProtocolError.noManufacturerSpecificData
        }
    }

    /// Encodes Apple iBeacon Manufacturer Specific Data
    ///
    /// - Returns: Manufacturer Specific Data
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {

        var msgData = Data()

        msgData.append(Data(from: CompanyIdentifier.apple.companyID.littleEndian))
        msgData.append(AppleDeviceType.iBeaccon.rawValue) //Type Proximity
        msgData.append(21) //Sub Type
        msgData.append(Data(from: proximityUUID.uuidString))
        msgData.append(Data(from: majorID.bigEndian))
        msgData.append(Data(from: minorID.bigEndian))
        msgData.append(UInt8(measuredPower))

        return msgData
    }

    enum CodeKeys: CodingKey {
        case proximityUUID
        case majorID
        case minorID
        case measuredPower
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

        try container.encode(proximityUUID, forKey: .proximityUUID)
        try container.encode(majorID, forKey: .majorID)
        try container.encode(minorID, forKey: .minorID)
        try container.encode(measuredPower, forKey: .measuredPower)
    }
}
