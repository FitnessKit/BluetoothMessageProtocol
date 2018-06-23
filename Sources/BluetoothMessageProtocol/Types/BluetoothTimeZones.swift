//
//  BluetoothTimeZones.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/4/17.
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

/// Bluetooth Timezones
@available(swift 4.0)
public enum BluetoothTimeZone: Int8, Codable {
    /// Unknown
    case unknown            = -128
    /// UTC-12:00
    case utcMinus12         = -48
    /// UTC-11:00
    case utcMinus11         = -44
    /// UTC-10:00
    case utcMinus10         = -40
    /// UTC-9:30
    case utcMinus930        = -38
    /// UTC-9:00
    case utcMinus9          = -36
    /// UTC-8:00
    case utcMinus8          = -32
    /// UTC-7:00
    case utcMinus7          = -28
    /// UTC-6:00
    case utcMinus6          = -24
    /// UTC-5:00
    case utcMinus5          = -20
    /// UTC-4:30
    case utcMinus430        = -18
    /// UTC-4:00
    case utcMinus4          = -16
    /// UTC-3:30
    case utcMinus330        = -14
    /// UTC-3:00
    case utcMinus3          = -12
    /// UTC-2:00
    case utcMinus2          = -8
    /// UTC-1:00
    case utcMinus1          = -4
    /// UTC+0:00
    case utc                = 0
    /// UTC+1:00
    case utcPlus1           = 4
    /// UTC+2:00
    case utcPlus2           = 8
    /// UTC+3:00
    case utcPlus3           = 12
    /// UTC+3:30
    case utcPlus330         = 14
    /// UTC+4:00
    case utcPlus4           = 16
    /// UTC+4:30
    case utcPlus430         = 18
    /// UTC+5:00
    case utcPlus5           = 20
    /// UTC+5:30
    case utcPlus530         = 22
    /// UTC+5:45
    case utcPlus545         = 23
    /// UTC+6:00
    case utcPlus6           = 24
    /// UTC+6:30
    case utcPlus630         = 26
    /// UTC+7:00
    case utcPlus7           = 28
    /// UTC+8:00
    case utcPlus8           = 32
    /// UTC+8:45
    case utcPlus845         = 35
    /// UTC+9:00
    case utcPlus9           = 36
    /// UTC+9:30
    case utcPlus930         = 38
    /// UTC+10:00
    case utcPlus10          = 40
    /// UTC+10:30
    case utcPlus1030        = 42
    /// UTC+11:00
    case utcPlus11          = 44
    /// UTC+11:30
    case utcPlus1130        = 46
    /// UTC+12:00
    case utcPlus12          = 48
    /// UTC+12:45
    case utcPlus1245        = 51
    /// UTC+13:00
    case utcPlus13          = 52
    /// UTC+13:15
    case utcPlus1315        = 53
    /// UTC+13:30
    case utcPlus1330        = 54
    /// UTC+13:45
    case utcPlus1345        = 55
    /// UTC+14:00
    case utcPlus14          = 56
}

extension BluetoothTimeZone {

    /// String Value for the Enum
    public var description: String {
        return String(describing: self)
    }
}
