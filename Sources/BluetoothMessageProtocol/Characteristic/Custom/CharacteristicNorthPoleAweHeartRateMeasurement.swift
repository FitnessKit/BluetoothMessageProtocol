//
//  CharacteristicNorthPoleAweHeartRateMeasurement.swift
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

/// BLE AWE Heart Rate Measurement Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicNorthPoleAweHeartRateMeasurement: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "AWE Heart Rate Meassurement" }
    
    /// Characteristic UUID
    public static var uuidString: String { "4B486401-6E6F-7274-6870-6F6C65656E67" }
    
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
    public init(contactStatus: HeartRateContactStatus, heartRate: UInt8, energyExpended: Measurement<UnitEnergy>? = nil, rrIntervals: [Measurement<UnitDuration>]? = nil) {
        
        self.contactStatus = contactStatus
        
        self.heartRate = Measurement(value: Double(heartRate), unit: UnitCadence.beatsPerMinute)
        
        self.energyExpended = energyExpended
        self.rrIntervals = rrIntervals
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        /// Data from the AWE Heart Rate Measurement is not Notified or read.
        /// We don't need to ever decode it
        return.failure(BluetoothDecodeError.notSupported)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        let energyPresent = self.energyExpended == nil ? false : true
        
        // For now just not send RR Values.. Since they are not used
        let flags = HeartRateMeasurementFlags.init(valueFormat: .uint8,
                                                   contactStatus: self.contactStatus,
                                                   isEnergyExpendedPresent: energyPresent,
                                                   isRRIntervalPresent: false)
        
        msgData.append(flags.rawValue)
        msgData.append(UInt8(heartRate.value))
        
        if energyPresent {
            if let energyValue = energyExpended {
                let energy = energyValue.converted(to: UnitEnergy.joules).value
                msgData.append(Data(from: UInt16(energy)))
            } else {
                // energy is present but we got no Data??
                msgData.append(Data(from: UInt16(0)))
            }
        }
        
        return.success(msgData)
    }
}

extension CharacteristicNorthPoleAweHeartRateMeasurement: Hashable {
    
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

extension CharacteristicNorthPoleAweHeartRateMeasurement: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicNorthPoleAweHeartRateMeasurement, rhs: CharacteristicNorthPoleAweHeartRateMeasurement) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.contactStatus == rhs.contactStatus)
            && (lhs.heartRate == rhs.heartRate)
            && (lhs.energyExpended == rhs.energyExpended)
            && (lhs.rrIntervals == rhs.rrIntervals)        
    }
}
