//
//  CharacteristicGymConnectMeasurement.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 10/20/18.
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

/// GymConnect Equipment Data Measurement Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicGymConnectMeasurement: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "GymConnect Measurement" }
    
    /// Characteristic UUID
    public static var uuidString: String { "A026E01D-0A7D-4AB3-97FA-F1500F9FEB8B" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// First Packet of Logical Update
    ///
    /// Measurement data can come from multiple notify events
    /// this indicates if it is the first event.
    /// All Updates until the final event can be considered one
    /// logical update
    private(set) public var firstUpdatePacket: Bool
    
    /// Final Packet of Logical Update
    ///
    /// Indicates the last packet of the Logical Update
    private(set) public var finalUpdatePacket: Bool
    
    /// Time Information
    private(set) public var time: FitnessMachineTime
    
    /// Heart Rate
    private(set) public var heartRate: Measurement<UnitCadence>?
    
    /// Intensity / Level
    ///
    /// This can mean Intesity or Level based on the equipment type
    private(set) public var intensity: UInt8?
    
    /// Resistance
    private(set) public var resistnace: Double?
    
    /// Current Speed
    private(set) public var speed: FitnessMachineSpeedType?
    
    /// Cadence
    ///
    /// Each equpment type will determine how this should be
    /// displayed.
    ///
    /// Examples:
    ///  - Bike: RPM (revolutions per minute)
    ///  - StairClimber: steps/min
    ///  - Rower: strokes/min
    ///  - CrosTrainer: strides/min
    private(set) public var cadence: Double?
    
    /// Total Movements
    ///
    /// Total Count of Movements (Steps, strokes, etc..)
    private(set) public var totalMovements: Double?
    
    /// Total Horizontal Distance
    private(set) public var totalHorizontalDistance: Measurement<UnitLength>?
    
    /// Total Vertical Distance
    ///
    /// If totalNegitiveVerticalDistance is present then this should be
    /// interpreted as Positive Vertical Distance
    private(set) public var totalVerticalDistance: Measurement<UnitLength>?
    
    /// Total Negitive Vertical Distance
    private(set) public var totalNegitiveVerticalDistance: Measurement<UnitLength>?
    
    /// Total Energy
    private(set) public var totalEnergy: Measurement<UnitEnergy>?
    
    /// Energy Per Hour
    private(set) public var energyPerHour: Measurement<UnitEnergy>?
    
    /// Metabolic Equivalent (METs)
    private(set) public var metabolicEquivalent: Double?
    
    /// Instantaneous Power
    private(set) public var power: FitnessMachinePowerType?
    
    /// Torque
    private(set) public var torque: Measurement<UnitTorque>?
    
    /// Current Gear
    private(set) public var currentGear: UInt8?
    
    /// Current Grade
    ///
    /// - 100%: 45 degrees uphill
    /// - -100%: 45 degress downhill
    private(set) public var grade: Measurement<UnitPercent>?
    
    /// Ramp Angle
    ///
    /// - 0 degrees: Flat
    /// - 90 degrees: Straight Up
    /// - -90 degrees: Straight Down
    private(set) public var rampAngle: Measurement<UnitAngle>?
    
    /// Current Floor Rate
    private(set) public var floorRate: Measurement<UnitCadence>?
    
    /// Total Floors
    ///
    /// Count of Floors
    private(set) public var totalFloors: Double?
    
    /// Total Laps
    private(set) public var totalLaps: Double?
    
    /// Current Movement Length
    ///
    /// Movement Length describes the movement length.  For example step length,
    /// stroke length.  This coincides with Cadence
    private(set) public var movementLength: Measurement<UnitLength>?
    
    /// Creates Characteristic
    ///
    /// - Parameter equipment: Equipment Type
    internal init(firstUpdatePacket: Bool,
                  finalUpdatePacket: Bool,
                  time: FitnessMachineTime,
                  heartRate: UInt8?,
                  intensity: UInt8?,
                  resistnace: Double?,
                  speed: FitnessMachineSpeedType?,
                  cadence: Double?,
                  totalMovements: Double?,
                  totalHorizontalDistance: Measurement<UnitLength>?,
                  totalVerticalDistance: Measurement<UnitLength>?,
                  totalNegitiveVerticalDistance: Measurement<UnitLength>?,
                  totalEnergy: Measurement<UnitEnergy>?,
                  energyPerHour: Measurement<UnitEnergy>?,
                  metabolicEquivalent: Double?,
                  power: FitnessMachinePowerType?,
                  torque: Measurement<UnitTorque>?,
                  currentGear: UInt8?,
                  grade: Measurement<UnitPercent>?,
                  rampAngle: Measurement<UnitAngle>?,
                  floorRate: Measurement<UnitCadence>?,
                  totalFloors: Double?,
                  totalLaps: Double?,
                  movementLength: Measurement<UnitLength>?) {
        
        self.firstUpdatePacket = firstUpdatePacket
        self.finalUpdatePacket = finalUpdatePacket
        self.time = time
        
        if let hRate = heartRate {
            self.heartRate = Measurement(value: Double(hRate), unit: UnitCadence.beatsPerMinute)
        } else {
            self.heartRate = nil
        }
        
        self.intensity = intensity
        self.resistnace = resistnace
        self.speed = speed
        self.cadence = cadence
        self.totalMovements = totalMovements
        self.totalHorizontalDistance = totalHorizontalDistance
        self.totalVerticalDistance = totalVerticalDistance
        self.totalNegitiveVerticalDistance = totalNegitiveVerticalDistance
        self.totalEnergy = totalEnergy
        self.energyPerHour = energyPerHour
        self.metabolicEquivalent = metabolicEquivalent
        self.power = power
        self.torque = torque
        self.currentGear = currentGear
        self.grade = grade
        self.rampAngle = rampAngle
        self.floorRate = floorRate
        self.totalFloors = totalFloors
        self.totalLaps = totalLaps
        self.movementLength = movementLength
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        var flagsOne: FlagsOne?
        var flagsTwo: FlagsTwo?
        var flagsThree: FlagsThree?
        //var flagsFour: FlagsFour?
        
        var firstUpdatePacket: Bool = false
        var finalUpdatePacket: Bool = false
        
        var heartRate: UInt8?
        var intensity: UInt8?
        var resistnace: Double?
        var speed: FitnessMachineSpeedType?
        var cadence: Double?
        var totalMovements: Double?
        var totalHorizontalDistance: Measurement<UnitLength>?
        var totalVerticalDistance: Measurement<UnitLength>?
        var totalNegitiveVerticalDistance: Measurement<UnitLength>?
        var totalEnergy: Measurement<UnitEnergy>?
        var energyPerHour: Measurement<UnitEnergy>?
        var metabolicEquivalent: Double?
        var power: FitnessMachinePowerType?
        var torque: Measurement<UnitTorque>?
        var currentGear: UInt8?
        var grade: Measurement<UnitPercent>?
        var rampAngle: Measurement<UnitAngle>?
        var floorRate: Measurement<UnitCadence>?
        var totalFloors: Double?
        var totalLaps: Double?
        var movementLength: Measurement<UnitLength>?
        
        let flagsZero = Flags(rawValue: decoder.decodeUInt8(data))
        
        if flagsZero.contains(.firstPacketOfUpdate) {
            firstUpdatePacket = true
        }
        
        if flagsZero.contains(.finalPacketOfUpdate) {
            finalUpdatePacket = true
        }
        
        /// C0
        if flagsZero.contains(.flagsOnePresent) {
            flagsOne = FlagsOne(rawValue: decoder.decodeUInt8(data))
        }
        
        /// C1
        if flagsZero.contains(.flagsTwoPresent) {
            flagsTwo = FlagsTwo(rawValue: decoder.decodeUInt8(data))
        }
        
        /// C2
        if flagsZero.contains(.flagsThreePresent) {
            flagsThree = FlagsThree(rawValue: decoder.decodeUInt8(data))
        }
        
        /// C3
        if flagsZero.contains(.flagsFourPresent) {
            _ = FlagsFour(rawValue: decoder.decodeUInt8(data))
        }
        
        /// C4
        let elapsedTime = decodeDuration(supported: flagsZero,
                                         flag: .elapsedWorkoutTimePresent,
                                         unit: UnitDuration.seconds,
                                         data: data, decoder: &decoder)
        
        /// C5
        let remainingTime = decodeDuration(supported: flagsZero,
                                           flag: .remainingWorkoutTimePresent,
                                           unit: UnitDuration.seconds,
                                           data: data, decoder: &decoder)
        
        /// Flags One
        if let flags = flagsOne {
            /// C6
            if flags.contains(.heartRate) {
                heartRate = decoder.decodeUInt8(data)
            }
            
            /// C7
            if flags.contains(.intensity) {
                intensity = decoder.decodeUInt8(data)
            }
            
            /// C8
            if flags.contains(.resistance) {
                resistnace = decoder.decodeUInt16(data).resolution(.removing, resolution: .oneTenth)
            }
            
            /// C9
            if flags.contains(.speed) {
                speed = FitnessMachineSpeedType.create(decoder.decodeUInt16(data))
            }
            
            /// C10
            if flags.contains(.cadence) {
                cadence = decoder.decodeUInt16(data).resolution(.removing, resolution: .oneTenth)
            }
            
            /// C11
            if flags.contains(.totalMovements) {
                totalMovements = decoder.decodeUInt16(data).resolution(.removing, resolution: .one)
            }
            
            /// C12
            if flags.contains(.totalHorizontalDistance) {
                let value = Double(decoder.decodeUInt24(data))
                totalHorizontalDistance = Measurement(value: value, unit: UnitLength.meters)
            }
            
            /// C13
            if flags.contains(.totalVerticalDistance) {
                let value = decoder.decodeUInt16(data).resolution(.removing, resolution: .oneTenth)
                totalVerticalDistance = Measurement(value: value, unit: UnitLength.meters)
            }
        }
        
        /// Flags Two
        if let flags = flagsTwo {
            
            /// C14
            if flags.contains(.totalNegitiveVerticalDistance) {
                let value = decoder.decodeUInt16(data).resolution(.removing, resolution: .oneTenth)
                totalNegitiveVerticalDistance = Measurement(value: value, unit: UnitLength.meters)
            }
            
            /// C15
            if flags.contains(.totalEnergy) {
                let value = decoder.decodeUInt16(data).resolution(.removing, resolution: .one)
                totalEnergy = Measurement(value: value, unit: UnitEnergy.kilocalories)
            }
            
            /// C16
            if flags.contains(.energyRate) {
                let value = Double(decoder.decodeUInt16(data)).resolution(.removing, resolution: .one)
                energyPerHour = Measurement(value: value, unit: UnitEnergy.kilocalories)
            }
            
            /// C17
            if flags.contains(.mets) {
                metabolicEquivalent = decoder.decodeUInt8(data).resolution(.removing, resolution: .oneTenth)
            }
            
            /// C18
            if flags.contains(.power) {
                power = FitnessMachinePowerType.create(decoder.decodeInt16(data))
            }
            
            /// C19
            if flags.contains(.torque) {
                let value = decoder.decodeUInt16(data).resolution(.removing, resolution: .oneTenth)
                torque = Measurement(value: value, unit: UnitTorque.newtonMeter)
            }
            
            /// C20
            if flags.contains(.gear) {
                currentGear = decoder.decodeUInt8(data)
            }
            
            /// C21
            if flags.contains(.grade) {
                let value = decoder.decodeInt16(data).resolution(.removing, resolution: .oneTenth)
                grade = Measurement(value: value, unit: UnitPercent.percent)
            }
        }
        
        /// Flags Three
        if let flags = flagsThree {
            
            /// C22
            if flags.contains(.angle) {
                let value = decoder.decodeInt16(data).resolution(.removing, resolution: .oneHundredth)
                rampAngle = Measurement(value: value, unit: UnitAngle.degrees)
            }
            
            /// C23
            if flags.contains(.floorRate) {
                let value = decoder.decodeUInt16(data).resolution(.removing, resolution: .oneHundredth)
                floorRate = Measurement(value: value, unit: UnitCadence.floorsPerMinute)
            }
            
            /// C24
            if flags.contains(.totalFloors) {
                totalFloors = decoder.decodeUInt16(data).resolution(.removing, resolution: .oneHundredth)
            }
            
            /// C25
            if flags.contains(.totalLaps) {
                totalLaps = decoder.decodeUInt8(data).resolution(.removing, resolution: .one)
            }
            
            /// C26
            if flags.contains(.movementLength) {
                let value = decoder.decodeUInt16(data).resolution(.removing, resolution: .oneThousandth)
                movementLength = Measurement(value: value, unit: UnitLength.millimeters)
            }
        }
        
        /// Workout Time
        let time = FitnessMachineTime(elapsed: elapsedTime, remaining: remainingTime)
        
        let char = CharacteristicGymConnectMeasurement(firstUpdatePacket: firstUpdatePacket,
                                                       finalUpdatePacket: finalUpdatePacket,
                                                       time: time,
                                                       heartRate: heartRate,
                                                       intensity: intensity,
                                                       resistnace: resistnace,
                                                       speed: speed,
                                                       cadence: cadence,
                                                       totalMovements: totalMovements,
                                                       totalHorizontalDistance: totalHorizontalDistance,
                                                       totalVerticalDistance: totalVerticalDistance,
                                                       totalNegitiveVerticalDistance: totalNegitiveVerticalDistance,
                                                       totalEnergy: totalEnergy,
                                                       energyPerHour: energyPerHour,
                                                       metabolicEquivalent: metabolicEquivalent,
                                                       power: power,
                                                       torque: torque,
                                                       currentGear: currentGear,
                                                       grade: grade,
                                                       rampAngle: rampAngle,
                                                       floorRate: floorRate,
                                                       totalFloors: totalFloors,
                                                       totalLaps: totalLaps,
                                                       movementLength: movementLength)
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

extension CharacteristicGymConnectMeasurement: Hashable {
    
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
        hasher.combine(firstUpdatePacket)
        hasher.combine(finalUpdatePacket)
        hasher.combine(time)
        hasher.combine(heartRate)
        hasher.combine(intensity)
        hasher.combine(resistnace)
        hasher.combine(speed)
        hasher.combine(cadence)
        hasher.combine(totalMovements)
        hasher.combine(totalHorizontalDistance)
        hasher.combine(totalVerticalDistance)
        hasher.combine(totalNegitiveVerticalDistance)
        hasher.combine(totalEnergy)
        hasher.combine(energyPerHour)
        hasher.combine(metabolicEquivalent)
        hasher.combine(power)
        hasher.combine(torque)
        hasher.combine(currentGear)
        hasher.combine(grade)
        hasher.combine(rampAngle)
        hasher.combine(floorRate)
        hasher.combine(totalFloors)
        hasher.combine(totalLaps)
        hasher.combine(movementLength)
    }
}

extension CharacteristicGymConnectMeasurement: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicGymConnectMeasurement, rhs: CharacteristicGymConnectMeasurement) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.firstUpdatePacket == rhs.firstUpdatePacket)
            && (lhs.finalUpdatePacket == rhs.finalUpdatePacket)
            && (lhs.time == rhs.time)
            && (lhs.heartRate == rhs.heartRate)
            && (lhs.intensity == rhs.intensity)
            && (lhs.resistnace == rhs.resistnace)
            && (lhs.speed == rhs.speed)
            && (lhs.cadence == rhs.cadence)
            && (lhs.totalMovements == rhs.totalMovements)
            && (lhs.totalHorizontalDistance == rhs.totalHorizontalDistance)
            && (lhs.totalVerticalDistance == rhs.totalVerticalDistance)
            && (lhs.totalNegitiveVerticalDistance == rhs.totalNegitiveVerticalDistance)
            && (lhs.totalEnergy == rhs.totalEnergy)
            && (lhs.energyPerHour == rhs.energyPerHour)
            && (lhs.metabolicEquivalent == rhs.metabolicEquivalent)
            && (lhs.power == rhs.power)
            && (lhs.torque == rhs.torque)
            && (lhs.currentGear == rhs.currentGear)
            && (lhs.grade == rhs.grade)
            && (lhs.rampAngle == rhs.rampAngle)
            && (lhs.floorRate == rhs.floorRate)
            && (lhs.totalFloors == rhs.totalFloors)
            && (lhs.totalLaps == rhs.totalLaps)
            && (lhs.movementLength == rhs.movementLength)
    }
}

