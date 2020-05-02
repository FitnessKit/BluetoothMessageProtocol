//
//  CharacteristicTreadmillData.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/1/17.
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

/// BLE Treadmill Data Characteristic
///
/// The Treadmill Data characteristic is used to send training-related data to
/// the Client from a treadmill (Server).
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicTreadmillData: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Treadmill Data" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2ACD" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Instantaneous Speed
    private(set) public var instantaneousSpeed: FitnessMachineSpeedType?
    
    /// Average Speed
    private(set) public var averageSpeed: FitnessMachineSpeedType?
    
    /// Total Distance
    private(set) public var totalDistance: Measurement<UnitLength>?
    
    /// Inclination
    private(set) public var inclination: FitnessMachineInclinationType?
    
    /// Ramp Angle Setting
    private(set) public var rampAngle: Measurement<UnitAngle>?
    
    /// Positive Elevation Gain
    private(set) public var positiveElevationGain: Measurement<UnitLength>?
    
    /// Negative Elevation Gain
    private(set) public var negativeElevationGain: Measurement<UnitLength>?
    
    /// Instantaneous Pace
    private(set) public var instantaneousPace: Measurement<UnitSpeed>?
    
    /// Average Pace
    private(set) public var averagePace: Measurement<UnitSpeed>?
    
    /// Energy Information
    private(set) public var energy: FitnessMachineEnergy
    
    /// Heart Rate
    private(set) public var heartRate: Measurement<UnitCadence>?
    
    /// Metabolic Equivalent
    private(set) public var metabolicEquivalent: Double?
    
    /// Time Information
    private(set) public var time: FitnessMachineTime
    
    /// Force on Belt
    private(set) public var forceOnBelt: Measurement<UnitForce>?
    
    /// Power Output
    private(set) public var powerOutput: FitnessMachinePowerType?
    
    /// Creates Treadmill Data Characteristic
    ///
    /// - Parameters:
    ///   - instantaneousSpeed: Instantaneous Speed
    ///   - averageSpeed: Average Speed
    ///   - totalDistance: Total Distance
    ///   - inclination: Inclination
    ///   - rampAngle: Ramp Angle Setting
    ///   - positiveElevationGain: Positive Elevation Gain
    ///   - negativeElevationGain: Negative Elevation Gain
    ///   - instantaneousPace: Instantaneous Pace
    ///   - averagePace: Average Pace
    ///   - energy: Energy Information
    ///   - heartRate: Heart Rate
    ///   - metabolicEquivalent: Metabolic Equivalent
    ///   - time: Time Information
    ///   - forceOnBelt: Force on Belt
    ///   - powerOutput: Power Output
    public init(instantaneousSpeed: FitnessMachineSpeedType?,
                averageSpeed: FitnessMachineSpeedType?,
                totalDistance: Measurement<UnitLength>?,
                inclination: FitnessMachineInclinationType?,
                rampAngle: Measurement<UnitAngle>?,
                positiveElevationGain: Measurement<UnitLength>?,
                negativeElevationGain: Measurement<UnitLength>?,
                instantaneousPace: Measurement<UnitSpeed>?,
                averagePace: Measurement<UnitSpeed>?,
                energy: FitnessMachineEnergy,
                heartRate: UInt8?,
                metabolicEquivalent: Double?,
                time: FitnessMachineTime,
                forceOnBelt: Measurement<UnitForce>?,
                powerOutput: FitnessMachinePowerType?) {
        
        self.instantaneousSpeed = instantaneousSpeed
        self.averageSpeed = averageSpeed
        self.totalDistance = totalDistance
        self.inclination = inclination
        self.rampAngle = rampAngle
        self.positiveElevationGain = positiveElevationGain
        self.negativeElevationGain = negativeElevationGain
        self.instantaneousPace = instantaneousPace
        self.averagePace = averagePace
        self.energy = energy
        
        if let hRate = heartRate {
            self.heartRate = Measurement(value: Double(hRate), unit: UnitCadence.beatsPerMinute)
        } else {
            self.heartRate = nil
        }
        
        self.metabolicEquivalent = metabolicEquivalent
        self.time = time
        self.forceOnBelt = forceOnBelt
        self.powerOutput = powerOutput
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let flags = Flags(rawValue: decoder.decodeUInt16(data))
        
        var iSpeed: FitnessMachineSpeedType?
        var avgSpeed: FitnessMachineSpeedType?
        var totalDistance: Measurement<UnitLength>?
        var inclination: FitnessMachineInclinationType?
        var rampAngle: Measurement<UnitAngle>?
        var pElevaionGain: Measurement<UnitLength>?
        var nElevaionGain: Measurement<UnitLength>?
        var instantaneousPace: Measurement<UnitSpeed>?
        var averagePace: Measurement<UnitSpeed>?
        var heartRate: UInt8?
        var mets: Double?
        
        /// Available only when More data is NOT present
        if flags.contains(.moreData) == false {
            iSpeed = FitnessMachineSpeedType.create(decoder.decodeUInt16(data))
        }
        
        if flags.contains(.averageSpeedPresent) {
            avgSpeed = FitnessMachineSpeedType.create(decoder.decodeUInt16(data))
        }
        
        if flags.contains(.totalDistancePresent) {
            let value = Double(decoder.decodeUInt24(data))
            totalDistance = Measurement(value: value, unit: UnitLength.meters)
        }
        
        if flags.contains(.angleSettingpresent) {
            let incline = decoder.decodeInt16(data)
            let ramp = decoder.decodeInt16(data)
            
            if incline != Int16.max {
                let iValue = FitnessMachineInclinationType.create(incline)
                inclination = iValue
            }
            
            if ramp != Int16.max {
                let rValue = ramp.resolution(.removing, resolution: .oneTenth)
                rampAngle = Measurement(value: rValue, unit: UnitAngle.degrees)
            }
        }
        
        if flags.contains(.elevationGainPresent) {
            let pValue = decoder.decodeUInt16(data).resolution(.removing, resolution: .oneTenth)
            pElevaionGain = Measurement(value: pValue, unit: UnitLength.meters)

            let nValue = decoder.decodeUInt16(data).resolution(.removing, resolution: .oneTenth)
            nElevaionGain = Measurement(value: nValue, unit: UnitLength.meters)
        }
        
        if flags.contains(.instantaneousPacePresent) {
            let value = decoder.decodeUInt8(data).resolution(.removing, resolution: .oneTenth)
            instantaneousPace = Measurement(value: value, unit: UnitSpeed.kilometersPerMinute)
        }
        
        if flags.contains(.averagePacePresent) {
            let value = decoder.decodeUInt8(data).resolution(.removing, resolution: .oneTenth)
            averagePace = Measurement(value: value, unit: UnitSpeed.kilometersPerMinute)
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
        
        var forceOnBelt: Measurement<UnitForce>?
        var powerOutput: FitnessMachinePowerType?
        if flags.contains(.beltForcePowerOutputPresent) {
            
            let beltValue = decoder.decodeInt16(data)
            if beltValue != Int16.max {
                forceOnBelt = Measurement(value: Double(beltValue), unit: UnitForce.newton)
            }
            
            let power = decoder.decodeInt16(data)
            if power != Int16.max {
                powerOutput = FitnessMachinePowerType.create(power)
            }
        }
        
        let char = CharacteristicTreadmillData(instantaneousSpeed: iSpeed,
                                               averageSpeed: avgSpeed,
                                               totalDistance: totalDistance,
                                               inclination: inclination,
                                               rampAngle: rampAngle,
                                               positiveElevationGain: pElevaionGain,
                                               negativeElevationGain: nElevaionGain,
                                               instantaneousPace: instantaneousPace,
                                               averagePace: averagePace,
                                               energy: fitEnergy,
                                               heartRate: heartRate,
                                               metabolicEquivalent: mets,
                                               time: time,
                                               forceOnBelt: forceOnBelt,
                                               powerOutput: powerOutput)
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

extension CharacteristicTreadmillData: Hashable {
    
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
        hasher.combine(instantaneousSpeed)
        hasher.combine(averageSpeed)
        hasher.combine(totalDistance)
        hasher.combine(inclination)
        hasher.combine(rampAngle)
        hasher.combine(positiveElevationGain)
        hasher.combine(negativeElevationGain)
        hasher.combine(instantaneousPace)
        hasher.combine(averagePace)
        hasher.combine(energy)
        hasher.combine(heartRate)
        hasher.combine(metabolicEquivalent)
        hasher.combine(time)
        hasher.combine(forceOnBelt)
        hasher.combine(powerOutput)
    }
}

extension CharacteristicTreadmillData: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicTreadmillData, rhs: CharacteristicTreadmillData) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.instantaneousSpeed == rhs.instantaneousSpeed)
            && (lhs.averageSpeed == rhs.averageSpeed)
            && (lhs.totalDistance == rhs.totalDistance)
            && (lhs.inclination == rhs.inclination)
            && (lhs.rampAngle == rhs.rampAngle)
            && (lhs.positiveElevationGain == rhs.positiveElevationGain)
            && (lhs.negativeElevationGain == rhs.negativeElevationGain)
            && (lhs.instantaneousPace == rhs.instantaneousPace)
            && (lhs.averagePace == rhs.averagePace)
            && (lhs.energy == rhs.energy)
            && (lhs.heartRate == rhs.heartRate)
            && (lhs.metabolicEquivalent == rhs.metabolicEquivalent)
            && (lhs.time == rhs.time)
            && (lhs.forceOnBelt == rhs.forceOnBelt)
            && (lhs.powerOutput == rhs.powerOutput)
    }
}

