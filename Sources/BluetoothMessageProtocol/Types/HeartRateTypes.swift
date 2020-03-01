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

internal struct HeartRateMeasurementFlags {
    
    public enum MeasurementFormat {
        /// Value is UInt16
        ///
        /// Units: beats per minute (bpm)
        case uint16
        /// Value is UInt8
        ///
        /// Units: beats per minute (bpm)
        case uint8
    }
    
    /// Heart Rate Value Format
    private(set) public var valueFormat: MeasurementFormat
    /// Sensor Contact Status
    private(set) public var contact: HeartRateContactStatus
    /// Energy Expended field is present
    private(set) public var isEnergyExpendedPresent: Bool
    /// One or more RR-Interval values are present
    private(set) public var isRRIntervalPresent: Bool

    /// Rawvalue
    public var rawValue: UInt8 {
        var value: UInt8 = UInt8(valueFormat == .uint16 ? 1 : 0)
        value |= contact.rawValue << 1
        value |=  UInt8(isEnergyExpendedPresent ? 1 : 0) << 3
        value |=  UInt8(isRRIntervalPresent ? 1 : 0) << 4

        return UInt8(value)
    }

    /// Creates Flags Struct
    ///
    /// - Parameter value: UInt8 Flag Data
    public init(_ value: UInt8) {

        /// Check the Format of the Data
        if (value & 0x01).boolValue {
            valueFormat = .uint16
        } else {
            valueFormat = .uint8
        }

        let contactStatusBits = (value & 0x06) >> 1

        contact = HeartRateContactStatus(rawValue: contactStatusBits) ?? .notSupported

        isEnergyExpendedPresent = (value & 0x08 == 0x08)

        isRRIntervalPresent = (value & 0x10 == 0x10)

    }

    /// Creates Flags Structs
    ///
    /// - Parameters:
    ///   - valueFormat: HR Format
    ///   - contactStatus: Contact Status
    ///   - isEnergyExpendedPresent: Energy Expended Present
    ///   - isRRIntervalPresent: One or more RR Values Present
    public init(valueFormat: MeasurementFormat, contactStatus: HeartRateContactStatus, isEnergyExpendedPresent: Bool, isRRIntervalPresent: Bool) {
        self.valueFormat = valueFormat
        self.contact = contactStatus
        self.isEnergyExpendedPresent = isEnergyExpendedPresent
        self.isRRIntervalPresent = isRRIntervalPresent
    }
}
