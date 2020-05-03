//
//  CharacteristicIntermediateCuffPressure.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 5/3/20.
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

/// BLE Intermediate Cuff Pressure  Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicIntermediateCuffPressure: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Intermediate Cuff Pressure" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A36" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Cuff Pressure
    private(set) public var cuffPressure: Measurement<UnitPressure>
    
    /// Timestamp
    private(set) public var timestamp: DateTime?
    
    /// Pulse Rate
    private(set) public var pulseRate: Measurement<UnitCadence>?
    
    /// User ID
    private(set) public var userID: User?
    
    /// Measurement Status
    private(set) public var status: BloodPressureMeasurementStatus?
    
    /// Creates Intermediate Cuff Pressure Characteristic
    ///
    /// - Parameters:
    ///   - cuffPressure: Cuff Pressure
    ///   - timestamp: Timestamp
    ///   - pulseRate: Pulse Rate
    ///   - userID: User ID
    public init(cuffPressure: Measurement<UnitPressure>,
                timestamp: DateTime?,
                pulseRate: Measurement<UnitCadence>?,
                userID: User?,
                status: BloodPressureMeasurementStatus?) {
        
        self.cuffPressure = cuffPressure
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
        
        // Same Flags as Blood Pressure Measurement
        let flags = CharacteristicBloodPressureMeasurement.BloodPressureFlags(rawValue: decoder.decodeUInt8(data))
        
        var cuffPressure: Measurement<UnitPressure>
        let cuffPressureV = Double(decoder.decodeSFloatValue(data))
        
        if flags.contains(.unitsIsKilopascals) {
            cuffPressure = Measurement(value: cuffPressureV, unit: UnitPressure.kilopascals)
        } else {
            cuffPressure = Measurement(value: cuffPressureV, unit: UnitPressure.millimetersOfMercury)
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
        
        let char = CharacteristicIntermediateCuffPressure(cuffPressure: cuffPressure,
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

extension CharacteristicIntermediateCuffPressure: Hashable {
    
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
        hasher.combine(cuffPressure)
        hasher.combine(timestamp)
        hasher.combine(pulseRate)
        hasher.combine(userID)
        hasher.combine(status)
    }
}

extension CharacteristicIntermediateCuffPressure: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicIntermediateCuffPressure, rhs: CharacteristicIntermediateCuffPressure) -> Bool {
        return lhs.uuidString == rhs.uuidString
            && lhs.cuffPressure == rhs.cuffPressure
            && lhs.timestamp == rhs.timestamp
            && lhs.pulseRate == rhs.pulseRate
            && lhs.userID == rhs.userID
            && lhs.status == rhs.status
    }
}
