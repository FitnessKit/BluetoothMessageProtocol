//
//  CharacteristicTxPowerLevel.swift
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

/// BLE Tx Power Level Characteristic
///
/// The Transmit Power Level characteristic represents the current transmit power
/// level in dBm, and the level ranges from -100 dBm to +20 dBm to a resolution of 1 dBm.
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicTxPowerLevel: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Tx Power Level" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A95" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Tx Power Level
    private(set) public var txPower: Int8
    
    /// Creates Tx Power Level Characteristic
    ///
    /// - Parameter txPower: Tx Power Level
    public init(txPower: Int8) {
        self.txPower = txPower
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let txPower = decoder.decodeInt8(data)
        
        let char = CharacteristicTxPowerLevel(txPower: txPower)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        
        guard kTxPowerLevelBounds.contains(Int(txPower)) else {
            return.failure(BluetoothEncodeError.boundsError(title: "Tx Power Level must be between",
                                                            range: kTxPowerLevelBounds))
        }
        
        var msgData = Data()
        
        msgData.append(Data(from: Int8(txPower)))
        
        return.success(msgData)
    }
}

extension CharacteristicTxPowerLevel: Hashable {
    
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
        hasher.combine(txPower)
    }
}

extension CharacteristicTxPowerLevel: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicTxPowerLevel, rhs: CharacteristicTxPowerLevel) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.txPower == rhs.txPower)
    }
}
