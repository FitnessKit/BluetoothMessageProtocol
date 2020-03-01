//
//  CharacteristicMeasurementInterval.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/20/17.
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

/// BLE Measurement Interval Characteristic
///
/// The Measurement Interval characteristic defines the time between measurements
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicMeasurementInterval: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Measurement Interval" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A21" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Measurement Interval
    ///
    /// - note: values from 1 second to 65535 seconds
    private(set) public var interval: Measurement<UnitDuration>
    
    /// Creates Measurement Interval Characteristic
    ///
    /// - Parameter interval: Measurement Interval (1 second to 65535 second)
    public init(interval: Measurement<UnitDuration>) {
        self.interval = interval
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode(with data: Data) -> Result<CharacteristicMeasurementInterval, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let value = Double(decoder.decodeUInt16(data))
        
        let interval = Measurement(value: value, unit: UnitDuration.seconds)
        
        return.success(CharacteristicMeasurementInterval(interval: interval))
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        //Make sure we put this back to Seconds before we create Data
        let value = UInt16(interval.converted(to: UnitDuration.seconds).value)
        
        guard kBluetoothMeasurementIntervalBounds.contains(Int(value)) else {
            
            return.failure(BluetoothEncodeError.boundsError(title: "Measurement Interval must be between",
                                                            msg: "seconds",
                                                            range: kBluetoothMeasurementIntervalBounds))
        }
        
        var msgData = Data()
        
        msgData.append(Data(from: value.littleEndian))
        
        return.success(msgData)
    }
}
