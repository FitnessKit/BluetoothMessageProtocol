//
//  GapDataType.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 6/16/18.
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

/// Generic Access Profile Data Types
public enum GapDataType: UInt8 {
    /// Flags
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.3 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, sections 11.1.3 and 18.1 (v4.0)Core Specification Supplement, Part A, section 1.3
    case flags                          = 0x01
    /// Incomplete List of 16-bit Service Class UUIDs
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.1 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, sections 11.1.1 and 18.2 (v4.0)Core Specification Supplement, Part A, section 1.1
    case incomplete16BitUuid            = 0x02
    /// Complete List of 16-bit Service Class UUIDs
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.1 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, sections 11.1.1 and 18.2 (v4.0)Core Specification Supplement, Part A, section 1.1
    case complete16BitUuid              = 0x03
    /// Incomplete List of 32-bit Service Class UUIDs
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.1 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, section 18.2 (v4.0)Core Specification Supplement, Part A, section 1.1
    case incomplete32BitUuid            = 0x04
    /// Complete List of 32-bit Service Class UUIDs
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.1 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, section 18.2 (v4.0)Core Specification Supplement, Part A, section 1.1
    case complete32BitUuid              = 0x05
    /// Incomplete List of 128-bit Service Class UUIDs
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.1 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, sections 11.1.1 and 18.2 (v4.0)Core Specification Supplement, Part A, section 1.1
    case incomplete128BitUuid           = 0x06
    /// Complete List of 128-bit Service Class UUIDs
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.1 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, sections 11.1.1 and 18.2 (v4.0)Core Specification Supplement, Part A, section 1.1
    case complete128BitUuid             = 0x07
    /// Shortened Local Name
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.2 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, sections 11.1.2 and 18.4 (v4.0)Core Specification Supplement, Part A, section 1.2
    case shortendedLocalName            = 0x08
    /// Complete Local Name
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.2 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, sections 11.1.2 and 18.4 (v4.0)Core Specification Supplement, Part A, section 1.2
    case completeLocalName              = 0x09
    /// Tx Power Level
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.5 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, sections 11.1.5 and 18.3 (v4.0)Core Specification Supplement, Part A, section 1.5
    case txPowerLevel                   = 0x0A
    /// Class of Device
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.6 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, sections 11.1.5 and 18.5 (v4.0)Core Specification Supplement, Part A, section 1.6
    case classOfDevice                  = 0x0D
    /// Simple Pairing Hash C
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.6 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, sections 11.1.5 and 18.5 (v4.0)
    case simplePairingHash              = 0x0E
    /// Simple Pairing Randomizer
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.6 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, sections 11.1.5 and 18.5 (v4.0)
    case simplePairingRandomizer        = 0x0F
    /// Security Manager TK Value
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, sections 11.1.7 and 18.6 (v4.0)
    /// Core Specification Supplement, Part A, section 1.8
    case securityManagerTkValue         = 0x10
    /// Security Manager Out of Band Flags
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, sections 11.1.6 and 18.7 (v4.0)
    /// Core Specification Supplement, Part A, section 1.7
    case securityManagerOOBFlags        = 0x11
    /// Slave Connection Interval Range
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, sections 11.1.8 and 18.8 (v4.0)
    /// Core Specification Supplement, Part A, section 1.9
    case slaveConnectionIntervalRange   = 0x12
    /// List of 16-bit Service Solicitation UUIDs
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, sections 11.1.9 and 18.9 (v4.0)
    /// Core Specification Supplement, Part A, section 1.10
    case serviceSolicitation16BitUuid   = 0x14
    /// List of 128-bit Service Solicitation UUIDs
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, sections 11.1.9 and 18.9 (v4.0)
    /// Core Specification Supplement, Part A, section 1.10
    case serviceSolicitation128BitUuid  = 0x15
    /// Service Data
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, sections 11.1.10 and 18.10 (v4.0)
    case serviceData                    = 0x16
    /// Public Target Address
    ///
    /// Bluetooth Core Specification:Core Specification Supplement, Part A, section 1.13
    case publicTargetAddress            = 0x17
    /// Random Target Address
    ///
    /// Bluetooth Core Specification:Core Specification Supplement, Part A, section 1.14
    case randomTargetAddress            = 0x18
    /// Appearance
    ///
    /// Bluetooth Core Specification:Core Specification Supplement, Part A, section 1.12
    case appearance                     = 0x19
    /// Advertising Interval
    ///
    /// Bluetooth Core Specification:Core Specification Supplement, Part A, section 1.15
    case advertisingInterval            = 0x1A
    /// LE Bluetooth Device Address
    ///
    /// Core Specification Supplement, Part A, section 1.16
    case leBluetoothDeviceAddress       = 0x1B
    /// LE Role
    ///
    /// Core Specification Supplement, Part A, section 1.17
    case leRole                         = 0x1C
    /// Simple Pairing Hash C-256
    ///
    /// Core Specification Supplement, Part A, section 1.6
    case simplePairingHash256           = 0x1D
    /// Simple Pairing Randomizer R-256
    ///
    /// Core Specification Supplement, Part A, section 1.6
    case simplePairingRandomizer256     = 0x1E
    /// List of 32-bit Service Solicitation UUIDs
    ///
    /// Core Specification Supplement, Part A, section 1.10
    case serviceSolicitation32BitUuid   = 0x1F
    /// Service Data - 32-bit UUID
    ///
    /// Core Specification Supplement, Part A, section 1.11
    case serviceData32BitUuid           = 0x20
    /// Service Data - 128-bit UUID
    ///
    /// Core Specification Supplement, Part A, section 1.11
    case serviceData128BitUuid          = 0x21
    /// LE Secure Connections Confirmation Value
    ///
    /// Core Specification Supplement Part A, Section 1.6
    case leSecureConnectionConfirmation = 0x22
    /// LE Secure Connections Random Value
    ///
    /// Core Specification Supplement Part A, Section 1.6
    case leSecureConnectionRandomValue  = 0x23
    /// URI
    ///
    /// Bluetooth Core Specification:Core Specification Supplement, Part A, section 1.18
    case uri                            = 0x24
    /// Indoor Positioning
    ///
    /// Indoor Posiioning Service v1.0 or later
    case indoorPositioning              = 0x25
    /// Transport Discovery Data
    ///
    /// Transport Discovery Service v1.0 or later
    case transportDiscoveryData         = 0x26
    /// LE Supported Features
    ///
    /// Core Specification Supplement, Part A, Section 1.19
    case leSupportedFeatures            = 0x27
    /// Channel Map Update Indication
    ///
    /// Core Specification Supplement, Part A, Section 1.20
    case channelMapUpdateIndication     = 0x28
    // PB-ADV
    ///
    /// Mesh Profile Specification Section 5.2.1
    case pbAdv                          = 0x29
    /// Mesh Message
    ///
    /// Mesh Profile Specification Section 3.3.1
    case meshMessage                    = 0x2A
    /// Mesh Beacon
    ///
    /// Mesh Profile Specification Section 3.9
    case meshBeacon                     = 0x2B
    /// BIGInfo
    case bigInfo                        = 0x2C
    /// Broadcast_Code
    case broadcastCode                  = 0x2D
    /// Resolvable Set Identifier
    ///
    /// Coordinated Set Identification Profile 1.0
    case resolvableSetIdentifier        = 0x2E
    /// Advertising Interval - long
    ///
    /// Core Specification Supplement v10, Part A, Section 1.15
    case advertisingIntervalLong        = 0x2F
    /// 3D Information Data
    ///
    /// 3D Synchronization Profile, v1.0 or later
    case threeDimensionInformationData  = 0x3D
    /// Manufacturer Specific Data
    ///
    /// Bluetooth Core Specification:Vol. 3, Part C, section 8.1.4 (v2.1 + EDR, 3.0 + HS and 4.0)
    /// Vol. 3, Part C, sections 11.1.4 and 18.11 (v4.0)Core Specification Supplement, Part A, section 1.4
    case manufacturerSpecificData       = 0xFF
}
