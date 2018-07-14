//
//  ServiceTransportDiscovery.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/2/17.
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

/// BLE Transport Discovery Service
///
/// This service enables a device using Bluetooth low energy wireless technology
/// to expose services that are available on a transport other than Bluetooth low
/// energy. When used together with a higher level specification (e.g., a
/// specification which references and makes use of TDS), the information provided
/// by this service can be used to facilitate discovery and utilization of BR/EDR
/// or transports not defined by the Bluetooth SIG such as those defined by the
/// Wi-Fi Alliance® or other organizations.
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceTransportDiscovery: Service {

    /// Service Name
    public static var name: String {
        return "Transport Discovery"
    }

    /// Service UUID
    public static var uuidString: String {
        return "1824"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "org.bluetooth.service.transport_discovery"
    }

    /// Creates Transport Discovery Service
    public init() {
        super.init(name: ServiceTransportDiscovery.name,
                   uuidString: ServiceTransportDiscovery.uuidString,
                   uniformIdentifier: ServiceTransportDiscovery.uniformIdentifier
        )
    }
}
