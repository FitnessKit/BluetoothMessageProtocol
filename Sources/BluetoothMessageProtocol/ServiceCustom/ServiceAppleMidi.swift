//
//  ServiceAppleMidi.swift
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

/// BLE Apple MIDI Service
///
/// The Apple MIDI Service is used to send and receive MIDI data.
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceAppleMidi: Service {

    /// Service Name
    public static var name: String {
        return "Apple MIDI"
    }

    /// Service UUID
    public static var uuidString: String {
        return "03B80E5A-EDE8-4B33-A751-6CE34EC4C700"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "com.apple.service.apple_midi"
    }

    /// Creates Apple MIDI Service
    public init() {
        super.init(name: ServiceAppleMidi.name,
                   uuidString: ServiceAppleMidi.uuidString,
                   uniformIdentifier: ServiceAppleMidi.uniformIdentifier
        )
    }
}
