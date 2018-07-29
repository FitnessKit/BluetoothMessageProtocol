//
//  MeshTransitionTime.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/29/18.
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

/// Transition Time state determines how long an element shall take to transition
/// from a present state to a new state
public struct MeshTransitionTime {

    /// Transitions Steps
    public enum Step {
        /// The Transition Time is immediate.
        case immediate
        /// Number of Steps
        case steps(UInt8)
        /// The value is unknown
        ///
        /// The state cannot be set to this value, but an element may report
        /// an unknown value if a transition is higher than 0x3E or not determined.
        case unknown

        /// Raw UInt8 Value for Steps
        public var rawValue: UInt8 {
            switch self {
            case .immediate:
                return 0
            case .steps(let steps):
                return steps
            case .unknown:
                return 0x3F
            }
        }

        /// Create Step
        ///
        /// - Returns: Step
        public static func create(_ value: UInt8) -> Step {
            if value == UInt8.min {
                return Step.immediate

            } else if value == 0x3F {
                return Step.unknown

            } else {
                return Step.steps(value)
            }
        }
    }

    /// Transition Step Resolution
    public enum Resolution: UInt8, Codable {
        /// Transition Step Resolution is 100 milliseconds
        case hundredMilliseconds    = 0
        /// Transition Step Resolution is 1 second
        case oneSecond              = 1
        /// Transition Step Resolution is 10 seconds
        case tenSeconds             = 2
        /// Transition Step Resolution is 10 minutes
        case tenMinutes             = 3

        /// String Value for the Enum
        public var description: String {
            return String(describing: self)
        }
    }

    /// Transitions Steps
    private(set) public var steps: Step

    /// Resolution of Transition
    private(set) public var resolution: Resolution

    /// Raw Value
    public var rawValue: UInt8 {
        var value: UInt8 = steps.rawValue
        value |= resolution.rawValue << 6

        return UInt8(value)
    }

    /// Create Mest Transition Time
    ///
    /// - Parameters:
    ///   - steps: Steps
    ///   - resolution: Resolution
    public init(steps: Step, resolution: Resolution) {
        self.steps = steps
        self.resolution = resolution
    }

    /// Create MeshTransitionTime
    ///
    /// - Parameter value: Raw Value for MeshTransitionTime
    internal init(_ value: UInt8) {

        self.steps = Step.create((value & 0x3F))
        self.resolution = Resolution(rawValue: (value & 0xC0) >> 6) ?? .oneSecond

    }
}
