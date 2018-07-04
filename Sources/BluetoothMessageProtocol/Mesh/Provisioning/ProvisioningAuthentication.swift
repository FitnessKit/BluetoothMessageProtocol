//
//  ProvisioningAuthentication.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/4/18.
//

import Foundation

/// Provisioning Authentication Size
public enum ProvisioningAuthenticationSize {
    /// Prohibited
    case prohibited
    /// The Size in characters to be used
    case value(_: UInt8)

    /// Raw Value
    public var rawValue: UInt8 {
        switch self {
        case .prohibited:
            return UInt8.min
        case .value(let num):
            return num
        }
    }

    /// Creates a ProvisioningAuthenticationSize
    ///
    /// - Parameter value: raw value
    /// - Returns: ProvisioningAuthenticationSize
    public static func create(_ value: UInt8) -> ProvisioningAuthenticationSize {
        if value == UInt8.min {
            return ProvisioningAuthenticationSize.prohibited
        } else {
            return ProvisioningAuthenticationSize.value(value)
        }
    }
}

/// Provisioning Authentication Method Type
public enum ProvisioningAuthenticationMethod: UInt8 {
    /// No OOB authentication is used
    case none       = 0
    /// Static OOB authentication is used
    case `static`   = 1
    /// Output OOB authentication is used
    case output     = 2
    /// Input OOB authentication is used
    case input      = 3
}

/// Protocol for Provisioning Authentication Types
public protocol ProvisioningAuthentication {

    /// Provisioning Authentication Method
    var method: ProvisioningAuthenticationMethod { get }

    /// Encodes Provisioning Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    func encode() throws -> Data
}

/// Provisioning Authentication Method None
///
/// No OOB authentication is used
public struct ProvisioningAuthenticationMethodNone: ProvisioningAuthentication {

    /// Provisioning Authentication Method
    private(set) public var method: ProvisioningAuthenticationMethod

    /// Create ProvisioningAuthentication
    public init() {
        self.method = .none
    }

    /// Encodes Provisioning Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(method.rawValue)
        msgData.append(0x00) /// Action
        msgData.append(0x00) /// Size

        return msgData
    }
}

/// Provisioning Authentication Method Static
///
/// Static OOB authentication is used
public struct ProvisioningAuthenticationMethodStatic: ProvisioningAuthentication {

    /// Provisioning Authentication Method
    private(set) public var method: ProvisioningAuthenticationMethod

    /// Create ProvisioningAuthentication
    public init() {
        self.method = .static
    }

    /// Encodes Provisioning Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(method.rawValue)
        msgData.append(0x00) /// Action
        msgData.append(0x00) /// Size

        return msgData
    }
}

/// Provisioning Authentication Method Output
///
/// Output OOB authentication is used
public struct ProvisioningAuthenticationMethodOutput: ProvisioningAuthentication {

    /// Output Actions
    public enum Action: UInt8 {
        /// Blink
        case blink          = 0
        /// Beep
        case beep           = 1
        /// Vibrate
        case vibrate        = 2
        /// Output Numeric
        case numeric        = 3
        /// Output Alphanumeric
        case alphanumeric   = 4
    }

    /// Provisioning Authentication Method
    private(set) public var method: ProvisioningAuthenticationMethod

    /// Output Action
    private(set) public var action: Action

    /// Output Action Size
    ///
    /// The Output OOB Size in characters to be used
    private(set) public var size: ProvisioningAuthenticationSize

    /// Create ProvisioningAuthentication
    ///
    /// - Parameters:
    ///   - action: Output Action
    ///   - size: Output Size
    public init(action: Action, size: ProvisioningAuthenticationSize) {
        self.method = .output
        self.action = action
        self.size = size
    }

    /// Encodes Provisioning Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(method.rawValue)
        msgData.append(action.rawValue) /// Action

        guard size.rawValue <= 8 else {
            throw BluetoothMessageProtocolError(.encodeError(msg: "Size must be 8 or less"))
        }

        msgData.append(size.rawValue) /// Size..

        return msgData
    }
}

/// Provisioning Authentication Method Input
///
/// Input OOB authentication is used
public struct ProvisioningAuthenticationMethodInput: ProvisioningAuthentication {

    /// Output Actions
    public enum Action: UInt8 {
        /// Push
        case push           = 0
        /// Twist
        case twist          = 1
        /// Input Numeric
        case numeric        = 2
        /// Input Alphanumeric
        case alphanumeric   = 3
    }

    /// Provisioning Authentication Method
    private(set) public var method: ProvisioningAuthenticationMethod

    /// Output Action
    private(set) public var action: Action

    /// Input Action Size
    ///
    /// The Input OOB Size in characters to be used
    private(set) public var size: ProvisioningAuthenticationSize

    /// Create ProvisioningAuthentication
    ///
    /// - Parameters:
    ///   - action: Input Action
    ///   - size: Input Size
    public init(action: Action, size: ProvisioningAuthenticationSize) {
        self.method = .input
        self.action = action
        self.size = size
    }

    /// Encodes Provisioning Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data
    /// - Throws: BluetoothMessageProtocolError
    public func encode() throws -> Data {
        var msgData = Data()

        msgData.append(method.rawValue)
        msgData.append(action.rawValue) /// Action

        guard size.rawValue <= 8 else {
            throw BluetoothMessageProtocolError(.encodeError(msg: "Size must be 8 or less"))
        }

        msgData.append(size.rawValue) /// Size..

        return msgData
    }
}
