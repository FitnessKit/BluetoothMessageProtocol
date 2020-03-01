//
//  CharacteristicNetworkAvailability.swift
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

/// BLE Network Availability Characteristic
///
/// The Network Availability characteristic represents if network is available or not available
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicNetworkAvailability: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Network Availability" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A3E" }
    
    /// Network Availability Types
    public enum Availability: UInt8 {
        /// No network available
        case notAvailable       = 0
        /// One or more networks available
        case available          = 1
    }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Network Availability
    private(set) public var networkAvailable: Availability
    
    /// Creates Network Availability Characteristic
    ///
    /// - Parameter networkAvailable: Network Availability
    public init(networkAvailable: Availability) {
        self.networkAvailable = networkAvailable
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode(with data: Data) -> Result<CharacteristicNetworkAvailability, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let avilability = Availability(rawValue: decoder.decodeUInt8(data)) ?? .notAvailable
        
        return.success(CharacteristicNetworkAvailability(networkAvailable: avilability))
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        msgData.append(networkAvailable.rawValue)
        
        return.success(msgData)
    }
}
