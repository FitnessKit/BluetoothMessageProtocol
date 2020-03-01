//
//  CharacteristicTimeZone.swift
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

/// BLE Time Zone Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicTimeZone: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Time Zone" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A0E" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Time Zone
    ///
    /// Offset from UTC in number of 15 minutes increments.  The offset defined
    /// in this characteristic is constant, regardless whether daylight savings
    /// is in effect
    private(set) public var timeZone: BluetoothTimeZone
    
    /// Creates Time Zone Characteristic
    ///
    /// - Parameter timeZone: Offset from UTC
    public init(timeZone: BluetoothTimeZone) {
        self.timeZone = timeZone
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode(with data: Data) -> Result<CharacteristicTimeZone, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let value = decoder.decodeInt8(data)
        let timezone = BluetoothTimeZone(rawValue: value) ?? .unknown
        
        let char = CharacteristicTimeZone(timeZone: timezone)
        return.success(char)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        msgData.append(Data(from: timeZone.rawValue))
        
        return.success(msgData)
    }
}
