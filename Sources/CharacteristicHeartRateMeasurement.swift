//
//  CharacteristicHeartRateMeasurement.swift
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


@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
/// BLE Heart Rate Meassurement Characteristic
open class CharacteristicHeartRateMeasurement: Characteristic {

    public static var name: String {
        return "Heart Rate Meassurement"
    }

    public static var uuidString: String {
        return "2A37"
    }

    /// Contact Status of Sensor
    public enum ContactStatus: UInt8 {
        case notSupported       = 0
        case stillNotSupportd   = 1
        case notDetected        = 2
        case detected           = 3

        public var stringValue: String {

            switch self {
            case .notSupported, .stillNotSupportd:
                return "Sensor Contact feature is not supported"
            case .notDetected:
                return "Sensor Contact not detected"
            case .detected:
                return "Sensor Contact detected"
            }
        }
    }

    fileprivate struct Flags {
        public var formatIsUInt16: Bool
        public var contact: ContactStatus
        public var energyExpended: Bool
        public var rrPresent: Bool

        public var uint8Value: UInt8 {
            var value: UInt8 = UInt8(formatIsUInt16 == true ? 1 : 0)
            value |= contact.rawValue << 1
            value |=  UInt8(energyExpended == true ? 1 : 0) << 3
            value |=  UInt8(rrPresent == true ? 1 : 0) << 4

            return UInt8(value)
        }

        public init(_ value: UInt8) {
            self.formatIsUInt16 = (value & 0x01).boolValue

            let contactStatusBits = (value | 0x06) >> 1

            contact = ContactStatus(rawValue: contactStatusBits) ?? .notSupported

            energyExpended = (value & 0x08 == 0x08)

            rrPresent = (value & 0x10 == 0x10)

        }

        public init(formatIsUInt16: Bool, contactStatus: ContactStatus, energyExpended: Bool, rrPresent: Bool) {
            self.formatIsUInt16 = formatIsUInt16
            self.contact = contactStatus
            self.energyExpended = energyExpended
            self.rrPresent = rrPresent
        }
    }

    /// Contact status of sensor
    private(set) public var contactStatus: ContactStatus = .notSupported

    /// Heart Rate Value
    private(set) public var heartRate: Measurement<UnitCadence>

    /// Energy Expended
    private(set) public var energyExpended: Measurement<UnitEnergy>?

    /// RR-Interval
    private(set) public var rrIntervals: [Measurement<UnitDuration>]?


    public init(contactStatus: ContactStatus, heartRate: Measurement<UnitCadence>, energyExpended: Measurement<UnitEnergy>? = nil, rrIntervals: [Measurement<UnitDuration>]? = nil) {

        self.contactStatus = contactStatus
        self.heartRate = heartRate
        self.energyExpended = energyExpended
        self.rrIntervals = rrIntervals

        super.init(name: CharacteristicHeartRateMeasurement.name, uuidString: CharacteristicHeartRateMeasurement.uuidString)
    }


    open override class func decode(data: Data) throws -> CharacteristicHeartRateMeasurement {

        var decoder = DataDecoder(data)

        let flags = Flags(decoder.decodeUInt8())

        let contactStatus = flags.contact

        var heartRate: Measurement = Measurement(value: 0, unit: UnitCadence(symbol: "BPM"))

        if flags.formatIsUInt16 == false {
            heartRate.value = Double(decoder.decodeUInt8())
        } else {
            heartRate.value = Double(decoder.decodeUInt16())
        }

        var energy: Measurement<UnitEnergy>? = nil

        if flags.energyExpended == true {
            let expended = decoder.decodeUInt16()
            energy = Measurement(value: Double(expended), unit: UnitEnergy.kilojoules)
        }

        var rrIntervals: [Measurement<UnitDuration>]?

        //RR Intervals
        if flags.rrPresent == true {

            var seconds = decoder.decodeUInt16()

            while seconds != 0 {
                let interval = Measurement(value: Double(seconds), unit: UnitDuration.seconds)

                if rrIntervals == nil {
                    rrIntervals = [Measurement<UnitDuration>]()
                }
                rrIntervals?.append(interval)

                seconds = decoder.decodeUInt16()
            }
        }

        return CharacteristicHeartRateMeasurement(contactStatus: contactStatus, heartRate: heartRate, energyExpended: energy, rrIntervals: rrIntervals)
    }

    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError.init(.unsupported)
    }

}

