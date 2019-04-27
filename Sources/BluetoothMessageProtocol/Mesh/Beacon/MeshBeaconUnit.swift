//
//  MeshBeaconUnit.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/7/18.
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

/// Mesh Beacon Types
public enum MeshBeaconType: UInt8 {
    /// Unprovisioned Device beacon
    case unprovisioned  = 0
    /// Secure Network Beacon
    case secureNetwork  = 1
}

/// Protocol for Mesh Beacon
public protocol MeshBeacon: BluetoothEncodable {

    /// Mesh Beacon Type
    var unitType: MeshBeaconType { get }
}

/// Secure Network Mesh Beacon
///
/// The Secure Network beacon is used by nodes to identify the subnet and its security state
public struct MeshBeaconSecureNetwork: MeshBeacon {

    /// Beacon Flags
    ///
    /// Contains the Key Refresh Flag and IV Update Flag
    public struct Flag: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }

        /// Key Refresh Flag
        public static let keyRefreshTrue    = Flag(rawValue: 1 << 0)
        /// IV Update Active (else normal operation)
        public static let ivUpdateActive    = Flag(rawValue: 1 << 1)
    }

    /// Mesh Beacon Type
    private(set) public var unitType: MeshBeaconType

    /// Beacon Flags
    private(set) public var flags: Flag

    /// Network ID
    ///
    /// The Network ID of the mesh network
    private(set) public var networkId: UInt64

    /// IV Index Value
    ///
    /// Current value of the IV Index
    private(set) public var ivIndex: UInt32

    /// Authentication Value
    ///
    /// Authenticates security network beacon
    private(set) public var authenticationValue: UInt64

    public init(flags: Flag, networkId: UInt64, ivIndex: UInt32, authenticationValue: UInt64) {
        self.unitType = .secureNetwork
        self.flags = flags
        self.networkId = networkId
        self.ivIndex = ivIndex
        self.authenticationValue = authenticationValue
    }

    /// Encodes Provisioning Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(unitType.rawValue)
        msgData.append(flags.rawValue)
        msgData.append(Data(from: networkId.bigEndian))
        msgData.append(Data(from: ivIndex.bigEndian))
        msgData.append(Data(from: authenticationValue.bigEndian))

        return.success(msgData)
    }
}

/// Unprovisioned Mesh Beacon
///
/// The Unprovisioned Device beacon is used by devices that are unprovisioned to
/// allow them to be discovered by a Provisioner
public struct MeshBeaconUnprovisioned: MeshBeacon {

    /// Mesh Beacon Type
    private(set) public var unitType: MeshBeaconType

    /// Device UUID
    private(set) public var deviceUUID: String

    /// OOB Information
    private(set) public var oobInformation: MeshOutOfBandInformation

    /// URI Hash
    private(set) public var uriHash: UInt32?

    /// Create Mesh Beacon
    ///
    /// - Parameters:
    ///   - deviceUUID: UUID For Device
    ///   - oobInformation: OOB Information
    ///   - uriHash: URI Hash
    public init(deviceUUID: String, oobInformation: MeshOutOfBandInformation, uriHash: UInt32?) {
        self.unitType = .unprovisioned
        self.deviceUUID = deviceUUID
        self.oobInformation = oobInformation
        self.uriHash = uriHash
    }

    /// Encodes Provisioning Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        guard deviceUUID.count == 16 else {
            return.failure(BluetoothEncodeError.properySize("Device UUID must be a 128Bit UUID."))
        }

        let uuidString = deviceUUID.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: " ", with: "")

        let uuidData = Data(Data(from: uuidString).reversed())

        msgData.append(unitType.rawValue)
        msgData.append(uuidData)
        msgData.append(Data(from: oobInformation.rawValue.bigEndian))

        if let uriHash = uriHash {
            msgData.append(Data(from: uriHash.bigEndian))
        }

        return.success(msgData)
    }
}
