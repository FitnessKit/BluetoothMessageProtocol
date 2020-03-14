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
final public class ManufacturerDataPolarHeartRate: ManufacturerData {
    enum CodeKeys: CodingKey {
        case manufacturer
        case heartRate
    }
    
    /// Manufacturer
    public var manufacturer: CompanyIdentifier
    
    /// Data
    public var specificData: Data?
    
    /// Heartrate
    private(set) public var heartRate: Measurement<UnitCadence>
    
    /// Creates Polar Heart Rate Manufacturer Specific Data class
    ///
    /// - Parameter heartRate: Heartrate
    public init(heartRate: Measurement<UnitCadence>) {
        self.manufacturer = .polar
        self.specificData = nil
        self.heartRate = heartRate
    }
    
    /// Creates Polar Heart Rate Manufacturer Specific Data class
    ///
    /// - Parameter heartRate: Heartrate
    public convenience init(heartRate: UInt8) {
        let hr = Measurement(value: Double(heartRate), unit: UnitCadence.beatsPerMinute)
        
        self.init(heartRate: hr)
    }
    
    public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    internal convenience init(heartRate: Measurement<UnitCadence>, rawData: Data) {
        self.init(heartRate: heartRate)
        self.specificData = rawData
    }
    
    /// Decodes Polar Heart Rate Manufacturer Specific Data
    ///
    /// - Parameter data: ManufacturerData Data
    /// - Returns: ManufacturerData Result
    public class func decode(with data: Data) -> Result<ManufacturerDataPolarHeartRate, BluetoothDecodeError> {
        let man = ManufacturerSpecificData(rawData: data)
        
        guard man.manufacturer == .polar else {
            return.failure(BluetoothDecodeError.wrongIdentifier(.polar)) 
        }
        
        guard let data = man.specificData else {return.failure(BluetoothDecodeError.noManufacturerSpecificData)}
        
        //OH1 sends out different data on scan vs passive.  The smaller one has the HR data in it.
        //OH1 sends 5 Bytes.
        //H7/H10 sends 6 Bytes.
        guard data.count <= 6 else {
            return.failure(BluetoothDecodeError.general("Manufacturer Data is not compatable for HR Decode.")) 
        }
        
        var decoder = DecodeData()
        
        _ = decoder.decodeUInt16(data)
        
        let hrOne = decoder.decodeUInt8(data)
        let hrTwo = decoder.decodeUInt8(data)
        
        let heartRate = safeAverage(valueOne: hrOne, valueTwo: hrTwo)
        
        let hr: Measurement = Measurement(value: heartRate, unit: UnitCadence.beatsPerMinute)
        
        let polar = ManufacturerDataPolarHeartRate(heartRate: hr, rawData: data)
        return.success(polar)
    }
    
    /// Encodes Polar Heart Rate Manufacturer Specific Data
    ///
    /// - Returns: ManufacturerData Result
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
        var container = encoder.container(keyedBy: CodeKeys.self)
        
        try container.encode(manufacturer, forKey: .manufacturer)
        try container.encode(heartRate, forKey: .heartRate)
    }
}

extension ManufacturerDataPolarHeartRate: Hashable {

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
        hasher.combine(manufacturer)
        hasher.combine(specificData)
        hasher.combine(heartRate)
    }
}

extension ManufacturerDataPolarHeartRate: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ManufacturerDataPolarHeartRate, rhs: ManufacturerDataPolarHeartRate) -> Bool {
        return (lhs.manufacturer == rhs.manufacturer) &&
            (lhs.specificData == rhs.specificData) &&
            (lhs.heartRate == rhs.heartRate)
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
