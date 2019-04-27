//
//  ProvisioningDataUnitCapabilities.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/4/18.
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

/// Provisioning Data Unit Capabilities
///
/// The device sends this PDU to indicate its supported provisioning capabilities to a Provisioner
public struct ProvisioningDataUnitCapabilities: ProvisioningDataUnit {

    /// Provisioning Protocol Data Unit Type
    private(set) public var unitType: ProvisioningDataUnitType

    /// Algorithms
    public struct AlgorithmType: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }

        /// FIPS P-256 Elliptic Curve Supported
        public static let fipsP256  = AlgorithmType(rawValue: 1 << 0)
    }

    /// Public Key Type
    public struct PublicKeyType: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }

        /// Public Key OOB information available
        public static let publicKeyOobAvailable     = PublicKeyType(rawValue: 1 << 0)
    }

    /// Public Key Type
    public struct StaticOobType: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }

        /// Static OOB information available
        public static let staticOobAvailable    = StaticOobType(rawValue: 1 << 0)
    }

    /// Supported Output OOB Actions
    public struct OutputActions: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }

        /// Blink Supported
        public static let blink         = OutputActions(rawValue: 1 << 0)
        /// Beep Supported
        public static let beep          = OutputActions(rawValue: 1 << 1)
        /// Virbrate Supported
        public static let vibrate       = OutputActions(rawValue: 1 << 2)
        /// Output Numeric Supported
        public static let numeric       = OutputActions(rawValue: 1 << 3)
        /// Output Alphanumeric Supported
        public static let alphanumeric  = OutputActions(rawValue: 1 << 4)
    }

    /// Supported Input OOB Actions
    public struct InputActions: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }

        /// Push Supported
        public static let push          = InputActions(rawValue: 1 << 0)
        /// Twist Supported
        public static let twist         = InputActions(rawValue: 1 << 1)
        /// Input Numeric Supported
        public static let numeric       = InputActions(rawValue: 1 << 2)
        /// Output Alphanumeric Supported
        public static let alphanumeric  = InputActions(rawValue: 1 << 3)
    }

    /// Number of Elements
    ///
    /// Number of elements supported by the device
    private(set) public var elements: ProvisioningSize

    /// Algorithms
    ///
    /// Supported algorithms and other capabilities
    private(set) public var algorithm: AlgorithmType

    /// Public Key
    ///
    /// Supported public key types
    private(set) public var publicKey: PublicKeyType

    /// Static OOB Type
    ///
    /// Supported static OOB Types
    private(set) public var staticOobTypes: StaticOobType

    /// Output OOB Size
    ///
    /// Maximum size of Output OOB supported
    private(set) public var outputObbSize: ProvisioningSize

    /// Output OOB Action
    ///
    /// Supported Output OOB Actions
    private(set) public var supportedOutputActions: OutputActions

    /// Input OOB Size
    ///
    /// Maximum size in octets of Input OOB supported
    private(set) public var inputOobSize: ProvisioningSize

    /// Input OOB Action
    ///
    /// Supported Input OOB Actions
    private(set) public var supportedInputActions: InputActions

    /// Create Provisioning Data Unit
    ///
    /// - Parameters:
    ///   - elements: Number of elements supported by the device
    ///   - algorithm: Supported algorithms and other capabilities
    ///   - publicKey: Supported public key types
    ///   - staticOobTypes: Supported static OOB Types
    ///   - outputObbSize: Maximum size of Output OOB supported
    ///   - supportedOutputActions: Supported Output OOB Actions
    ///   - inputOobSize: Maximum size in octets of Input OOB supported
    ///   - supportedInputActions: Supported Input OOB Actions
    public init(elements: ProvisioningSize,
                algorithm: AlgorithmType,
                publicKey: PublicKeyType,
                staticOobTypes: StaticOobType,
                outputObbSize: ProvisioningSize,
                supportedOutputActions: OutputActions,
                inputOobSize: ProvisioningSize,
                supportedInputActions: InputActions) {

        self.unitType = .capabilities
        self.elements = elements
        self.algorithm = algorithm
        self.publicKey = publicKey
        self.staticOobTypes = staticOobTypes
        self.outputObbSize = outputObbSize
        self.supportedOutputActions = supportedOutputActions
        self.inputOobSize = inputOobSize
        self.supportedInputActions = supportedInputActions
    }

    /// Encodes Provisioning Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(unitType.rawValue)
        msgData.append(elements.rawValue)
        msgData.append(Data(from: algorithm.rawValue.bigEndian))
        msgData.append(publicKey.rawValue)
        msgData.append(staticOobTypes.rawValue)
        msgData.append(outputObbSize.rawValue)
        msgData.append(Data(from: supportedOutputActions.rawValue.bigEndian))
        msgData.append(inputOobSize.rawValue)
        msgData.append(Data(from: supportedInputActions.rawValue.bigEndian))

        return.success(msgData)
    }
}

@available(swift 4.0)
extension ProvisioningDataUnitCapabilities.AlgorithmType: Encodable {

    enum CodeKeys: CodingKey {
        case fipsP256
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

        try container.encode(self.contains(.fipsP256), forKey: .fipsP256)
    }
}

@available(swift 4.0)
extension ProvisioningDataUnitCapabilities.PublicKeyType: Encodable {

    enum CodeKeys: CodingKey {
        case publicKeyOobAvailable
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

        try container.encode(self.contains(.publicKeyOobAvailable), forKey: .publicKeyOobAvailable)
    }
}

@available(swift 4.0)
extension ProvisioningDataUnitCapabilities.StaticOobType: Encodable {

    enum CodeKeys: CodingKey {
        case staticOobAvailable
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

        try container.encode(self.contains(.staticOobAvailable), forKey: .staticOobAvailable)
    }
}

@available(swift 4.0)
extension ProvisioningDataUnitCapabilities.OutputActions: Encodable {

    enum CodeKeys: CodingKey {
        case blink
        case beep
        case vibrate
        case numeric
        case alphanumeric
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

        try container.encode(self.contains(.blink), forKey: .blink)
        try container.encode(self.contains(.beep), forKey: .beep)
        try container.encode(self.contains(.vibrate), forKey: .vibrate)
        try container.encode(self.contains(.numeric), forKey: .numeric)
        try container.encode(self.contains(.alphanumeric), forKey: .alphanumeric)
    }
}

@available(swift 4.0)
extension ProvisioningDataUnitCapabilities.InputActions: Encodable {

    enum CodeKeys: CodingKey {
        case push
        case twist
        case numeric
        case alphanumeric
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

        try container.encode(self.contains(.push), forKey: .push)
        try container.encode(self.contains(.twist), forKey: .twist)
        try container.encode(self.contains(.numeric), forKey: .numeric)
        try container.encode(self.contains(.alphanumeric), forKey: .alphanumeric)
    }
}
