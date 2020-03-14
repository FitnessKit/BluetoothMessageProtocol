//
//  CharacteristicHeartRateMeasurement.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/5/17.
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

/// BLE Heart Rate Meassurement Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicHeartRateMeasurement: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Heart Rate Meassurement" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A37" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Contact status of sensor
    private(set) public var contactStatus: HeartRateContactStatus = .notSupported
    
    /// Heart Rate Value
    private(set) public var heartRate: Measurement<UnitCadence>
    
    /// Energy Expended
    private(set) public var energyExpended: Measurement<UnitEnergy>?
    
    /// RR-Interval
    private(set) public var rrIntervals: [Measurement<UnitDuration>]?
    
    /// Creates Heart Rate Meassurement Characteristic
    ///
    /// - Parameters:
    ///   - contactStatus: Contact status of sensor
    ///   - heartRate: Heart Rate Value
    ///   - energyExpended: Energy Expended
    ///   - rrIntervals: RR-Intervals
    public init(contactStatus: HeartRateContactStatus,
                heartRate: Measurement<UnitCadence>,
                energyExpended: Measurement<UnitEnergy>? = nil,
                rrIntervals: [Measurement<UnitDuration>]? = nil) {
        self.contactStatus = contactStatus
        self.heartRate = heartRate
        self.energyExpended = energyExpended
        self.rrIntervals = rrIntervals
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let flags = HeartRateMeasurementFlags(decoder.decodeUInt8(data))
        
        let contactStatus = flags.contact
        
        var heartRate: Measurement = Measurement(value: 0, unit: UnitCadence.beatsPerMinute)
        
        if flags.valueFormat == .uint16 {
            heartRate.value = Double(decoder.decodeUInt16(data))
        } else {
            heartRate.value = Double(decoder.decodeUInt8(data))
        }
        
        var energy: Measurement<UnitEnergy>? = nil
        
        if flags.isEnergyExpendedPresent {
            let expended = decoder.decodeUInt16(data)
            energy = Measurement(value: Double(expended), unit: UnitEnergy.kilojoules)
        }
        
        var rrIntervals: [Measurement<UnitDuration>]?
        
        //RR Intervals
        if flags.isRRIntervalPresent {
            
            var seconds = decoder.decodeUInt16(data)
            
            while seconds != 0 {
                let interval = Measurement(value: (Double(seconds) / 1024), unit: UnitDuration.seconds)
                
                if rrIntervals == nil {
                    rrIntervals = [Measurement<UnitDuration>]()
                }
                rrIntervals?.append(interval)
                
                seconds = decoder.decodeUInt16(data)
            }
        }
        
        let char = CharacteristicHeartRateMeasurement(contactStatus: contactStatus,
                                                      heartRate: heartRate,
                                                      energyExpended: energy,
                                                      rrIntervals: rrIntervals)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        /// Not Yet Supported
        return.failure(BluetoothEncodeError.notSupported)
    }
}

extension CharacteristicHeartRateMeasurement: Hashable {
    
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
        hasher.combine(contactStatus)
        hasher.combine(heartRate)
        hasher.combine(energyExpended)
        hasher.combine(rrIntervals)
    }
}

extension CharacteristicHeartRateMeasurement: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicHeartRateMeasurement, rhs: CharacteristicHeartRateMeasurement) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.contactStatus == rhs.contactStatus)
            && (lhs.heartRate == rhs.heartRate)
            && (lhs.energyExpended == rhs.energyExpended)
            && (lhs.rrIntervals == rhs.rrIntervals)
    }
}