//MARK: - Flags
private extension CharacteristicGymConnectMeasurement {
    
    /// Flags
    private struct Flags: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        /// Flags One is Present
        public static let flagsOnePresent               = Flags(rawValue: 1 << 0)
        /// Flags Two is Present
        public static let flagsTwoPresent               = Flags(rawValue: 1 << 1)
        /// Flags Three is Present
        public static let flagsThreePresent             = Flags(rawValue: 1 << 2)
        /// Flags Four is Present
        public static let flagsFourPresent              = Flags(rawValue: 1 << 3)
        /// First Packet of Update
        ///
        /// Indicates that this is the first notify packet for this particular update.
        /// this helps to piece multiple  packets back into a single logical "update".
        /// This is useful when multiple packets are used for a single update
        /// so that more data fields can be sent.
        public static let firstPacketOfUpdate           = Flags(rawValue: 1 << 4)
        /// Final Packet of Update
        ///
        /// Indicates that this is the last notify packet for this particular update.
        public static let finalPacketOfUpdate           = Flags(rawValue: 1 << 5)
        /// Elapsed Workout Time Present
        public static let elapsedWorkoutTimePresent     = Flags(rawValue: 1 << 6)
        /// Remaining Workout Time Present
        public static let remainingWorkoutTimePresent   = Flags(rawValue: 1 << 7)
    }
    
    /// Flags One
    private struct FlagsOne: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        /// Heartrate Present
        public static let heartRate                     = FlagsOne(rawValue: 1 << 0)
        /// Intensity Present
        public static let intensity                     = FlagsOne(rawValue: 1 << 1)
        /// Resistance Present
        public static let resistance                    = FlagsOne(rawValue: 1 << 2)
        /// Speed Present
        public static let speed                         = FlagsOne(rawValue: 1 << 3)
        /// Cadence Present
        public static let cadence                       = FlagsOne(rawValue: 1 << 4)
        /// Cumulative Movements Present
        public static let totalMovements                = FlagsOne(rawValue: 1 << 5)
        /// Cumulative Horizontal Distance Present
        public static let totalHorizontalDistance       = FlagsOne(rawValue: 1 << 6)
        /// Cumulative Vertical Distance Present
        public static let totalVerticalDistance         = FlagsOne(rawValue: 1 << 7)
    }
    
    /// Flags Two
    private struct FlagsTwo: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        /// Negitive Vertical Distance Present
        public static let totalNegitiveVerticalDistance     = FlagsTwo(rawValue: 1 << 0)
        /// Total Energy Present
        public static let totalEnergy                       = FlagsTwo(rawValue: 1 << 1)
        /// Energy Rate Present
        public static let energyRate                        = FlagsTwo(rawValue: 1 << 2)
        /// METs Present
        public static let mets                              = FlagsTwo(rawValue: 1 << 3)
        /// Power Present
        public static let power                             = FlagsTwo(rawValue: 1 << 4)
        /// Torque Present
        public static let torque                            = FlagsTwo(rawValue: 1 << 5)
        /// Gear Present
        public static let gear                              = FlagsTwo(rawValue: 1 << 6)
        /// Grade Present
        public static let grade                             = FlagsTwo(rawValue: 1 << 7)
    }
    
    /// Flags Three
    private struct FlagsThree: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        /// Angle Present
        public static let angle                 = FlagsThree(rawValue: 1 << 0)
        /// Floor Rate Present
        public static let floorRate             = FlagsThree(rawValue: 1 << 1)
        /// Total Floors Present
        public static let totalFloors           = FlagsThree(rawValue: 1 << 2)
        /// Total Laps Present
        public static let totalLaps             = FlagsThree(rawValue: 1 << 3)
        /// Movement length Present
        public static let movementLength        = FlagsThree(rawValue: 1 << 4)
    }
    
    /// Flags Four
    private struct FlagsFour: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
    }
    
}

//MARK: - Helpers
private extension CharacteristicGymConnectMeasurement {
    
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
    private static func decodeDuration(supported: Flags,
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
