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
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ManufacturerDataAppleiBeacon: ManufacturerData {

    /// Proximty UUID
    private(set) public var proximityUUID: UUID

    /// Major ID
    private(set) public var majorID: UInt16

    /// Minor ID
    private(set) public var minorID: UInt16

    /// Measured Power
    private(set) public var measuredPower: UInt8

    /// Creates an Apple iBeacon Manufacturer Specific Data Class
    ///
    /// - Parameters:
    ///   - proximityUUID: Proximty UUID
    ///   - majorID: Major ID
    ///   - minorID: Minor ID
    ///   - measuredPower: Measured Power
    public init(proximityUUID: UUID, majorID: UInt16, minorID: UInt16, measuredPower: UInt8) {

        self.proximityUUID = proximityUUID
        self.majorID = majorID
        self.minorID = minorID
        self.measuredPower = measuredPower

        super.init(manufacturer: .apple, specificData: nil)
    }

    internal init(proximityUUID: UUID, majorID: UInt16, minorID: UInt16, measuredPower: UInt8, rawData: Data) {
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

        guard man.manufacturer == .apple else { throw BluetoothMessageProtocolError.init(.decodeError(msg: "Manufacturer is not Apple")) }

        if let data = man.specificData {
            //Apple iBeacon  Advert: Btye0 - 76 (apples id) byte2: Type (2 is proximity) Byte2: 15 remaining length
            //Byte 4 - 16 Proximity UUID
            //Byte 20 - 21 Major ID
            //Byte 22 - 23 Minor ID
            //Byte 24 - TX Power (Measured Power)

            var decoder = DataDecoder(data)

            let type = decoder.decodeUInt8()

            guard type == 2 else { throw BluetoothMessageProtocolError.init(.decodeError(msg: "Type wrong for iBeacon")) }

            let uuidData = decoder.decodeData(length: 12)

            var uuid: UUID!
            if let uustring = uuidData.safeStringValue {
                uuid = UUID(uuidString: uustring)
            } else {
                uuid = UUID(uuidString: "00000000-0000-0000-0000-000000000000")
            }

            let majorID = decoder.decodeUInt16().bigEndian
            let minorID = decoder.decodeUInt16().bigEndian

            let measuredPower = decoder.decodeUInt8()

            return ManufacturerDataAppleiBeacon(proximityUUID: uuid, majorID: majorID, minorID: minorID, measuredPower: measuredPower, rawData: data)

        } else {
            throw BluetoothMessageProtocolError.init(.decodeError(msg: "No Manufacturer Specific Data"))
        }
    }

    /// Encodes Apple iBeacon Manufacturer Specific Data
    ///
    /// - Returns: Manufacturer Specific Data
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {

        var msgData = Data()

        msgData.append(Data(from: Manufacturer.apple.rawValue))
        msgData.append(2) //Type Proximity
        msgData.append(Data(from: proximityUUID.uuidString))
        msgData.append(Data(from: majorID.bigEndian))
        msgData.append(Data(from: minorID.bigEndian))
        msgData.append(measuredPower)

        return msgData
    }
}


