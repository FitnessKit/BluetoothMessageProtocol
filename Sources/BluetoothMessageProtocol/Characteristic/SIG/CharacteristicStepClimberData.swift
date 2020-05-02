//
//  CharacteristicStepClimberData.swift
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

/// BLE Step Climber Data Characteristic
///
/// The Step Climber Data characteristic is used to send training-related data
/// to the Client from a step climber (Server).
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicStepClimberData: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Step Climber Data" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2ACF" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Floors
    private(set) public var floors: UInt16?
    
    /// Step Count
    private(set) public var stepCount: UInt16?
    
    /// Step Per Minute
    private(set) public var stepsPerMinute: Measurement<UnitCadence>?
    
    /// Average Step Rate
    private(set) public var averageStepRate: Measurement<UnitCadence>?
    
    /// Positive Elevation Gain
    private(set) public var positiveElevationGain: Measurement<UnitLength>?
    
    /// Energy Information
    private(set) public var energy: FitnessMachineEnergy
    
    /// Heart Rate
    private(set) public var heartRate: Measurement<UnitCadence>?
    
    /// Metabolic Equivalent
    private(set) public var metabolicEquivalent: Double?
    
    /// Time Information
    private(set) public var time: FitnessMachineTime
    
    /// Creates Step Climber Data Characteristic
    ///
    /// - Parameters:
    ///   - floors: Floors climbed
    ///   - stepCount: Step Count
    ///   - stepsPerMinute: Step Per Minute
    ///   - averageStepRate: Average Step Rate
    ///   - positiveElevationGain: Positive Elevation Gain
    ///   - energy: Energy Information
    ///   - heartRate: Heart Rate
    ///   - metabolicEquivalent: Metabolic Equivalent
    ///   - time: Time Information
    public init(floors: UInt16?,
                stepCount: UInt16?,
                stepsPerMinute: Measurement<UnitCadence>?,
                averageStepRate: Measurement<UnitCadence>?,
                positiveElevationGain: Measurement<UnitLength>?,
                energy: FitnessMachineEnergy,
                heartRate: UInt8?,
                metabolicEquivalent: Double?,
                time: FitnessMachineTime) {
        
        self.floors = floors
        self.stepCount = stepCount
        self.stepsPerMinute = stepsPerMinute
        self.averageStepRate = averageStepRate
        self.positiveElevationGain = positiveElevationGain
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
        
        var floors: UInt16?
        var stepCount: UInt16?
        /// Available only when More data is NOT present
        if flags.contains(.moreData) == false {
            floors = decoder.decodeUInt16(data)
            stepCount = decoder.decodeUInt16(data)
        }
        
        let stepsPerMinute = decodeCadence(supported: flags,
                                           flag: .stepPerMinutePresent,
                                           unit: UnitCadence.stepsPerMinute,
                                           data: data, decoder: &decoder)
        
        let averageStepRate = decodeCadence(supported: flags,
                                            flag: .averageStepRatePresent,
                                            unit: UnitCadence.stepsPerMinute,
                                            data: data, decoder: &decoder)
        
        var positiveElevationGain: Measurement<UnitLength>?
        if flags.contains(.positiveElevationGainPresent) {
            let value = Double(decoder.decodeUInt16(data))
            positiveElevationGain = Measurement(value: value, unit: UnitLength.meters)
        }
        
        var fitEnergy: FitnessMachineEnergy
        if flags.contains(.expendedEnergyPresent) {
            fitEnergy = FitnessMachineEnergy.decode(data, decoder: &decoder)
        } else {
            fitEnergy = FitnessMachineEnergy(total: nil, perHour: nil, perMinute: nil)
        }
        
        var heartRate: UInt8?
        if flags.contains(.heartRatePresent) {
            heartRate = decoder.decodeUInt8(data)
        }
        
        var mets: Double?
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
        
        let char = CharacteristicStepClimberData(floors: floors,
                                                 stepCount: stepCount,
                                                 stepsPerMinute: stepsPerMinute,
                                                 averageStepRate: averageStepRate,
                                                 positiveElevationGain: positiveElevationGain,
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

extension CharacteristicStepClimberData: Hashable {
    
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
        hasher.combine(floors)
        hasher.combine(stepCount)
        hasher.combine(stepsPerMinute)
        hasher.combine(averageStepRate)
        hasher.combine(positiveElevationGain)
        hasher.combine(energy)
        hasher.combine(heartRate)
        hasher.combine(metabolicEquivalent)
        hasher.combine(time)
    }
}

extension CharacteristicStepClimberData: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicStepClimberData, rhs: CharacteristicStepClimberData) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.floors == rhs.floors)
            && (lhs.stepCount == rhs.stepCount)
            && (lhs.stepsPerMinute == rhs.stepsPerMinute)
            && (lhs.averageStepRate == rhs.averageStepRate)
            && (lhs.positiveElevationGain == rhs.positiveElevationGain)
            && (lhs.energy == rhs.energy)
            && (lhs.heartRate == rhs.heartRate)
            && (lhs.metabolicEquivalent == rhs.metabolicEquivalent)
            && (lhs.time == rhs.time)
    }
}

private extension CharacteristicStepClimberData {
    
    /// Flags
    struct Flags: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }
        
        /// More Data not present (is defined opposite of the norm)
        public static let moreData                       = Flags(rawValue: 1 << 0)
        /// Step per Minute present
        public static let stepPerMinutePresent           = Flags(rawValue: 1 << 1)
        /// Average Step Rate Present
        public static let averageStepRatePresent         = Flags(rawValue: 1 << 2)
        /// Positive Elevation Gain present
        public static let positiveElevationGainPresent   = Flags(rawValue: 1 << 3)
        /// Expended Energy present
        public static let expendedEnergyPresent          = Flags(rawValue: 1 << 4)
        /// Heart Rate present
        public static let heartRatePresent               = Flags(rawValue: 1 << 5)
        /// Metabolic Equivalent present
        public static let metabolicEquivalentPresent     = Flags(rawValue: 1 << 6)
        /// Elapsed Time present
        public static let elapsedTimePresent             = Flags(rawValue: 1 << 7)
        /// Remaining Time present
        public static let remainingTimePresent           = Flags(rawValue: 1 << 8)
    }
    
    /// Decode Cadence Data
    ///
    /// - Parameters:
    ///   - flag: Flags
    ///   - unit: Cadence Unit
    ///   - data: Sensor Data
    ///   - decoder: Decoder
    /// - Returns: Measurement<UnitCadence>?
    /// - Throws: BluetoothDecodeError
    private class func decodeCadence(supported: Flags,
                                     flag: Flags,
                                     unit: UnitCadence,
                                     data: Data,
                                     decoder: inout DecodeData) -> Measurement<UnitCadence>? {
        
        var cadenceValue: Measurement<UnitCadence>?
        if supported.contains(flag) {
            let value = Double(decoder.decodeUInt16(data))
            cadenceValue = Measurement(value: value, unit: unit)
        }
        return cadenceValue
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
