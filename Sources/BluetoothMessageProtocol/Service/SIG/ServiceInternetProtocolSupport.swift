//
//  ServiceInternetProtocolSupport.swift
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

/// BLE Internet Protocol Support Service
///
/// When in a GAP Discoverable Mode for an initial connection to a Router,
/// the Node will include the IP Support Service UUID 0x1820 in the Service
/// UUIDs AD type field of the advertising data. This enhances the user
/// experience as a Node may be identified by the Router before initiating
/// a connection and other data from a personal Continuous Glucose Monitoring
/// (CGM) sensor for use in consumer healthcare applications.
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceInternetProtocolSupport: Service {

    /// Service Name
    public static var name: String {
        return "Internet Protocol Support"
    }

    /// Service UUID
    public static var uuidString: String {
        return "1820"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "org.bluetooth.service.internet_protocol_support"
    }

    /// Creates Internet Protocol Support Service
    public init() {
        super.init(name: ServiceInternetProtocolSupport.name,
                   uuidString: ServiceInternetProtocolSupport.uuidString,
                   uniformIdentifier: ServiceInternetProtocolSupport.uniformIdentifier
        )
    }
}
