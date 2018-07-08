//
//  ServiceHapStatelessProgrammableSwitch.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/8/18.
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

/// HAP-BLE HomeKit Stateless Programmable Switch Service
///
/// This service describes a stateless programmable switch.
///
/// The following rules apply to a stateless programmable switch accessory:
/// - Each physical switch on the accessory must be represented by a unique
///   instance of this service.
/// - If there are multiple instances of this service on the accessory, they
///   must be linked to a Service Label.
/// - If there are multiple instances of this service on the accessory, Service
///   Label Index is a required characteristic.
/// - Service Label Index value for each instance of this service linked to the
///   same Service Label must be unique.
/// - The User visible label on the physical accessory should match the Service
///   Label Namespace described by the accessory
/// - If there is only one instance of this service on the accessory, Service Label
///   is not required and consequently Service Label Index must not be present
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceHapStatelessProgrammableSwitch: Service {

    /// Service Name
    public static var name: String {
        return "Stateless Programmable Switch"
    }

    /// Service UUID
    public static var uuidString: String {
        return "00000089-0000-1000-8000-0026BB765291"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "public.hap.service.stateless-programmable-switch"
    }

    /// Creates Service
    public init() {
        super.init(name: ServiceHapStatelessProgrammableSwitch.name,
                   uuidString: ServiceHapStatelessProgrammableSwitch.uuidString,
                   uniformIdentifier: ServiceHapStatelessProgrammableSwitch.uniformIdentifier
        )
    }
}
