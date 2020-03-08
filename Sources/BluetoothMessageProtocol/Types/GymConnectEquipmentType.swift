//
//  GymConnectEquipmentType.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 10/19/18.
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

/// GymConnect Equipment Type
///
/// Provides the Equipment Types for GymConnect
@available(swift 4.0)
public enum GymConnectEquipmentType: UInt8, Hashable {
    /// Unknown
    case unknown            = 0
    /// Treadmill
    case treadmill          = 1
    /// Bike
    case bike               = 2
    /// Stepper
    case stepper            = 3
    /// Step Mill
    case stepMill           = 4
    /// Cross Trainer / Elliptical
    case elliptical         = 5
    /// Total Body Trainer
    case totalBodyTrainer   = 6
    /// Tread Climber
    case treadClimber       = 7
    /// Rower
    case rower              = 8
    // 9 - 127 Reserved
    // 128 - 143 Treadmill Variant Reserved
    /// Bike - Recumbent
    case recumbentBike      = 144
    /// Bike - Upper Body Ergo
    case upperBodyErgo      = 145
    // 146 - 159 Bike Variant Reserved
    // 160 - 169 Stepper Variant Reserved
    // 170 - 179 Cross Trainer / Elliptical Variant Reserved
    // 180 - 189 Total Body Trainer Variant Reserved
    /// Kayak Ergo
    case kayakErgo          = 190
    // 191 - 199 Rower Variant Reserved
    // 200 - 255 Reserved
}

internal extension GymConnectEquipmentType {

    /// Create a GymConnectEquipmentType
    ///
    /// - Parameter rawValue: Raw Equpment Type value
    /// - Returns: GymConnectEquipmentType
    static func create(_ rawValue: UInt8) -> GymConnectEquipmentType {

        switch rawValue {
        case 0:
            return .unknown
        case 1:
            return .treadmill
        case 2:
            return .bike
        case 3:
            return .stepper
        case 4:
            return .stepMill
        case 5:
            return .elliptical
        case 6:
            return .totalBodyTrainer
        case 7:
            return .treadClimber
        case 8:
            return .rower
        case 128...143:
            return .treadmill
        case 144:
            return .recumbentBike
        case 145:
            return .upperBodyErgo
        case 146...159:
            return .bike
        case 160...169:
            return .stepper
        case 170...179:
            return .elliptical
        case 180...189:
            return .totalBodyTrainer
        case 190:
            return .kayakErgo
        case 191...199:
            return .rower

        default:
            return .unknown
        }
    }
}

extension GymConnectEquipmentType {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension GymConnectEquipmentType: Encodable {

    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: TypeValueCodingKeys.self)

        /// Prefer the name of the type over a raw value
        try container.encode(self.rawValue, forKey: .value)
        try container.encode(self.description, forKey: .type)
    }
}
