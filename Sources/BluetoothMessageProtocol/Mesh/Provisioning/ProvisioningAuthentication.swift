//
//  ProvisioningAuthentication.swift
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

/// Provisioning  Size
public enum ProvisioningSize {
    /// Prohibited / None
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

    /// Creates a ProvisioningSize
    ///
    /// - Parameter value: raw value
    /// - Returns: ProvisioningAuthenticationSize
    public static func create(_ value: UInt8) -> ProvisioningSize {
        if value == UInt8.min {
            return ProvisioningSize.prohibited
        } else {
            return ProvisioningSize.value(value)
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

extension ProvisioningAuthenticationMethod {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension ProvisioningAuthenticationMethod: Encodable {

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
        var container = encoder.container(keyedBy: TypeValueCodingKeys.self)

        /// Prefer the name of the type over a raw value
        try container.encode(self.rawValue, forKey: .value)
        try container.encode(self.description, forKey: .type)
    }
}

/// Protocol for Provisioning Authentication Types
public protocol ProvisioningAuthentication: BluetoothEncodable {

    /// Provisioning Authentication Method
    var method: ProvisioningAuthenticationMethod { get }
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
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(method.rawValue)
        msgData.append(0x00) /// Action
        msgData.append(0x00) /// Size

        return.success(msgData)
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
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(method.rawValue)
        msgData.append(0x00) /// Action
        msgData.append(0x00) /// Size

        return.success(msgData)
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
    private(set) public var size: ProvisioningSize

    /// Create ProvisioningAuthentication
    ///
    /// - Parameters:
    ///   - action: Output Action
    ///   - size: Output Size
    public init(action: Action, size: ProvisioningSize) {
        self.method = .output
        self.action = action
        self.size = size
    }

    /// Encodes Provisioning Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(method.rawValue)
        msgData.append(action.rawValue) /// Action

        guard size.rawValue <= 8 else {
            return.failure(BluetoothEncodeError.properySize("Size must be 8 or less."))
        }

        msgData.append(size.rawValue) /// Size..

        return.success(msgData)
    }
}

extension ProvisioningAuthenticationMethodOutput.Action {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension ProvisioningAuthenticationMethodOutput.Action: Encodable {

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
        var container = encoder.container(keyedBy: TypeValueCodingKeys.self)

        /// Prefer the name of the type over a raw value
        try container.encode(self.rawValue, forKey: .value)
        try container.encode(self.description, forKey: .type)
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
    private(set) public var size: ProvisioningSize

    /// Create ProvisioningAuthentication
    ///
    /// - Parameters:
    ///   - action: Input Action
    ///   - size: Input Size
    public init(action: Action, size: ProvisioningSize) {
        self.method = .input
        self.action = action
        self.size = size
    }

    /// Encodes Provisioning Protocol Data Unit into Data
    ///
    /// - Returns: Encoded Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        msgData.append(method.rawValue)
        msgData.append(action.rawValue) /// Action

        guard size.rawValue <= 8 else {
            return.failure(BluetoothEncodeError.properySize("Size must be 8 or less."))
        }

        msgData.append(size.rawValue) /// Size..

        return.success(msgData)
    }
}

extension ProvisioningAuthenticationMethodInput.Action {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension ProvisioningAuthenticationMethodInput.Action: Encodable {

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
        var container = encoder.container(keyedBy: TypeValueCodingKeys.self)

        /// Prefer the name of the type over a raw value
        try container.encode(self.rawValue, forKey: .value)
        try container.encode(self.description, forKey: .type)
    }
}