private extension CharacteristicTreadmillData {
    
    /// Flags
    struct Flags: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }
        
        /// More Data not present (is defined opposite of the norm)
        public static let moreData                       = Flags(rawValue: 1 << 0)
        /// Average Speed present
        public static let averageSpeedPresent            = Flags(rawValue: 1 << 1)
        /// Total Distance Present
        public static let totalDistancePresent           = Flags(rawValue: 1 << 2)
        /// Inclination and Ramp Angle Setting present
        public static let angleSettingpresent            = Flags(rawValue: 1 << 3)
        /// Elevation Gain present
        public static let elevationGainPresent           = Flags(rawValue: 1 << 4)
        /// Instantaneous Pace present
        public static let instantaneousPacePresent       = Flags(rawValue: 1 << 5)
        /// Average Pace present
        public static let averagePacePresent             = Flags(rawValue: 1 << 6)
        /// Expended Energy present
        public static let expendedEnergyPresent          = Flags(rawValue: 1 << 7)
        /// Heart Rate present
        public static let heartRatePresent               = Flags(rawValue: 1 << 8)
        /// Metabolic Equivalent present
        public static let metabolicEquivalentPresent     = Flags(rawValue: 1 << 9)
        /// Elapsed Time present
        public static let elapsedTimePresent             = Flags(rawValue: 1 << 10)
        /// Remaining Time present
        public static let remainingTimePresent           = Flags(rawValue: 1 << 11)
        /// Force on Belt and Power Output present
        public static let beltForcePowerOutputPresent    = Flags(rawValue: 1 << 12)
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
