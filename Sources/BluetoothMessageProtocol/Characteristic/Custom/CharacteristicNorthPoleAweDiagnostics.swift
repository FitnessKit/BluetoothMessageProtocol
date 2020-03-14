//
//  CharacteristicNorthPoleAweDiagnostics.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 12/19/17.
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
import DataDecoder
import FitnessUnits

/// BLE AWE Diagnostic Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicNorthPoleAweDiagnostics: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "AWE Diagnostic" }
    
    /// Characteristic UUID
    public static var uuidString: String { "4B486501-6E6F-7274-6870-6F6C65656E67" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Battery Swaps
    private(set) public var batterySwaps: UInt16
    
    /// Date Programmed
    private(set) public var dateProgrammed: Date
    
    /// Total Operating Time
    private(set) public var totalOperatingtime: UInt32
    
    /// Advertising Time
    ///
    /// Time spent in a BLE Advertising
    private(set) public var advertisingTime: Measurement<UnitDuration>
    
    /// Connected Time
    ///
    /// Time spent in a BLE Connection
    private(set) public var connectedTime: Measurement<UnitDuration>
    
    /// Successful Firmware Update Events
    ///
    /// Number of times Firmware Update was requested and successul
    private(set) public var succesfulFirmwareUpdateEvents: UInt8
    
    /// Failed Firmware Update Events
    ///
    /// Number of times Firmware Update was requested and failed
    private(set) public var failedFirmwareUpdateEvents: UInt8
    
    /// Last Battery Level
    ///
    /// The battry level before the last device shutdown
    private(set) public var lastBatteryLevel: Measurement<UnitPercent>
    
    /// Creates AWE Diagnostic Characteristic
    ///
    /// - Parameters:
    ///   - batterySwaps: Number of Battery Swaps
    ///   - totalOperatingtime: Total Operating Time
    ///   - advertisingTime: Time spent in a BLE Advertising
    ///   - connectedTime: Time spent in a BLE Connection
    public init(batterySwaps: UInt16,
                dateProgrammed: Date,
                totalOperatingtime: UInt32,
                advertisingTime: Measurement<UnitDuration>,
                connectedTime: Measurement<UnitDuration>,
                succesfulFirmwareUpdateEvents: UInt8,
                failedFirmwareUpdateEvents: UInt8,
                lastBatteryLevel: Measurement<UnitPercent>) {
        
        self.batterySwaps = batterySwaps
        self.dateProgrammed = dateProgrammed
        self.totalOperatingtime = totalOperatingtime
        self.advertisingTime = advertisingTime
        self.connectedTime = connectedTime
        self.succesfulFirmwareUpdateEvents = succesfulFirmwareUpdateEvents
        self.failedFirmwareUpdateEvents = failedFirmwareUpdateEvents
        self.lastBatteryLevel = lastBatteryLevel
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let swaps = decoder.decodeUInt16(data)
        
        let programDate = Date(timeIntervalSince1970: TimeInterval(decoder.decodeUInt32(data)))
        let totalOpTime = decoder.decodeUInt32(data)
        
        var advertTime: Measurement<UnitDuration>
        let advertValue = Double(decoder.decodeUInt32(data))
        advertTime = Measurement(value: advertValue, unit: UnitDuration.seconds)
        
        var connectTime: Measurement<UnitDuration>
        let connectValue = Double(decoder.decodeUInt32(data))
        connectTime = Measurement(value: connectValue, unit: UnitDuration.seconds)
        
        let successFW = decoder.decodeUInt8(data)
        let failedFW = decoder.decodeUInt8(data)
        
        let percent = Double(decoder.decodeUInt8(data))
        let battLvl: Measurement = Measurement(value: percent, unit: UnitPercent.percent)
        
        let char = CharacteristicNorthPoleAweDiagnostics(batterySwaps: swaps,
                                                         dateProgrammed: programDate,
                                                         totalOperatingtime: totalOpTime,
                                                         advertisingTime: advertTime,
                                                         connectedTime: connectTime,
                                                         succesfulFirmwareUpdateEvents: successFW,
                                                         failedFirmwareUpdateEvents: failedFW,
                                                         lastBatteryLevel: battLvl)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        /// not writeable
        return.failure(BluetoothEncodeError.notSupported)
    }
}

extension CharacteristicNorthPoleAweDiagnostics: Hashable {
    
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuidString)
        hasher.combine(batterySwaps)
        hasher.combine(dateProgrammed)
        hasher.combine(totalOperatingtime)
        hasher.combine(advertisingTime)
        hasher.combine(connectedTime)
        hasher.combine(succesfulFirmwareUpdateEvents)
        hasher.combine(failedFirmwareUpdateEvents)
        hasher.combine(lastBatteryLevel)
    }
}

extension CharacteristicNorthPoleAweDiagnostics: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicNorthPoleAweDiagnostics, rhs: CharacteristicNorthPoleAweDiagnostics) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.batterySwaps == rhs.batterySwaps)
            && (lhs.dateProgrammed == rhs.dateProgrammed)
            && (lhs.totalOperatingtime == rhs.totalOperatingtime)
            && (lhs.advertisingTime == rhs.advertisingTime)
            && (lhs.connectedTime == rhs.connectedTime)
            && (lhs.succesfulFirmwareUpdateEvents == rhs.succesfulFirmwareUpdateEvents)
            && (lhs.failedFirmwareUpdateEvents == rhs.failedFirmwareUpdateEvents)
            && (lhs.lastBatteryLevel == rhs.lastBatteryLevel)
        
    }
}
