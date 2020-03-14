//
//  CharacteristicCurrentTime.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/19/17.
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

/// BLE Current Time Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicCurrentTime: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Current Time" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A2B" }
    
    /// Adjustment Reasons
    public struct AdjustReasons: OptionSet, Hashable {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        /// Manual time update
        public static let manualTimeUpdate              = AdjustReasons(rawValue: 1 << 0)
        /// External reference time update
        public static let externalReferenceTimeUpdate   = AdjustReasons(rawValue: 1 << 1)
        /// Change of time zone
        public static let changeOfTimeZone              = AdjustReasons(rawValue: 1 << 2)
        /// Change of DST (daylight savings time)
        public static let changeofDaylightSavings       = AdjustReasons(rawValue: 1 << 3)
    }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Current Time Adjust Reason
    private(set) public var adjustmentReason: AdjustReasons
    
    /// Time
    private(set) public var currentTime: DateTime
    
    /// Day of the Week
    private(set) public var dayOfWeek: DayOfWeek
    
    /// Fractional Seconds
    private(set) public var fractionalSeconds: Float
    
    /// Creates Current Time Characteristic
    ///
    /// - Parameters:
    ///   - adjustmentReason: Current Time Adjust Reason
    ///   - currentTime: Time
    ///   - dayOfWeek: Day of the Week
    ///   - fractionalSeconds: Fractional Seconds
    public init(adjustmentReason: AdjustReasons,
                currentTime: DateTime,
                dayOfWeek: DayOfWeek,
                fractionalSeconds: Float) {
        
        self.adjustmentReason = adjustmentReason
        self.currentTime = currentTime
        self.dayOfWeek = dayOfWeek
        self.fractionalSeconds = fractionalSeconds
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let currenTime = DateTime.decode(data, decoder: &decoder)
        
        let weekday = DayOfWeek(rawValue: decoder.decodeUInt8(data)) ?? .unknown
        
        let fractions = Float(decoder.decodeUInt8(data)) * ( 1 / 256)
        
        let reasons = AdjustReasons(rawValue: decoder.decodeUInt8(data))
        
        let char = CharacteristicCurrentTime(adjustmentReason: reasons,
                                             currentTime: currenTime,
                                             dayOfWeek: weekday,
                                             fractionalSeconds: fractions)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        switch currentTime.encode() {
        case .success(let dateTimeData):
            msgData.append(dateTimeData)
            
        case .failure(let error):
            return.failure(error)
        }
        
        msgData.append(dayOfWeek.rawValue)
        
        let frac = UInt8(fractionalSeconds * 256)
        msgData.append(frac)
        
        msgData.append(adjustmentReason.rawValue)
        
        return.success(msgData)
    }
}

extension CharacteristicCurrentTime: Hashable {
    
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
        hasher.combine(adjustmentReason)
        hasher.combine(currentTime)
        hasher.combine(dayOfWeek)
        hasher.combine(fractionalSeconds)
    }
}

extension CharacteristicCurrentTime: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicCurrentTime, rhs: CharacteristicCurrentTime) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.adjustmentReason == rhs.adjustmentReason)
            && (lhs.currentTime == rhs.currentTime)
            && (lhs.dayOfWeek == rhs.dayOfWeek)
            && (lhs.fractionalSeconds == rhs.fractionalSeconds)
    }
}
