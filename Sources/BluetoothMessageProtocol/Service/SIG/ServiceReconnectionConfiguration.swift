//
//  ServiceReconnectionConfiguration.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 2/20/18.
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

/// BLE Reconnection Configuration Service
///
/// This service enables the control of certain communication parameters of
/// a Bluetooth Low Energy peripheral device.
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceReconnectionConfiguration: Service {

    /// Service Name
    public static var name: String {
        return "Reconnection Configuration"
    }

    /// Service UUID
    public static var uuidString: String {
        return "0x1829"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "org.bluetooth.service.reconnection_configuration"
    }

    /// Creates Weight Scale Service
    public init() {
        super.init(name: ServiceReconnectionConfiguration.name,
                   uuidString: ServiceReconnectionConfiguration.uuidString,
                   uniformIdentifier: ServiceReconnectionConfiguration.uniformIdentifier
        )
    }
}
