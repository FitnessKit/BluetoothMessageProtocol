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
public struct BatteryPowerState {

    public enum StateSupport: UInt8 {
        case unknown        = 0
        case notSupported   = 1
        case notPresent     = 2
        case present        = 3
    }

    public enum DischargeStatus: UInt8 {
        case unknown        = 0
        case notSupported   = 1
        case notDischarging = 2
        case discharging    = 3
    }

    public enum ChargingStatus: UInt8 {
        case unknown        = 0
        case notChargeable  = 1
        case notCharging    = 2
        case charging       = 3
    }

    public enum Level: UInt8 {
        case unknown        = 0
        case notSupported   = 1
        case goodLevel      = 2
        case criticallyLow  = 3
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


    public var rawValue: UInt8 {
        var value: UInt8 = stateInfo.rawValue
        value |= dischargeInfo.rawValue << 2
        value |= chargeInfo.rawValue << 4
        value |= batteryLevel.rawValue << 6

        return UInt8(value)
    }

    public init(_ value: UInt8) {
        self.stateInfo = StateSupport(rawValue: (value & 0x3)) ?? .unknown
        self.dischargeInfo = DischargeStatus(rawValue: (value & 0xC) >> 2) ?? .unknown
        self.chargeInfo = ChargingStatus(rawValue: (value & 0x30) >> 4) ?? .unknown
        self.batteryLevel = Level(rawValue: (value & 0xC0) >> 6) ?? .unknown
    }

    public init(stateInfo: StateSupport, dischargeInfo: DischargeStatus, chargeInfo: ChargingStatus, batteryLevel: Level) {
        self.stateInfo = stateInfo
        self.dischargeInfo = dischargeInfo
        self.chargeInfo = chargeInfo
        self.batteryLevel = batteryLevel
    }
}
