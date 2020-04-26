//
//  CharacteristicAlertCategoryIDBitMask.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 4/26/20.
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

/// BLE Alert Category ID Bit Mask Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicAlertCategoryIDBitMask: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Alert Category ID Bit Mask" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A42" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }

    public struct BitMaskOne: OptionSet, Hashable {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        /// Simple Alert Supported
        public static let simpleAlertSupported  = BitMaskOne(rawValue: 1 << 0)
        /// Email Supported
        public static let emailSupported        = BitMaskOne(rawValue: 1 << 1)
        /// News Supported
        public static let newsSupported         = BitMaskOne(rawValue: 1 << 2)
        /// Call Supported
        public static let callSupported         = BitMaskOne(rawValue: 1 << 3)
        /// Missed Call Supported
        public static let missedCallSupported   = BitMaskOne(rawValue: 1 << 4)
        /// SMS/MMS Supported
        public static let textMessageSupported  = BitMaskOne(rawValue: 1 << 5)
        /// Voice Mail Supported
        public static let voiceMailSupported    = BitMaskOne(rawValue: 1 << 6)
        /// Schedule Supported
        public static let scheduleSupported     = BitMaskOne(rawValue: 1 << 7)
    }

    public struct BitMaskTwo: OptionSet, Hashable {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        /// High Prioritized Alert Supported
        public static let highPrioritizedAlertSupported = BitMaskTwo(rawValue: 1 << 0)
        /// Instant Message Supported
        public static let instantMessageSupported       = BitMaskTwo(rawValue: 1 << 1)
    }
    
    /// BitMask One Options
    private(set) public var categoriesOne: BitMaskOne

    /// BitMask Two Options
    private(set) public var categoriesTwo: BitMaskTwo
    
    /// Creates Alert Category ID Bit Mask Characteristic
    /// - Parameters:
    ///   - categoriesOne: `BitMaskOne`
    ///   - categoriesTwo: `BitMaskTwo`
    public init(categoriesOne: BitMaskOne, categoriesTwo: BitMaskTwo) {
        self.categoriesOne = categoriesOne
        self.categoriesTwo = categoriesTwo
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let firstOptions = BitMaskOne(rawValue: decoder.decodeUInt8(data))
        let secondOptions = BitMaskTwo(rawValue: decoder.decodeUInt8(data))

        let char = CharacteristicAlertCategoryIDBitMask(categoriesOne: firstOptions,
                                                        categoriesTwo: secondOptions)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        msgData.append(categoriesOne.rawValue)
        msgData.append(categoriesTwo.rawValue)

        return.success(msgData)
    }
}

extension CharacteristicAlertCategoryIDBitMask: Hashable {
    
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
        hasher.combine(categoriesOne)
        hasher.combine(categoriesTwo)
    }
}

extension CharacteristicAlertCategoryIDBitMask: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicAlertCategoryIDBitMask, rhs: CharacteristicAlertCategoryIDBitMask) -> Bool {
        return (lhs.categoriesOne == rhs.categoriesOne)
            && (lhs.categoriesTwo == rhs.categoriesTwo)
    }
}
