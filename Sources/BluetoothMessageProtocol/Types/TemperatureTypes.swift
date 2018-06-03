//
//  TemperatureTypes.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/26/17.
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

/// Bluetooth Temperature Types
///
/// These Temperature Type values correspond to the Temperature Type descriptions used in ISO/IEEE 11073-10408-2008
public enum TemperatureType: UInt8 {
    /// Unknown
    case unknown            = 0
    /// Armpit
    case armpit             = 1
    /// Body (general)
    case bodyGeneral        = 2
    /// Ear (usually ear lobe)
    case ear                = 3
    /// Finger
    case finger             = 4
    /// Gastro-intestinal Tract
    case gastroIntestinal   = 5
    /// Mouth
    case mouth              = 6
    /// Rectum
    case rectum             = 7
    /// Toe
    case toe                = 8
    /// Tympanum (ear drum)
    case tympanum           = 9

    /// String value for Temperature Type
    var stringValue: String {

        switch self {
        case .armpit:
            return "Armpit"
        case .bodyGeneral:
            return "Body (general)"
        case .ear:
            return "Ear (usually ear lobe)"
        case .finger:
            return "Finger"
        case .gastroIntestinal:
            return "Gastro-intestinal Tract"
        case .mouth:
            return "Mouth"
        case .rectum:
            return "Rectum"
        case .toe:
            return "Toe"
        case .tympanum:
            return "Tympanum (ear drum)"
        default:
            return "Unknown"
        }
    }
}
