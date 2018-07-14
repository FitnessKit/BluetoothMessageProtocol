//
//  ServiceNorthPoleAweHeartRate.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 1/14/18.
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

/// BLE North Pole AWE Heart Rate
///
/// The North Pole AWE Heart Rate exposes Heart Rate and Workout Information.
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceNorthPoleAweHeartRate: Service {

    /// Service Name
    public static var name: String {
        return "AWE Heart Rate"
    }

    /// Service UUID
    public static var uuidString: String {
        return "4B486400-6E6F-7274-6870-6F6C65656E67"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "com.npe-inc.service.awe_heart_rate"
    }

    /// Creates Battery Service
    public init() {
        super.init(name: ServiceNorthPoleAweHeartRate.name,
                   uuidString: ServiceNorthPoleAweHeartRate.uuidString,
                   uniformIdentifier: ServiceNorthPoleAweHeartRate.uniformIdentifier
        )
    }
}
