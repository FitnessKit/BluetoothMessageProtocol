//
//  BluetoothAlertTypes.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/20/17.
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

/// Bluetooth Alert Categories
@available(swift 4.0)
public enum AlertCategory: UInt8, Codable {
    /// Simple Alert: General text alert or non-text alert
    case simpleAlert        = 0
    /// Email: Alert when Email messages arrives
    case email              = 1
    /// News: News feeds such as RSS, Atom
    case news               = 2
    /// Call: Incoming call
    case call               = 3
    /// Missed call: Missed Call
    case missedCall         = 4
    /// SMS/MMS: SMS/MMS message arrives
    case textMessage        = 5
    /// Voice mail: Voice mail
    case voiceMail          = 6
    /// Schedule: Alert occurred on calendar, planner
    case schedule           = 7
    /// High Prioritized Alert: Alert that should be handled as high priority
    case highPrioritized    = 8
    /// Instant Message: Alert for incoming instant messages
    case instantMessage     = 9

    /// Provides a string value for the alert category
    var stringValue: String {

        switch self {
        case .simpleAlert:
            return "Simple Alert"
        case .email:
            return "Email"
        case .news:
            return "News"
        case .call:
            return "Call"
        case .missedCall:
            return "Missed Call"
        case .textMessage:
            return "SMS/MMS"
        case .voiceMail:
            return "Voice Mail"
        case .schedule:
            return "Calendar Alert"
        case .highPrioritized:
            return "High Priority"
        case .instantMessage:
            return "Instant Message"
        }
    }
}

extension AlertCategory {

    /// String Value for the Enum
    public var description: String {
        return String(describing: self)
    }
}
