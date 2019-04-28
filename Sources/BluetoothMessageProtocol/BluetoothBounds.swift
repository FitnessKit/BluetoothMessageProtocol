//
//  BluetoothBounds.swift
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

/// Bounds for a Valid Bluetooth Year
internal let kBluetoothYearBounds = ClosedRange(uncheckedBounds: (lower: 1582, upper: 9999))

/// Bounds for Valid Bluetooth Day of Month
internal let kBluetoothDayOfMonthBounds = ClosedRange(uncheckedBounds: (lower: 1, upper: 31))

/// Bounds for Magnetic Declination
internal let kBluetoothMagneticDeclinationBounds = ClosedRange(uncheckedBounds: (lower: 0, upper: 359.99))

/// Bounds for Measurement Interval
internal let kBluetoothMeasurementIntervalBounds = ClosedRange(uncheckedBounds: (lower: 1, upper: 65535))

/// Bounds for Net Alert Text String
internal let kNewAlertTextStringBounds = ClosedRange(uncheckedBounds: (lower: 1, upper: 18))

/// Bounds for Object Name String
internal let kObjectNameStringBounds = ClosedRange(uncheckedBounds: (lower: 0, upper: 120))

/// Bounds for Tx Power Level
internal let kTxPowerLevelBounds = ClosedRange(uncheckedBounds: (lower: -100, upper: 20))

/// Bounds for Max VO2
internal let kMaxVO2Bounds = ClosedRange(uncheckedBounds: (lower: 0, upper: 255))

/// Bounds for Battery Percentage
internal let kBatteryBounds = ClosedRange(uncheckedBounds: (lower: 0.0, upper: 100.0))
