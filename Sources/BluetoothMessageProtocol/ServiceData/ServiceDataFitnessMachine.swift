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
///
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceDataFitnessMachine: ServiceData {

    /// Service Data Name
    public static var name: String {
        return "Fitness Machine"
    }

    /// Service Data UUID
    public static var uuidString: String {
        return "1826"
    }

    /// Options for Equipment Type Supported by Service
    public struct EquipmentType: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }

        /// Treadmill Supported
        public static let treadmillSupported: EquipmentType     = EquipmentType(rawValue: 1 << 0)
        /// Cross Trainer Supported
        public static let crossTrainerSupported: EquipmentType  = EquipmentType(rawValue: 1 << 1)
        /// Step Climber Supported
        public static let stepClimberSupported: EquipmentType   = EquipmentType(rawValue: 1 << 2)
        /// Stair Climber Supported
        public static let stairClimberSupported: EquipmentType  = EquipmentType(rawValue: 1 << 3)
        /// Rower Supported
        public static let rowerSupported: EquipmentType         = EquipmentType(rawValue: 1 << 4)
        /// Indoor Bike Supported
        public static let indoorBikeSupported: EquipmentType    = EquipmentType(rawValue: 1 << 5)
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

        super.init(name: ServiceDataFitnessMachine.name,
                   uuidString: ServiceDataFitnessMachine.uuidString)

    }

    /// Deocdes the Service Data AD Type Data
    ///
    /// - Parameter data: Data from Service Data AD Type
    /// - Returns: ServiceData Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> ServiceDataFitnessMachine {

        struct Flags: OptionSet {
            public let rawValue: UInt8
            public init(rawValue: UInt8) { self.rawValue = rawValue }

            /// Fitness Machine Available
            public static let available: Flags        = Flags(rawValue: 1 << 0)
        }

        var decoder = DataDecoder(data)

        let flags = Flags(rawValue: decoder.decodeUInt8())

        var ftmsAvailable = false
        if flags.contains(.available) == true {
            ftmsAvailable = true
        }

        var supported: EquipmentType = EquipmentType()
        supported = EquipmentType(rawValue: decoder.decodeUInt16())

        return ServiceDataFitnessMachine(fitnessMachineAvailable: ftmsAvailable,
                                         equipmentSupported: supported)
    }


    /// Encodes the Service Data AD Type into Data
    ///
    /// - Returns: Data representation of the Service Data AD Type
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError.init(.unsupported)
    }

}
