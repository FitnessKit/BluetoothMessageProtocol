//
//  CharacteristicTimeWithDst.swift
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

/// BLE Tilme DST Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicTimeWithDst: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Time with DST" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A11" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Time
    private(set) public var time: DateTime
    
    /// DST Offset
    private(set) public var dstOffset: DSTOffset
    
    /// Creates Time With DST Characteristic
    /// - Parameters:
    ///   - time: Timezone
    ///   - dstOffset: Daylight Savings Offset
    public init(time: DateTime, dstOffset: DSTOffset) {
        self.time = time
        self.dstOffset = dstOffset
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let time = DateTime.decode(data, decoder: &decoder)
        let dstOffset = DSTOffset(rawValue: decoder.decodeUInt8(data)) ?? .unknown
        
        let char = CharacteristicTimeWithDst(time: time, dstOffset: dstOffset)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        let result = time.encode()
        switch result {
        case .success(let dateTimeData):
            msgData.append(dateTimeData)
            
        case .failure(let error):
            return.failure(error)
        }
        msgData.append(dstOffset.rawValue)
        
        return.success(msgData)
    }
    
}

extension CharacteristicTimeWithDst: Hashable {
    
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
        hasher.combine(time)
        hasher.combine(dstOffset)
    }
}

extension CharacteristicTimeWithDst: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicTimeWithDst, rhs: CharacteristicTimeWithDst) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.time == rhs.time)
            && (lhs.dstOffset == rhs.dstOffset)
    }
}
