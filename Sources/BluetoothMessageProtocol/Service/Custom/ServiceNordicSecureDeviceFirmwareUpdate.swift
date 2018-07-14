//
//  ServiceNordicSecureDeviceFirmwareUpdate.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/9/17.
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

/// BLE Nordic Secure Device Firmware Update Service
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceNordicSecureDeviceFirmwareUpdate: Service {

    /// Service Name
    public static var name: String {
        return "Nordic Secure Device Firmware Update"
    }

    /// Service UUID
    public static var uuidString: String {
        return "FE59"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "com.nordicsemi.service.secure_dfu"
    }

    /// Creates Nordic Secure Device Firmware Update Service
    public init() {
        super.init(name: ServiceNordicSecureDeviceFirmwareUpdate.name,
                   uuidString: ServiceNordicSecureDeviceFirmwareUpdate.uuidString,
                   uniformIdentifier: ServiceNordicSecureDeviceFirmwareUpdate.uniformIdentifier
        )
    }
}
