//
//  CharacteristicRowerData.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/27/17.
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

/// BLE Rower Data Characteristic
///
/// The Rower Data characteristic is used to send training-related data to the
/// Client from a rower (Server).
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicRowerData: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Rower Data" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2AD1" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Stroke Rate
    private(set) public var strokeRate: Measurement<UnitCadence>?
    
    /// Stroke Count
    private(set) public var strokeCount: UInt16?
    
    /// Average Stroke Rate
    private(set) public var averageStrokeRate: Measurement<UnitCadence>?
    
    /// Total Distance
    private(set) public var totalDistance: Measurement<UnitLength>?
    
    /// Instantaneous Pace
    private(set) public var instantaneousPace: Measurement<UnitDuration>?
    
    /// Average Pace
    private(set) public var averagePace: Measurement<UnitDuration>?
    
    /// Instantaneous Power
    private(set) public var instantaneousPower: FitnessMachinePowerType?
    
    /// Average Power
    private(set) public var averagePower: FitnessMachinePowerType?
    
    /// Resistance Level
    private(set) public var resistanceLevel: Int16?
    
    /// Energy Information
    private(set) public var energy: FitnessMachineEnergy
    
    /// Heart Rate
    private(set) public var heartRate: Measurement<UnitCadence>?
    
    /// Metabolic Equivalent
    private(set) public var metabolicEquivalent: Double?
    
    /// Time Information
    private(set) public var time: FitnessMachineTime
    
    /// Creates Rower Data Characteristic
    ///
    /// - Parameters:
    ///   - strokeRate: Stroke Rate
    ///   - strokeCount: Stroke Count
    ///   - averageStrokeRate: Average Stroke Rate
    ///   - totalDistance: Total Distance
    ///   - instantaneousPace: Instantaneous Pace
    ///   - averagePace: Average Pace
    ///   - instantaneousPower: Instantaneous Power
    ///   - averagePower: Average Power
    ///   - resistanceLevel: Resistance Level
    ///   - energy: Energy Information
    ///   - heartRate: Heart Rate
    ///   - metabolicEquivalent: Metabolic Equivalent
    ///   - time: Time Information
    public init(strokeRate: Measurement<UnitCadence>?,
                strokeCount: UInt16?,
                averageStrokeRate: Measurement<UnitCadence>?,
                totalDistance: Measurement<UnitLength>?,
                instantaneousPace: Measurement<UnitDuration>?,
                averagePace: Measurement<UnitDuration>?,
                instantaneousPower: FitnessMachinePowerType?,
                averagePower: FitnessMachinePowerType?,
                resistanceLevel: Int16?,
                energy: FitnessMachineEnergy,
                heartRate: UInt8?,
                metabolicEquivalent: Double?,
                time: FitnessMachineTime) {
        
        self.strokeRate = strokeRate
        self.strokeCount = strokeCount
        self.averageStrokeRate = averageStrokeRate
        self.totalDistance = totalDistance
        self.instantaneousPace = instantaneousPace
        self.averagePace = averagePace
        self.instantaneousPower = instantaneousPower
        self.averagePower = averagePower
        self.resistanceLevel = resistanceLevel
        
        self.energy = energy
        
        if let hRate = heartRate {
            self.heartRate = Measurement(value: Double(hRate), unit: UnitCadence.beatsPerMinute)
        } else {
            self.heartRate = nil
        }
        
        self.metabolicEquivalent = metabolicEquivalent
        self.time = time
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let flags = Flags(rawValue: decoder.decodeUInt16(data))
        
        var strokeRate: Measurement<UnitCadence>?
        var strokeCount: UInt16?
        var averageStrokeRate: Measurement<UnitCadence>?
        var totalDistance: Measurement<UnitLength>?
        var iPower: FitnessMachinePowerType?
        var aPower: FitnessMachinePowerType?
        var resistanceLevel: Int16?
        var heartRate: UInt8?
        var mets: Double?
        
        /// Available only when More data is NOT present
        if flags.contains(.moreData) == false {
            let value = decoder.decodeUInt8(data).resolution(.removing, resolution: .two)
            strokeRate = Measurement(value: value, unit: UnitCadence.strokesPerMinute)
            
            strokeCount = decoder.decodeUInt16(data)
        }
        
        if flags.contains(.averageStrokePresent) {
            let value = decoder.decodeUInt8(data).resolution(.removing, resolution: .two)
            averageStrokeRate = Measurement(value: value, unit: UnitCadence.strokesPerMinute)
        }
        
        if flags.contains(.totalDistancePresent) {
            let value = Double(decoder.decodeUInt24(data))
            totalDistance = Measurement(value: value, unit: UnitLength.meters)
        }
        
        let instantaneousPace = decodeDuration(supported: flags,
                                               flag: .instantaneousPacePresent,
                                               unit: UnitDuration.seconds,
                                               data: data, decoder: &decoder)
        
        let averagePace = decodeDuration(supported: flags,
                                         flag: .averagePacePresent,
                                         unit: UnitDuration.seconds,
                                         data: data, decoder: &decoder)
        
        if flags.contains(.instantaneousPowerPresent) {
            iPower = FitnessMachinePowerType.create(decoder.decodeInt16(data))
        }
        
        if flags.contains(.averagePowerPresent) {
            aPower = FitnessMachinePowerType.create(decoder.decodeInt16(data))
        }
        
        if flags.contains(.resistanceLevelPresent) {
            resistanceLevel = decoder.decodeInt16(data)
        }
        
        var fitEnergy: FitnessMachineEnergy
        if flags.contains(.expendedEnergyPresent) {
            fitEnergy = FitnessMachineEnergy.decode(data, decoder: &decoder)
        } else {
            fitEnergy = FitnessMachineEnergy(total: nil, perHour: nil, perMinute: nil)
        }
        
        if flags.contains(.heartRatePresent) {
            heartRate = decoder.decodeUInt8(data)
        }
        
        if flags.contains(.metabolicEquivalentPresent) {
            mets = decoder.decodeUInt8(data).resolution(.removing, resolution: .oneTenth)
        }
        
        let elapsedTime = decodeDuration(supported: flags,
                                         flag: .elapsedTimePresent,
                                         unit: UnitDuration.seconds,
                                         data: data, decoder: &decoder)
        
        let remainingTime = decodeDuration(supported: flags,
                                           flag: .remainingTimePresent,
                                           unit: UnitDuration.seconds,
                                           data: data, decoder: &decoder)
        
        let time = FitnessMachineTime(elapsed: elapsedTime, remaining: remainingTime)
        
        let char =  CharacteristicRowerData(strokeRate: strokeRate,
                                            strokeCount: strokeCount,
                                            averageStrokeRate: averageStrokeRate,
                                            totalDistance: totalDistance,
                                            instantaneousPace: instantaneousPace,
                                            averagePace: averagePace,
                                            instantaneousPower: iPower,
                                            averagePower: aPower,
                                            resistanceLevel: resistanceLevel,
                                            energy: fitEnergy,
                                            heartRate: heartRate,
                                            metabolicEquivalent: mets,
                                            time: time)
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

extension CharacteristicRowerData: Hashable {
    
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
        hasher.combine(strokeRate)
        hasher.combine(strokeCount)
        hasher.combine(averageStrokeRate)
        hasher.combine(totalDistance)
        hasher.combine(instantaneousPace)
        hasher.combine(averagePace)
        hasher.combine(instantaneousPower)
        hasher.combine(averagePower)
        hasher.combine(resistanceLevel)
        hasher.combine(energy)
        hasher.combine(heartRate)
        hasher.combine(metabolicEquivalent)
        hasher.combine(time)
    }
}

