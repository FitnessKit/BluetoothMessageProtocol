//
//  AppleBeaconExtension.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 12/24/17.
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

@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension ManufacturerDataAppleiBeacon {

    //// Avvel International Proximity UUID
    public class var avvelInternationalProximityUUID: UUID {
        return UUID(uuidString: "EBEFD083-70A2-47C8-9837-E7B5634DF524")!
    }

    /// Beacon Bits Proximity UUID
    public class var beaconBitsProximityUUID: UUID {
        return UUID(uuidString: "B7D1027D-6788-416E-994F-EA11075F1765")!
    }

    /// Beacon Go Portable Proximity UUID
    public class var beaconGoPortableProximityUUID: UUID {
        return UUID(uuidString: "E6BF275E-0BB3-43E5-BF88-517F13A5A162")!
    }

    /// Beacon Go USB Proximity UUID
    public class var beaconGoUsbProximityUUID: UUID {
        return UUID(uuidString: "F6322B94-D58A-F34E-B1A5-17C69CFBE32E")!
    }

    /// Beaconstac Proximity UUID
    public class var beaconstacProximityUUID: UUID {
        return UUID(uuidString: "F94DBB23-2266-7822-3782-57BEAC0952AC")!
    }

    /// Blue Sense Proximity UUID
    public class var blueSenseProximityUUID: UUID {
        return UUID(uuidString: "A0B13730-3A9A-11E3-AA6E-0800200C9A66")!
    }

    /// BlueUp Proximity UUID
    public class var blueUpProximityUUID: UUID {
        return UUID(uuidString: "ACFD065E-C3C0-11E3-9BBE-1A514932AC01")!
    }

    /// Brickyard Wireless Proximity UUID
    public class var brickyardWirelessProximityUUID: UUID {
        return UUID(uuidString: "3DB26185-F716-4780-8E82-B7D31714246D")!
    }

    /// Bright Beacon Proximity UUID
    public class var brightBeaconProximityUUID: UUID {
        return UUID(uuidString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!
    }

    /// Cobi Beacon Proximity UUID
    public class var cobiBeaconProximityUUID: UUID {
        return UUID(uuidString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!
    }

    /// Ekoor B Proximity UUID
    public class var ekoorBProximityUUID: UUID {
        return UUID(uuidString: "A7157DCB-093E-B822-7ACA-0F9156EDF378")!
    }

    /// Ekoor LR Proximity UUID
    public class var ekoorLRProximityUUID: UUID {
        return UUID(uuidString: "A7157DCB-093E-B822-7ACA-0F9156EDF377")!
    }

    /// Enote Proximity UUID
    public class var enoteProximityUUID: UUID {
        return UUID(uuidString: "DAB59C4F-A4D6-EE28-6BFE-8E0000BBC2BB")!
    }

    /// Essi Proximity UUID
    public class var essiProximityUUID: UUID {
        return UUID(uuidString: "A7AE2EB7-1F00-4168-B99B-A749BAC1CA64")!
    }

    /// Estimote Proximity UUID
    public class var estimoteProximityUUID: UUID {
        return UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!
    }

    /// Estimote Virtual iOS Proximity UUID
    public class var estimoteVirtualiOSProximityUUID: UUID {
        return UUID(uuidString: "8492E75F-4FD6-469D-B132-043FE94921D8")!
    }

    /// Estimote Virtual macOS Proximity UUID
    public class var estimoteVirtualMacOSProximityUUID: UUID {
        return UUID(uuidString: "08D4A950-80F0-4D42-A14B-D53E063516E6")!
    }

    /// GeLo Proximity UUID
    public class var geLoProximityUUID: UUID {
        return UUID(uuidString: "11E44F09-4EC4-407E-9203-CF57A50FBCE0")!
    }

    /// Glimworm Proximity UUID
    public class var glimwormProximityUUID: UUID {
        return UUID(uuidString: "74278BDA-B644-4520-8f0C-720EAF059935")!
    }

    /// Kontakt Proximity UUID
    public class var kontaktProximityUUID: UUID {
        return UUID(uuidString: "F7826DA6-4FA2-4E98-8024-BC5B71E0893E")!
    }

    /// KST Particle Proximity UUID
    public class var kstParticleProximityUUID: UUID {
        return UUID(uuidString: "8AEFB031-6C32-486F-825B-E26FA193487D")!
    }

    /// Locos Lab Proximity UUID
    public class var locosLabProximityUUID: UUID {
        return UUID(uuidString: "F0018B9B-7509-4C31-A905-1A27D39C003C")!
    }

    /// North Pole Engineering WASP Beacon Proximity UUID
    public class var northPoleEngineeringProximityUUID: UUID {
        return UUID(uuidString: "69626561-636F-6E6E-6F72-7468506F6C65")!
    }

    /// Orange Sa Proximity UUID
    public class var orangeSaProximityUUID: UUID {
        return UUID(uuidString: "3D4F13B4-D1FD-4049-80E5-D3EDCC840b69")!
    }

    /// Radius Proximity UUID
    public class var radiusProximityUUID: UUID {
        return UUID(uuidString: "2F234454-CF6D-4A0F-ADf2-F4911BA9FFA6")!
    }

    /// Reco Proximity UUID
    public class var recoProximityUUID: UUID {
        return UUID(uuidString: "24DDF411-8CF1-440C-87CD-E368DAF9C93E")!
    }

    /// Roximity Proximity UUID
    public class var roximityProximityUUID: UUID {
        return UUID(uuidString: "8DEEFBB9-F738-4297-8040-96668BB44281")!
    }

    /// Sensorberg SB-0 Proximity UUID
    public class var sensorbergSB0ProximityUUID: UUID {
        return UUID(uuidString: "73676723-7400-0000-FFFF-0000FFFF0000")!
    }

    /// Sensorberg SB-1 Proximity UUID
    public class var sensorbergSB1ProximityUUID: UUID {
        return UUID(uuidString: "73676723-7400-0000-FFFF-0000FFFF0001")!
    }

    /// Sensorberg SB-2 Proximity UUID
    public class var sensorbergSB2ProximityUUID: UUID {
        return UUID(uuidString: "73676723-7400-0000-FFFF-0000FFFF0002")!
    }

    /// Sensorberg SB-3 Proximity UUID
    public class var sensorbergSB3ProximityUUID: UUID {
        return UUID(uuidString: "73676723-7400-0000-FFFF-0000FFFF0003")!
    }

    /// Sensorberg SB-4 Proximity UUID
    public class var sensorbergSB4ProximityUUID: UUID {
        return UUID(uuidString: "73676723-7400-0000-FFFF-0000FFFF0004")!
    }

    /// Sensorberg SB-5 Proximity UUID
    public class var sensorbergSB5ProximityUUID: UUID {
        return UUID(uuidString: "73676723-7400-0000-FFFF-0000FFFF0005")!
    }

    /// Sensorberg SB-6 Proximity UUID
    public class var sensorbergSB6ProximityUUID: UUID {
        return UUID(uuidString: "73676723-7400-0000-FFFF-0000FFFF0006")!
    }

    /// Sensorberg SB-7 Proximity UUID
    public class var sensorbergSB7ProximityUUID: UUID {
        return UUID(uuidString: "73676723-7400-0000-FFFF-0000FFFF0007")!
    }

    /// Ticatag TiBe  Proximity UUID
    public class var ticatagTiBeProximityUUID: UUID {
        return UUID(uuidString: "801DDF60-A557-43B5-BBA1-D4ABEFC13045")!
    }

    /// Ticatag TiBe Connect Button Clicked Proximity UUID
    public class var ticatagTiBeConnectButtonClickedProximityUUID: UUID {
        return UUID(uuidString: "801DDF60-A557-43B5-BBA1-D4ABEFC13046")!
    }

    /// Ticatag TiBe Connect Button Double Clicked Proximity UUID
    public class var ticatagTiBeConnectButtonDoubleClickedProximityUUID: UUID {
        return UUID(uuidString: "801DDF60-A557-43B5-BBA1-D4ABEFC13056")!
    }

    /// Ticatag TiBe Connect Button Held Proximity UUID
    public class var ticatagTiBeConnectButtonHeldProximityUUID: UUID {
        return UUID(uuidString: "801DDF60-A557-43B5-BBA1-D4ABEFC13066")!
    }

    /// TwoCanoes Proximity UUID
    public class var twoCanoesProximityUUID: UUID {
        return UUID(uuidString: "92AB49BE-4127-42F4-B532-90FAF1E26491")!
    }
}
