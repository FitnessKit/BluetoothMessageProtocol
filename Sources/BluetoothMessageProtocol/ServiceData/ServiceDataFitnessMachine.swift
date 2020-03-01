//
//  ServiceDataFitnessMachine.swift
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

/// BLE Fitness Machine Service Data
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class ServiceDataFitnessMachine: ServiceData {

    /// Service Data Name
    public static var name: String { "Fitness Machine" }

    /// Service Data UUID
    public static var uuidString: String { "1826" }
    
    /// Name of the Service Data AD Type
    public var name: String { Self.name }
    
    /// Service Data AD Type UUID String
    public var uuidString: String { Self.uuidString }

    struct Flags: OptionSet {
        let rawValue: UInt8
        init(rawValue: UInt8) { self.rawValue = rawValue }
        
        /// Fitness Machine Available
        static let available     = Flags(rawValue: 1 << 0)
    }

    /// Options for Equipment Type Supported by Service
    public struct EquipmentType: OptionSet, Hashable {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }

        /// Treadmill Supported
        public static let treadmillSupported     = EquipmentType(rawValue: 1 << 0)
        /// Cross Trainer Supported
        public static let crossTrainerSupported  = EquipmentType(rawValue: 1 << 1)
        /// Step Climber Supported
        public static let stepClimberSupported   = EquipmentType(rawValue: 1 << 2)
        /// Stair Climber Supported
        public static let stairClimberSupported  = EquipmentType(rawValue: 1 << 3)
        /// Rower Supported
        public static let rowerSupported         = EquipmentType(rawValue: 1 << 4)
        /// Indoor Bike Supported
        public static let indoorBikeSupported    = EquipmentType(rawValue: 1 << 5)
    }

    /// Fitness Machine Availability
    private(set) public var fitnessMachineAvailable: Bool

    /// Fitness Machine Eqiupment Supported
    private(set) public var equipmentSupported: EquipmentType

    /// Service Data for Fitness Machine
    ///
    /// - Parameters:
    ///   - fitnessMachineAvailable: If Fitness Machine is Available
    ///   - equipmentSupported: Supported Equipment Type
    public init(fitnessMachineAvailable: Bool, equipmentSupported: EquipmentType) {
        self.fitnessMachineAvailable = fitnessMachineAvailable
        self.equipmentSupported = equipmentSupported
    }

    /// Decodes Service Data AD Data into ServiceData
    ///
    /// - Parameter data: ServiceData Data
    /// - Returns: ServiceData Result
    public class func decode(with data: Data) -> Result<ServiceDataFitnessMachine, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let flags = Flags(rawValue: decoder.decodeUInt8(data))
        
        var ftmsAvailable = false
        if flags.contains(.available) {
            ftmsAvailable = true
        }
        
        var supported: EquipmentType = EquipmentType()
        supported = EquipmentType(rawValue: decoder.decodeUInt16(data))
        
        let serviceData = ServiceDataFitnessMachine(fitnessMachineAvailable: ftmsAvailable,
                                                    equipmentSupported: supported)
        return.success(serviceData)
    }

    /// Encodes the Service Data AD Type into Data
    ///
    /// - Returns: Service Data AD Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        //Not Yet Supported
        return.failure(BluetoothEncodeError.notSupported)
    }

    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringKey.self)

        let dataKey = StringKey(stringValue: "data")!
        let fitKey = StringKey(stringValue: "fitnessMachineAvailable")!
        let eqipKey = StringKey(stringValue: "equipmentSupported")!

        var unitContainer = container.nestedContainer(keyedBy: StringKey.self, forKey: dataKey)
        try unitContainer.encode(fitnessMachineAvailable, forKey: fitKey)
        try unitContainer.encode(equipmentSupported, forKey: eqipKey)
    }
}

@available(swift 4.0)
extension ServiceDataFitnessMachine.EquipmentType: Encodable {

    enum CodeKeys: CodingKey {
        case treadmillSupported
        case crossTrainerSupported
        case stepClimberSupported
        case stairClimberSupported
        case rowerSupported
        case indoorBikeSupported
    }

    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodeKeys.self)

        try container.encode(self.contains(.treadmillSupported), forKey: .treadmillSupported)
        try container.encode(self.contains(.crossTrainerSupported), forKey: .crossTrainerSupported)
        try container.encode(self.contains(.stepClimberSupported), forKey: .stepClimberSupported)
        try container.encode(self.contains(.stairClimberSupported), forKey: .stairClimberSupported)
        try container.encode(self.contains(.rowerSupported), forKey: .rowerSupported)
        try container.encode(self.contains(.indoorBikeSupported), forKey: .indoorBikeSupported)
    }
}

extension ServiceDataFitnessMachine: Hashable {

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
        hasher.combine(fitnessMachineAvailable)
        hasher.combine(equipmentSupported)
    }
}

extension ServiceDataFitnessMachine: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ServiceDataFitnessMachine, rhs: ServiceDataFitnessMachine) -> Bool {
        return (lhs.fitnessMachineAvailable == rhs.fitnessMachineAvailable) &&
            (lhs.equipmentSupported == rhs.equipmentSupported)
    }
}
