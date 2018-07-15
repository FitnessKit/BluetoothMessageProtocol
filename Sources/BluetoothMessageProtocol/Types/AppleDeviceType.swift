//
//  AppleDeviceType.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 12/24/17.
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

/// Apple Manufactuer Specific Data Types
@available(swift 4.0)
public enum AppleDeviceType: UInt8, Codable {
    /// iBeacon
    case iBeaccon               = 2
    /// AirDrop
    case airDrop                = 5
    /// HAP BLE Regular Advertisement Format
    case hap                    = 6
    /// AirPods
    case airPod                 = 7
    /// AirPlay Destination
    case airPlayDestination     = 9
    /// AirPlay Source
    case airPlaySource          = 10
    /// HAP BLE Encrypted Notification Advertisement
    case hapEncrypted           = 11
    /// Handoff
    case handoff                = 12
    /// Nearby
    case nearby                 = 16
}

extension AppleDeviceType {

    /// String Value for the Enum
    public var description: String {
        return String(describing: self)
    }
}
