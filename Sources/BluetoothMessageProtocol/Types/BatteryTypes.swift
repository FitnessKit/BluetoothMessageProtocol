//
//  BatteryTypes.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/12/17.
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

/// Battery Power State Information
@available(swift 4.0)
public struct BatteryPowerState: Codable, Hashable {

    /// If Power State is supported
    public enum StateSupport: UInt8, Codable {
        /// Unknown
        case unknown        = 0
        /// State not supported
        case notSupported   = 1
        /// State not present
        case notPresent     = 2
        /// State present
        case present        = 3

        /// String Value for the Enum
        public var description: String {
            return String(describing: self)
        }
    }

    /// Provides Discharge Status
    public enum DischargeStatus: UInt8, Codable {
        /// Unknown
        case unknown        = 0
        /// Not supported
        case notSupported   = 1
        /// Battery not discharging
        case notDischarging = 2
        /// Battery is discharging
        case discharging    = 3

        /// String Value for the Enum
        public var description: String {
            return String(describing: self)
        }
    }

    /// Charging Status
    public enum ChargingStatus: UInt8, Codable {
        /// Unknown
        case unknown        = 0
        /// Not chargeable
        case notChargeable  = 1
        /// Battery not charging
        case notCharging    = 2
        /// Battery is charging
        case charging       = 3

        /// String Value for the Enum
        public var description: String {
            return String(describing: self)
        }
    }

    /// Battery Level
    public enum Level: UInt8, Codable {
        /// Unknown
        case unknown        = 0
        /// Battery level not supported
        case notSupported   = 1
        /// Battery level good
        case goodLevel      = 2
        /// Battery level critically low
        case criticallyLow  = 3

        /// String Value for the Enum
        public var description: String {
            return String(describing: self)
        }
    }

    /// State Information
    ///
    /// If State Information is present or not
    private(set) public var stateInfo: StateSupport

    /// Discharge Status
    private(set) public var dischargeInfo: DischargeStatus

    /// Charge Status
    ///
    /// Describes both if the devices is Chargeable and if Charging
    private(set) public var chargeInfo: ChargingStatus

    /// Level of the Battery
    private(set) public var batteryLevel: Level

    /// Raw Value
    public var rawValue: UInt8 {
        var value: UInt8 = stateInfo.rawValue
        value |= dischargeInfo.rawValue << 2
        value |= chargeInfo.rawValue << 4
        value |= batteryLevel.rawValue << 6

        return UInt8(value)
    }

    /// Creates a BatteryPowerState Object
    ///
    /// - Parameter value: Raw Data
    public init(_ value: UInt8) {
        self.stateInfo = StateSupport(rawValue: (value & 0x3)) ?? .unknown
        self.dischargeInfo = DischargeStatus(rawValue: (value & 0xC) >> 2) ?? .unknown
        self.chargeInfo = ChargingStatus(rawValue: (value & 0x30) >> 4) ?? .unknown
        self.batteryLevel = Level(rawValue: (value & 0xC0) >> 6) ?? .unknown
    }

    /// Creates a BatteryPowerState Object
    ///
    /// - Parameter stateInfo: StateSupport enum
    /// - Parameter dischargeInfo: DischargeStatus eum
    /// - Parameter chargeInfo: ChargingStatus enum
    /// - Parameter batteryLevel: Level enum
    public init(stateInfo: StateSupport, dischargeInfo: DischargeStatus, chargeInfo: ChargingStatus, batteryLevel: Level) {
        self.stateInfo = stateInfo
        self.dischargeInfo = dischargeInfo
        self.chargeInfo = chargeInfo
        self.batteryLevel = batteryLevel
    }
}
