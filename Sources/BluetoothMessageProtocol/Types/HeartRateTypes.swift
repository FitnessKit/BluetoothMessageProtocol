//
//  HeartRateTypes.swift
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


/// Contact Status of Heart Rate Sensor
public enum HeartRateContactStatus: UInt8 {
    /// Sensor Contact feature is not supported in the current connection
    case notSupported       = 0
    /// Sensor Contact feature is not supported in the current connection
    case stillNotSupportd   = 1
    /// Sensor Contact feature is supported, but contact is not detected
    case notDetected        = 2
    /// Sensor Contact feature is supported and contact is detected
    case detected           = 3

    /// String Value for Contact Status
    public var stringValue: String {

        switch self {
        case .notSupported, .stillNotSupportd:
            return "Sensor Contact feature is not supported"
        case .notDetected:
            return "Sensor Contact not detected"
        case .detected:
            return "Sensor Contact detected"
        }
    }
}
