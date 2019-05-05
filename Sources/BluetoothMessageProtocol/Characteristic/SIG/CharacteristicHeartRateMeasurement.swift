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

/// BLE Heart Rate Meassurement Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicHeartRateMeasurement: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Heart Rate Meassurement"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A37"
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
    public init(contactStatus: HeartRateContactStatus,
                heartRate: Measurement<UnitCadence>,
                energyExpended: Measurement<UnitEnergy>? = nil,
                rrIntervals: [Measurement<UnitDuration>]? = nil) {
        
        self.contactStatus = contactStatus
        self.heartRate = heartRate
        self.energyExpended = energyExpended
        self.rrIntervals = rrIntervals

        super.init(name: CharacteristicHeartRateMeasurement.name,
                   uuidString: CharacteristicHeartRateMeasurement.uuidString)
    }

    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    open override class func decoder<C: CharacteristicHeartRateMeasurement>(data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let flags = HeartRateMeasurementFlags(decoder.decodeUInt8(data))
        
        let contactStatus = flags.contact
        
        var heartRate: Measurement = Measurement(value: 0, unit: UnitCadence.beatsPerMinute)
        
        if flags.valueFormat == .uint16 {
            heartRate.value = Double(decoder.decodeUInt16(data))
        } else {
            heartRate.value = Double(decoder.decodeUInt8(data))
        }
        
        var energy: Measurement<UnitEnergy>? = nil
        
        if flags.isEnergyExpendedPresent {
            let expended = decoder.decodeUInt16(data)
            energy = Measurement(value: Double(expended), unit: UnitEnergy.kilojoules)
        }
        
        var rrIntervals: [Measurement<UnitDuration>]?
        
        //RR Intervals
        if flags.isRRIntervalPresent {
            
            var seconds = decoder.decodeUInt16(data)
            
            while seconds != 0 {
                let interval = Measurement(value: (Double(seconds) / 1024), unit: UnitDuration.seconds)
                
                if rrIntervals == nil {
                    rrIntervals = [Measurement<UnitDuration>]()
                }
                rrIntervals?.append(interval)
                
                seconds = decoder.decodeUInt16(data)
            }
        }
        
        let char = CharacteristicHeartRateMeasurement(contactStatus: contactStatus,
                                                      heartRate: heartRate,
                                                      energyExpended: energy,
                                                      rrIntervals: rrIntervals)
        return.success(char as! C)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothDecodeError
    @available(*, deprecated, message: "use results based decoder instead")
    open override class func decode(data: Data) throws -> CharacteristicHeartRateMeasurement {
        return try decoder(data: data).get()
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    open override func encode() -> Result<Data, BluetoothEncodeError> {
        /// Not Yet Supported
        return.failure(BluetoothEncodeError.notSupported)
    }
}
