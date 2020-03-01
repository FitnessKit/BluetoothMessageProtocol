//
//  CharacteristicBatteryLevel.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/12/17.
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

/// BLE Battery Level Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicBatteryLevel: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Battery Level" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A19" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Battery Level
    ///
    /// The current charge level of a battery. 100% represents fully charged
    /// while 0% represents fully discharged.
    ///
    private(set) public var level: Measurement<UnitPercent>
    
    /// Creates Battery Level Characteristic
    ///
    /// - Parameter level: Percent Battery Level
    public init(level: Measurement<UnitPercent>) {
        self.level = level
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode(with data: Data) -> Result<CharacteristicBatteryLevel, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let percent = Double(decoder.decodeUInt8(data))
        
        let level = Measurement(value: percent, unit: UnitPercent.percent)
        
        return.success(CharacteristicBatteryLevel(level: level))
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        
        guard kBatteryBounds.contains(level.value) else {
            return.failure(BluetoothEncodeError.boundsError(title: "Battery level must be between",
                                                            msg: "Percent",
                                                            range: kBatteryBounds))
        }
        
        var msgData = Data()
        
        msgData.append(Data(from: Int8(level.value)))
        
        return.success(msgData)
    }
}
