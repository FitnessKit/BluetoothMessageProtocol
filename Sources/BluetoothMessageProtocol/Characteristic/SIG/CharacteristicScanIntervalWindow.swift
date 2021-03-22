//
//  CharacteristicScanIntervalWindow.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 5/2/20.
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

/// BLE Scan Interval Window Characteristic
///
/// The Scan Interval Window characteristic is used to store the scan parameters of the GATT Client.
/// The GATT Server can use these values to optimize its own advertisement rate and to minimize the
/// rate of its own advertisements while also minimizing the latency of reconnections
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicScanIntervalWindow: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Scan Interval Window" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A4F" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Scan Interval
    private(set) public var interval: UInt16
    
    /// Scan Window
    private(set) public var window: UInt16
        
    /// Creates Scan Interval Window Characteristic
    /// - Parameters:
    ///   - interval: Scan Interval
    ///   - window: Scan Window
    public init(interval: UInt16, window: UInt16) {
        self.interval = interval
        self.window = window
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let interval = decoder.decodeUInt16(data)
        let window = decoder.decodeUInt16(data)
        
        let char = CharacteristicScanIntervalWindow(interval: interval, window: window)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        msgData.append(Data(from: interval.littleEndian))
        msgData.append(Data(from: window.littleEndian))
        
        return.success(msgData)
    }
}

extension CharacteristicScanIntervalWindow: Hashable {
    
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
        hasher.combine(uuidString)
        hasher.combine(interval)
        hasher.combine(window)
    }
}

extension CharacteristicScanIntervalWindow: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicScanIntervalWindow, rhs: CharacteristicScanIntervalWindow) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.interval == rhs.interval)
            && (lhs.window == rhs.window)
    }
}
