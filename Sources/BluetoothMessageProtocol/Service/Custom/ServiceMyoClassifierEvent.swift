//
//  ServiceMyoClassifierEvent.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/16/17.
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

/// BLE Myo Armband Classifier Event Service
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceMyoClassifierEvent: Service {

    /// Service Name
    public static var name: String {
        return "Myo Armband Classifier Event"
    }

    /// Service UUID
    public static var uuidString: String {
        return "D5060003-A904-DEB9-4748-2C7F4A124842"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "com.myo.service.armband_classifier_event"
    }

    /// Creates Myo Armband Classifier Event Service
    public init() {
        super.init(name: ServiceMyoClassifierEvent.name,
                   uuidString: ServiceMyoClassifierEvent.uuidString,
                   uniformIdentifier: ServiceMyoClassifierEvent.uniformIdentifier
        )
    }
}
