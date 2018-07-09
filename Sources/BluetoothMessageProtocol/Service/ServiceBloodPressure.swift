//
//  ServiceBloodPressure.swift
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

/// BLE Blood Pressure Service
///
/// This service exposes blood pressure and other data from a blood pressure
/// monitor intended for healthcare applications.
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceBloodPressure: Service {

    /// Service Name
    public static var name: String {
        return "Blood Pressure"
    }

    /// Service UUID
    public static var uuidString: String {
        return "1810"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "org.bluetooth.service.blood_pressure"
    }

    /// Creates Blood Pressure Service
    public init() {
        super.init(name: ServiceBloodPressure.name,
                   uuidString: ServiceBloodPressure.uuidString,
                   uniformIdentifier: ServiceBloodPressure.uniformIdentifier
        )
    }
}
