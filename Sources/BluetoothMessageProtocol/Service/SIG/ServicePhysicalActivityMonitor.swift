//
//  ServicePhysicalActivityMonitor.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/5/21.
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

/// BLE Physical Activity Monitor Service
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServicePhysicalActivityMonitor: Service {

    /// Service Name
    public static var name: String {
        return "Physical Activity Monitor"
    }

    /// Service UUID
    public static var uuidString: String {
        return "183E"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "org.bluetooth.service.physical_activity_monitor"
    }

    /// Creates Physical Activity Monitor Service
    public init() {
        super.init(name: ServicePhysicalActivityMonitor.name,
                   uuidString: ServicePhysicalActivityMonitor.uuidString,
                   uniformIdentifier: ServicePhysicalActivityMonitor.uniformIdentifier
        )
    }
}
