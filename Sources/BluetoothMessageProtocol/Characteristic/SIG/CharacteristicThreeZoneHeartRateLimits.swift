//
//  CharacteristicThreeZoneHeartRateLimits.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/26/17.
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

/// BLE Three Zone Heart Rate Limits Characteristic
///
/// The limits between the heart rate zones for the 3-zone heart rate definition
/// - Hard
/// - Moderate
/// - Light
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicThreeZoneHeartRateLimits: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Three Zone Heart Rate Limits" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A94" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Light
    ///
    /// Light (Fat burn) / Moderate (Aerobic) Limit
    private(set) public var lightHeartRate: Measurement<UnitCadence>
    
    /// Moderate
    ///
    /// Moderate (Aerobic) / Hard (Anaerobic) Limit
    private(set) public var moderateHeartRate: Measurement<UnitCadence>
    
    /// Creates Three Zone Heart Rate Limits Characteristic
    ///
    /// - Parameters:
    ///   - lightHeartRate: Light (Fat burn) / Moderate (Aerobic) Limit
    ///   - moderateHeartRate: Moderate (Aerobic) / Hard (Anaerobic) Limit
    public init(lightHeartRate: UInt8, moderateHeartRate: UInt8) {
        self.lightHeartRate = Measurement(value: Double(lightHeartRate), unit: UnitCadence.beatsPerMinute)
        self.moderateHeartRate = Measurement(value: Double(moderateHeartRate), unit: UnitCadence.beatsPerMinute)
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode(with data: Data) -> Result<CharacteristicThreeZoneHeartRateLimits, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let lightHeartRate: UInt8 = decoder.decodeUInt8(data)
        let moderateHeartRate: UInt8 = decoder.decodeUInt8(data)
        
        let char = CharacteristicThreeZoneHeartRateLimits(lightHeartRate: lightHeartRate,
                                                          moderateHeartRate: moderateHeartRate)
        return.success(char)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        msgData.append(Data(from: UInt8(lightHeartRate.value)))
        msgData.append(Data(from: UInt8(moderateHeartRate.value)))
        
        return.success(msgData)
    }
}
