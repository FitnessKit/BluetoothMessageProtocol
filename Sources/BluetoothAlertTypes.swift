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
public enum AlertCategory: UInt8 {
    case simpleAlert        = 0
    case email              = 1
    case news               = 2
    case call               = 3
    case missedCall         = 4
    case textMessage        = 5
    case voiceMail          = 6
    case schedule           = 7
    case highPrioritized    = 8
    case instantMessage     = 9

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

