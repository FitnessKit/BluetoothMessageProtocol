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
///
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicNorthPoleAweHeartRateMeasurement: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "AWE Heart Rate Meassurement"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "4B486401-6E6F-7274-6870-6F6C65656E67"
    }

    private struct Flags {
        /// Heart Rate Value Format is set to UINT16. Units: beats per minute (bpm)
        private(set) public var isFormatUInt16: Bool
        /// Sensor Contact Status
        private(set) public var contact: HeartRateContactStatus
        /// Energy Expended field is present
        private(set) public var isEnergyExpendedPresent: Bool
        /// One or more RR-Interval values are present
        private(set) public var isRRIntervalPresent: Bool

        /// Rawvalue
        public var rawValue: UInt8 {
            var value: UInt8 = UInt8(isFormatUInt16 == true ? 1 : 0)
            value |= contact.rawValue << 1
            value |=  UInt8(isEnergyExpendedPresent == true ? 1 : 0) << 3
            value |=  UInt8(isRRIntervalPresent == true ? 1 : 0) << 4

            return UInt8(value)
        }

        /// Creates Flags Struct
        ///
        /// - Parameter value: UInt8 Flag Data
        public init(_ value: UInt8) {
            self.isFormatUInt16 = (value & 0x01).boolValue

            let contactStatusBits = (value | 0x06) >> 1

            contact = HeartRateContactStatus(rawValue: contactStatusBits) ?? .notSupported

            isEnergyExpendedPresent = (value & 0x08 == 0x08)

            isRRIntervalPresent = (value & 0x10 == 0x10)

        }

        /// Creates Flags Structs
        ///
        /// - Parameters:
        ///   - isFormatUInt16: HR Format is UInt16
        ///   - contactStatus: Contact Status
        ///   - isEnergyExpendedPresent: Energy Expended Present
        ///   - isRRIntervalPresent: One or more RR Values Present
        public init(isFormatUInt16: Bool, contactStatus: HeartRateContactStatus, isEnergyExpendedPresent: Bool, isRRIntervalPresent: Bool) {
            self.isFormatUInt16 = isFormatUInt16
            self.contact = contactStatus
            self.isEnergyExpendedPresent = isEnergyExpendedPresent
            self.isRRIntervalPresent = isRRIntervalPresent
        }
    }

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

        super.init(name: CharacteristicNorthPoleAweHeartRateMeasurement.name,
                   uuidString: CharacteristicNorthPoleAweHeartRateMeasurement.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicNorthPoleAweHeartRateMeasurement {
        /// Data from the AWE Heart Rate Measurement is not Notified or read.
        /// We don't need to ever decode it
        throw BluetoothMessageProtocolError.init(.unsupported)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        let energyPresent = self.energyExpended == nil ? false : true

        // For now just not send RR Values.. Since they are not used
        let flags = Flags.init(isFormatUInt16: false,
                               contactStatus: self.contactStatus,
                               isEnergyExpendedPresent: energyPresent,
                               isRRIntervalPresent: false)

        msgData.append(flags.rawValue)
        msgData.append(UInt8(heartRate.value))

        if energyPresent == true {
            if let energyValue = energyExpended {
                let energy = energyValue.converted(to: UnitEnergy.joules).value
                msgData.append(Data(from: UInt16(energy)))
            } else {
                // energy is present but we got no Data??
                msgData.append(Data(from: UInt16(0)))
            }
        }

        return msgData
    }
}
