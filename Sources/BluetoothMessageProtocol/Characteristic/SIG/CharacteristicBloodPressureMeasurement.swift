//
//  CharacteristicBloodPressureMeasurement.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/13/17.
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

/// BLE Blood Pressure Measurement Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicBloodPressureMeasurement: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Blood Pressure Measurement" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A35" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Systolic Blood Pressure
    private(set) public var systolic: Measurement<UnitPressure>
    
    /// Diastolic Blood Pressure
    private(set) public var diastolic: Measurement<UnitPressure>
    
    /// Mean Arterial Pressure
    private(set) public var meanArterial: Measurement<UnitPressure>
    
    /// Timestamp
    private(set) public var timestamp: DateTime?
    
    /// Pulse Rate
    private(set) public var pulseRate: Measurement<UnitCadence>?
    
    /// User ID
    private(set) public var userID: User?
    
    /// Measurement Status
    private(set) public var status: BloodPressureMeasurementStatus?
    
    /// Creates Blood Pressure Measurement Characteristic
    ///
    /// - Parameters:
    ///   - systolic: Systolic Blood Pressure
    ///   - diastolic: Diastolic Blood Pressure
    ///   - meanArterial: Mean Arterial Pressure
    ///   - timestamp: Timestamp
    ///   - pulseRate: Pulse Rate
    ///   - userID: User ID
    public init(systolic: Measurement<UnitPressure>,
                diastolic: Measurement<UnitPressure>,
                meanArterial: Measurement<UnitPressure>,
                timestamp: DateTime?,
                pulseRate: Measurement<UnitCadence>?,
                userID: User?,
                status: BloodPressureMeasurementStatus?) {
        
        self.systolic = systolic
        self.diastolic = diastolic
        self.meanArterial = meanArterial
        self.timestamp = timestamp
        self.pulseRate = pulseRate
        self.userID = userID
        self.status = status
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let flags = BloodPressureFlags(rawValue: decoder.decodeUInt8(data))
        
        var systolic: Measurement<UnitPressure>
        let systolicV = Double(decoder.decodeSFloatValue(data))
        
        var diastolic: Measurement<UnitPressure>
        let diastolicV = Double(decoder.decodeSFloatValue(data))
        
        var meanArterial: Measurement<UnitPressure>
        let meanArterialV = Double(decoder.decodeSFloatValue(data))
        
        
        if flags.contains(.unitsIsKilopascals) {
            systolic = Measurement(value: systolicV, unit: UnitPressure.kilopascals)
            diastolic = Measurement(value: diastolicV, unit: UnitPressure.kilopascals)
            meanArterial = Measurement(value: meanArterialV, unit: UnitPressure.kilopascals)
        } else {
            systolic = Measurement(value: systolicV, unit: UnitPressure.millimetersOfMercury)
            diastolic = Measurement(value: diastolicV, unit: UnitPressure.millimetersOfMercury)
            meanArterial = Measurement(value: meanArterialV, unit: UnitPressure.millimetersOfMercury)
        }
        
        var timestamp: DateTime?
        if flags.contains(.timestampPresent) {
            timestamp = DateTime.decode(data, decoder: &decoder)
        }
        
        var pulseRate: Measurement<UnitCadence>?
        if flags.contains(.pulseRatePresent) {
            let pulse = Double(decoder.decodeSFloatValue(data))
            pulseRate = Measurement(value: pulse, unit: UnitCadence.beatsPerMinute)
        }
        
        var userID: User?
        if flags.contains(.userIDPresent) {
            userID = User.create(decoder.decodeUInt8(data))
        }
        
        var status: BloodPressureMeasurementStatus?
        if flags.contains(.measurementStatusPresent) {
            let statusValue = decoder.decodeUInt16(data)
            status = BloodPressureMeasurementStatus(rawValue: statusValue)
        }
        
        let char = CharacteristicBloodPressureMeasurement(systolic: systolic,
                                                          diastolic: diastolic,
                                                          meanArterial: meanArterial,
                                                          timestamp: timestamp,
                                                          pulseRate: pulseRate,
                                                          userID: userID,
                                                          status: status)
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

extension CharacteristicBloodPressureMeasurement: Hashable {
    
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
        hasher.combine(systolic)
        hasher.combine(diastolic)
        hasher.combine(meanArterial)
        hasher.combine(timestamp)
        hasher.combine(pulseRate)
        hasher.combine(userID)
        hasher.combine(status)
    }
}

extension CharacteristicBloodPressureMeasurement: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicBloodPressureMeasurement, rhs: CharacteristicBloodPressureMeasurement) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.systolic == rhs.systolic)
            && (lhs.diastolic == rhs.diastolic)
            && (lhs.meanArterial == rhs.meanArterial)
            && (lhs.timestamp == rhs.timestamp)
            && (lhs.pulseRate == rhs.pulseRate)
            && (lhs.userID == rhs.userID)
            && (lhs.status == rhs.status)
    }
}

internal extension CharacteristicBloodPressureMeasurement {
    
    /// Blood Pressure Flags
    struct BloodPressureFlags: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        /// Blood pressure for Systolic, Diastolic and MAP in units of kPa
        public static let unitsIsKilopascals        = BloodPressureFlags(rawValue: 1 << 0)
        /// Time Stamp present
        public static let timestampPresent          = BloodPressureFlags(rawValue: 1 << 1)
        /// Pulse Rate present
        public static let pulseRatePresent          = BloodPressureFlags(rawValue: 1 << 2)
        /// User ID present
        public static let userIDPresent             = BloodPressureFlags(rawValue: 1 << 3)
        /// Measurement Status present
        public static let measurementStatusPresent  = BloodPressureFlags(rawValue: 1 << 4)
    }
    
}
