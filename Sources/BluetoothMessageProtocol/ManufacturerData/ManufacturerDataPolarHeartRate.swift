//
//  ManufacturerDataPolarHeartRate.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/6/17.
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

/// Polar Heart Rate Manufacturer Specific Data
///
/// Polar H7 supported
/// Polar H10 supported
///
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ManufacturerDataPolarHeartRate: ManufacturerData {

    /// Heartrate
    private(set) public var heartRate: Measurement<UnitCadence>

    /// Creates Polar Heart Rate Manufacturer Specific Data class
    ///
    /// - Parameter heartRate: Heartrate
    public init(heartRate: Measurement<UnitCadence>) {

        self.heartRate = heartRate
        super.init(manufacturer: .polar, specificData: nil)
    }

    /// Creates Polar Heart Rate Manufacturer Specific Data class
    ///
    /// - Parameter heartRate: Heartrate
    public convenience init(heartRate: UInt8) {
        let hr = Measurement(value: Double(heartRate), unit: UnitCadence.beatsPerMinute)

        self.init(heartRate: hr)
    }

    internal init(heartRate: Measurement<UnitCadence>, rawData: Data) {
        self.heartRate = heartRate

        super.init(manufacturer: .polar, specificData: rawData)
    }

    /// Decodes Polar Heart Rate Manufacturer Specific Data
    ///
    /// - Parameter data: Manufacturer Specific Data
    /// - Returns: ManufacturerDataPolarHeartRate
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> ManufacturerDataPolarHeartRate {

        let man = ManufacturerData(rawData: data)

        guard man.manufacturer == .polar else {
            throw BluetoothMessageProtocolError.wrongIdentifier(.polar)
        }

        if let data = man.specificData {

            //OH1 sends out different data on scan vs passive.  The smaller one has the HR data in it.
            //OH1 sends 5 Bytes.
            //H7/H10 sends 6 Bytes.
            guard data.count <= 6 else {
                throw BluetoothMessageProtocolError.decode("Manufacturer Data is not compatable for HR Decode.")
            }

            var decoder = DecodeData()

            _ = decoder.decodeUInt16(data)

            let hrOne = decoder.decodeUInt8(data)
            let hrTwo = decoder.decodeUInt8(data)

            let heartRate = safeAverage(valueOne: hrOne, valueTwo: hrTwo)

            let hr: Measurement = Measurement(value: heartRate, unit: UnitCadence.beatsPerMinute)
            
            return ManufacturerDataPolarHeartRate(heartRate: hr, rawData: data)

        } else {
            throw BluetoothMessageProtocolError.noManufacturerSpecificData
        }
    }

    /// Encodes Polar Heart Rate Manufacturer Specific Data
    ///
    /// - Returns: Manufacturer Specific Data
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError(.unsupported)
    }

    enum CodeKeys: CodingKey {
        case heartRate
    }

    public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
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
    open override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodeKeys.self)
        try super.encode(to: encoder)

        try container.encode(heartRate, forKey: .heartRate)
    }
}

/// Provides a Safe Average Number
///
/// Takes an Average of the two numbers, if either is zero it will use the non zero number
///
/// - Parameters:
///   - valueOne: Value One for Average
///   - valueTwo: Value Two for Average
/// - Returns: Average of the Two numbers.
private func safeAverage(valueOne: UInt8, valueTwo: UInt8) -> Double {
    var avg: Double = 0

    if valueTwo > 0 && valueOne > 0 {
        avg = Double(valueOne + valueTwo) / 2
    } else if valueOne <= 0 {
        avg = Double(valueTwo)
    } else {
        avg = Double(valueOne)
    }

    return avg
}