extension CharacteristicRowerData: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicRowerData, rhs: CharacteristicRowerData) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.strokeRate == rhs.strokeRate)
            && (lhs.strokeCount == rhs.strokeCount)
            && (lhs.averageStrokeRate == rhs.averageStrokeRate)
            && (lhs.totalDistance == rhs.totalDistance)
            && (lhs.instantaneousPace == rhs.instantaneousPace)
            && (lhs.averagePace == rhs.averagePace)
            && (lhs.instantaneousPower == rhs.instantaneousPower)
            && (lhs.averagePower == rhs.averagePower)
            && (lhs.resistanceLevel == rhs.resistanceLevel)
            && (lhs.energy == rhs.energy)
            && (lhs.heartRate == rhs.heartRate)
            && (lhs.metabolicEquivalent == rhs.metabolicEquivalent)
            && (lhs.time == rhs.time)
    }
}

private extension CharacteristicRowerData {
    
    /// Flags
    struct Flags: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }
        
        /// More Data not present (is defined opposite of the norm)
        public static let moreData                       = Flags(rawValue: 1 << 0)
        /// Average Stroke present
        public static let averageStrokePresent           = Flags(rawValue: 1 << 1)
        /// Total Distance Present
        public static let totalDistancePresent           = Flags(rawValue: 1 << 2)
        /// Instantaneous Pace present
        public static let instantaneousPacePresent       = Flags(rawValue: 1 << 3)
        /// Average Pace Present
        public static let averagePacePresent             = Flags(rawValue: 1 << 4)
        /// Instantaneous Power present
        public static let instantaneousPowerPresent      = Flags(rawValue: 1 << 5)
        /// Average Power present
        public static let averagePowerPresent            = Flags(rawValue: 1 << 6)
        /// Resistance Level present
        public static let resistanceLevelPresent         = Flags(rawValue: 1 << 7)
        /// Expended Energy present
        public static let expendedEnergyPresent          = Flags(rawValue: 1 << 8)
        /// Heart Rate present
        public static let heartRatePresent               = Flags(rawValue: 1 << 9)
        /// Metabolic Equivalent present
        public static let metabolicEquivalentPresent     = Flags(rawValue: 1 << 10)
        /// Elapsed Time present
        public static let elapsedTimePresent             = Flags(rawValue: 1 << 11)
        /// Remaining Time present
        public static let remainingTimePresent           = Flags(rawValue: 1 << 12)
    }
    
    /// Decode Duration Data
    ///
    /// - Parameters:
    ///   - supported: Supported Flags
    ///   - flag: Flags contained
    ///   - unit: Duration Unit
    ///   - data: Sensor Data
    ///   - decoder: Decoder
    /// - Returns: Measurement<UnitDuration>?
    /// - Throws: BluetoothDecodeError
    private class func decodeDuration(supported: Flags,
                                      flag: Flags,
                                      unit: UnitDuration,
                                      data: Data,
                                      decoder: inout DecodeData) -> Measurement<UnitDuration>? {
        
        var durationData: Measurement<UnitDuration>?
        if supported.contains(flag) {
            let value = Double(decoder.decodeUInt16(data))
            durationData = Measurement(value: value, unit: unit)
        }
        return durationData
    }
}
