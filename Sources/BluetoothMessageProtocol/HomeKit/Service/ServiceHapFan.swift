//
//  ServiceHapFan.swift
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

/// HAP-BLE HomeKit Fan Service
///
/// This service describes a fan.
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceHapFan: Service {

    /// Service Name
    public static var name: String {
        return "Fan"
    }

    /// Service UUID
    public static var uuidString: String {
        return "00000040-0000-1000-8000-0026BB765291"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "public.hap.service.fan"
    }

    /// Creates Service
    public init() {
        super.init(name: ServiceHapFan.name,
                   uuidString: ServiceHapFan.uuidString,
                   uniformIdentifier: ServiceHapFan.uniformIdentifier
        )
    }
}

/// HAP-BLE HomeKit Fan Version 2 Service
///
/// This service describes a fan.
///
/// If the fan service is included in air purifiers accessories, Current Fan State
/// and Target Fan State are required characteristics
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceHapAdvancedFan: Service {

    /// Service Name
    public static var name: String {
        return "Fan"
    }

    /// Service UUID
    public static var uuidString: String {
        return "000000B7-0000-1000-8000-0026BB765291"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "public.hap.service.fanv2"
    }

    /// Creates Service
    public init() {
        super.init(name: ServiceHapAdvancedFan.name,
                   uuidString: ServiceHapAdvancedFan.uuidString,
                   uniformIdentifier: ServiceHapAdvancedFan.uniformIdentifier
        )
    }
}
