//
//  ServiceCyclingPower.swift
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

/// BLE Cycling Power Service
///
/// This service exposes power- and force-related data and optionally speed
/// and cadence-related data from a Cycling Power sensor intended for sports
/// and fitness applications.
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceCyclingPower: Service {

    /// Service Name
    public static var name: String {
        return "Cycling Power"
    }

    /// Service UUID
    public static var uuidString: String {
        return "1818"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "org.bluetooth.service.cycling_power"
    }

    /// Creates Cycling Power Service
    public init() {
        super.init(name: ServiceCyclingPower.name,
                   uuidString: ServiceCyclingPower.uuidString,
                   uniformIdentifier: ServiceCyclingPower.uniformIdentifier
        )
    }
}
