//
//  BloodPressureMeasurementStatus.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 5/3/20.
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

/// Blood Pressure Measurement Status
public struct BloodPressureMeasurementStatus {
    
    public enum PulseRateRange: UInt8, Hashable {
        /// Pulse rate is within the range
        case withinRange        = 0
        /// Pulse rate exceeds upper limit
        case exceedsUpperLimit  = 1
        /// Pulse rate is less than lower limit
        case lowerLmit          = 2
        
        /// Unknown
        case unknown            = 255
    }
    
    /// Body Movement Detection
    private(set) public var bodyMovementDetected: Bool
    /// Cuff Fit To Loose Detection
    private(set) public var cuffTooLoose: Bool
    /// Irregular Pulse Detection
    private(set) public var irregularPulseDetected: Bool
    /// Pulse Rate Range
    private(set) public var pulseRate: PulseRateRange
    /// Improper Measurement Position Detection
    private(set) public var impropertPositionDetected: Bool

    internal init(rawValue: UInt16) {
        let status = Status(rawValue: rawValue)
        
        self.bodyMovementDetected = status.contains(.bodyMovementDetected) ? true : false
        self.cuffTooLoose = status.contains(.cuffTooLoose) ? true : false
        self.irregularPulseDetected = status.contains(.irregularPulseDetected) ? true : false
        
        let range = UInt8(rawValue & 0x18 >> 3)
        self.pulseRate = PulseRateRange(rawValue: range) ?? .unknown

        self.impropertPositionDetected = status.contains(.impropertPositionDetected) ? true : false
    }
}

extension BloodPressureMeasurementStatus: Hashable {
    
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
        hasher.combine(bodyMovementDetected)
        hasher.combine(cuffTooLoose)
        hasher.combine(irregularPulseDetected)
        hasher.combine(pulseRate)
        hasher.combine(impropertPositionDetected)
    }
}

extension BloodPressureMeasurementStatus: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: BloodPressureMeasurementStatus, rhs: BloodPressureMeasurementStatus) -> Bool {
        return lhs.bodyMovementDetected == rhs.bodyMovementDetected
            && lhs.cuffTooLoose == rhs.cuffTooLoose
            && lhs.irregularPulseDetected == rhs.irregularPulseDetected
            && lhs.pulseRate == rhs.pulseRate
            && lhs.impropertPositionDetected == rhs.impropertPositionDetected
    }
}

private extension BloodPressureMeasurementStatus {
    
    struct Status: OptionSet {
        public let rawValue: UInt16
        public init(rawValue: UInt16) { self.rawValue = rawValue }
        
        /// Body Movement Detection Flag
        public static let bodyMovementDetected      = Status(rawValue: 1 << 0)
        /// Cuff Fit Detection Flag
        public static let cuffTooLoose              = Status(rawValue: 1 << 1)
        /// Irregular Pulse Detection
        public static let irregularPulseDetected    = Status(rawValue: 1 << 2)
        ///
        /// Flags 3 and 4 cover two bits for the PulseRateRange Enum
        ///
        /// Improper Measurement Position Detection
        public static let impropertPositionDetected = Status(rawValue: 1 << 5)
    }
}