@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension ManufacturerDataAppleiBeacon {

    /// Beacon Bits Proximity UUID
    public class var beaconBitsProximityUUID: UUID {
        get {
            return UUID(uuidString: "B7D1027D-6788-416E-994F-EA11075F1765")!
        }
    }

    /// Beacon Go Portable Proximity UUID
    public class var beaconGoPortableProximityUUID: UUID {
        get {
            return UUID(uuidString: "E6BF275E-0BB3-43E5-BF88-517F13A5A162")!
        }
    }

    /// Beacon Go USB Proximity UUID
    public class var beaconGoUsbProximityUUID: UUID {
        get {
            return UUID(uuidString: "F6322B94-D58A-F34E-B1A5-17C69CFBE32E")!
        }
    }

    /// Beaconstac Proximity UUID
    public class var beaconstacProximityUUID: UUID {
        get {
            return UUID(uuidString: "F94DBB23-2266-7822-3782-57BEAC0952AC")!
        }
    }

    /// Blue Sense Proximity UUID
    public class var blueSenseProximityUUID: UUID {
        get {
            return UUID(uuidString: "A0B13730-3A9A-11E3-AA6E-0800200C9A66")!
        }
    }

    /// BlueUp Proximity UUID
    public class var blueUpProximityUUID: UUID {
        get {
            return UUID(uuidString: "ACFD065E-C3C0-11E3-9BBE-1A514932AC01")!
        }
    }

    /// Brickyard Wireless Proximity UUID
    public class var brickyardWirelessProximityUUID: UUID {
        get {
            return UUID(uuidString: "3DB26185-F716-4780-8E82-B7D31714246D")!
        }
    }

    /// Bright Beacon Proximity UUID
    public class var brightBeaconProximityUUID: UUID {
        get {
            return UUID(uuidString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!
        }
    }

    /// Cobi Beacon Proximity UUID
    public class var cobiBeaconProximityUUID: UUID {
        get {
            return UUID(uuidString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!
        }
    }

    /// Ekoor B Proximity UUID
    public class var ekoorBProximityUUID: UUID {
        get {
            return UUID(uuidString: "A7157DCB-093E-B822-7ACA-0F9156EDF378")!
        }
    }

    /// Ekoor LR Proximity UUID
    public class var ekoorLRProximityUUID: UUID {
        get {
            return UUID(uuidString: "A7157DCB-093E-B822-7ACA-0F9156EDF377")!
        }
    }

    /// Enote Proximity UUID
    public class var enoteProximityUUID: UUID {
        get {
            return UUID(uuidString: "DAB59C4F-A4D6-EE28-6BFE-8E0000BBC2BB")!
        }
    }

    /// Essi Proximity UUID
    public class var essiProximityUUID: UUID {
        get {
            return UUID(uuidString: "A7AE2EB7-1F00-4168-B99B-A749BAC1CA64")!
        }
    }

    /// Estimote Proximity UUID
    public class var estimoteProximityUUID: UUID {
        get {
            return UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!
        }
    }

    /// Estimote Virtual iOS Proximity UUID
    public class var estimoteVirtualiOSProximityUUID: UUID {
        get {
            return UUID(uuidString: "8492E75F-4FD6-469D-B132-043FE94921D8")!
        }
    }

    /// Estimote Virtual macOS Proximity UUID
    public class var estimoteVirtualMacOSProximityUUID: UUID {
        get {
            return UUID(uuidString: "08D4A950-80F0-4D42-A14B-D53E063516E6")!
        }
    }

    /// GeLo Proximity UUID
    public class var geLoProximityUUID: UUID {
        get {
            return UUID(uuidString: "11E44F09-4EC4-407E-9203-CF57A50FBCE0")!
        }
    }

    /// Glimworm Proximity UUID
    public class var glimwormProximityUUID: UUID {
        get {
            return UUID(uuidString: "74278BDA-B644-4520-8f0C-720EAF059935")!
        }
    }

    /// Kontakt Proximity UUID
    public class var kontaktProximityUUID: UUID {
        get {
            return UUID(uuidString: "F7826DA6-4FA2-4E98-8024-BC5B71E0893E")!
        }
    }

    /// Locos Lab Proximity UUID
    public class var locosLabProximityUUID: UUID {
        get {
            return UUID(uuidString: "F0018B9B-7509-4C31-A905-1A27D39C003C")!
        }
    }

    /// North Pole Engineering WASP Beacon Proximity UUID
    public class var northPoleEngineeringProximityUUID: UUID {
        get {
            return UUID(uuidString: "69626561-636F-6E6E-6F72-7468506F6C65")!
        }
    }

    /// Orange Sa Proximity UUID
    public class var orangeSaProximityUUID: UUID {
        get {
            return UUID(uuidString: "3D4F13B4-D1FD-4049-80E5-D3EDCC840b69")!
        }
    }

    /// Radius Proximity UUID
    public class var radiusProximityUUID: UUID {
        get {
            return UUID(uuidString: "2F234454-CF6D-4A0F-ADf2-F4911BA9FFA6")!
        }
    }

    /// Reco Proximity UUID
    public class var recoProximityUUID: UUID {
        get {
            return UUID(uuidString: "24DDF411-8CF1-440C-87CD-E368DAF9C93E")!
        }
    }

    /// Roximity Proximity UUID
    public class var roximityProximityUUID: UUID {
        get {
            return UUID(uuidString: "8DEEFBB9-F738-4297-8040-96668BB44281")!
        }
    }

    /// Ticatag TiBe  Proximity UUID
    public class var ticatagTiBeProximityUUID: UUID {
        get {
            return UUID(uuidString: "801DDF60-A557-43B5-BBA1-D4ABEFC13045")!
        }
    }

    /// Ticatag TiBe Connect Button Clicked Proximity UUID
    public class var ticatagTiBeConnectButtonClickedProximityUUID: UUID {
        get {
            return UUID(uuidString: "801DDF60-A557-43B5-BBA1-D4ABEFC13046")!
        }
    }

    /// Ticatag TiBe Connect Button Double Clicked Proximity UUID
    public class var ticatagTiBeConnectButtonDoubleClickedProximityUUID: UUID {
        get {
            return UUID(uuidString: "801DDF60-A557-43B5-BBA1-D4ABEFC13056")!
        }
    }

    /// Ticatag TiBe Connect Button Held Proximity UUID
    public class var ticatagTiBeConnectButtonHeldProximityUUID: UUID {
        get {
            return UUID(uuidString: "801DDF60-A557-43B5-BBA1-D4ABEFC13066")!
        }
    }

    /// TwoCanoes Proximity UUID
    public class var twoCanoesProximityUUID: UUID {
        get {
            return UUID(uuidString: "92AB49BE-4127-42F4-B532-90FAF1E26491")!
        }
    }


}
