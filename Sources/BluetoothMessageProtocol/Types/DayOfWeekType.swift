//
//  DayOfWeekType.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 4/26/20.
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

/// Bluetooth Days of the Week
public enum DayOfWeek: UInt8 {
    /// Unknown
    case unknown        = 0
    /// Monday
    case monday         = 1
    /// Tuesday
    case tuesday        = 2
    /// Wednesday
    case wednesday      = 3
    /// Thursday
    case thursday       = 4
    /// Friday
    case friday         = 5
    /// Saturday
    case saturday       = 6
    /// Sunday
    case sunday         = 7

    /// Uses Current System Date to create DayOfWeek
    public static var fromCurrentDate: DayOfWeek {

        let comp = Calendar(identifier: .gregorian).dateComponents([.weekday], from: Date())

        return DayOfWeek(rawValue: UInt8(comp.weekday ?? 0)) ?? DayOfWeek.unknown
    }
}
