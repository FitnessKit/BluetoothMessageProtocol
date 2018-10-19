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
public struct GymConnectEquipmentType: Codable {

    /// Equipment Type Value
    internal(set) public var value: UInt8

    /// Equipment Type Name
    internal(set) public var name: String

    /// Creates GymConnect Equipment Type
    ///
    /// - Parameters:
    ///   - value: Equipment Type Value
    ///   - name: Equipment Type Name
    internal init(value: UInt8, name: String) {

        self.value = value
        self.name = name
    }

    /// Creates GymConnect Equipment Type
    ///
    /// - Parameter value: Raw Value for Type
    public init(_ value: UInt8) {

        switch value {
        case 0:
            self.init(value: GymConnectEquipmentType.unknown.value,
                      name: GymConnectEquipmentType.unknown.name)
        case 1:
            self.init(value: GymConnectEquipmentType.treadmill.value,
                      name: GymConnectEquipmentType.treadmill.name)
        case 2:
            self.init(value: GymConnectEquipmentType.bike.value,
                      name: GymConnectEquipmentType.bike.name)
        case 3:
            self.init(value: GymConnectEquipmentType.stepper.value,
                      name: GymConnectEquipmentType.stepper.name)
        case 4:
            self.init(value: GymConnectEquipmentType.stepMill.value,
                      name: GymConnectEquipmentType.stepMill.name)
        case 5:
            self.init(value: GymConnectEquipmentType.elliptical.value,
                      name: GymConnectEquipmentType.elliptical.name)
        case 6:
            self.init(value: GymConnectEquipmentType.totalBodyTrainer.value,
                      name: GymConnectEquipmentType.totalBodyTrainer.name)
        case 7:
            self.init(value: GymConnectEquipmentType.treadClimber.value,
                      name: GymConnectEquipmentType.treadClimber.name)
        case 8:
            self.init(value: GymConnectEquipmentType.rower.value,
                      name: GymConnectEquipmentType.rower.name)
        case 128...143:
            self.init(value: value,
                      name: "Tradmill Variant")
        case 144:
            self.init(value: GymConnectEquipmentType.recumbentBike.value,
                      name: GymConnectEquipmentType.recumbentBike.name)
        case 145...159:
            self.init(value: value,
                      name: "Bike Variant")
        case 160...169:
            self.init(value: value,
                      name: "Stepper Variant")
        case 170...179:
            self.init(value: value,
                      name: "Elliptical/Cross Trainer Variant")
        case 180...189:
            self.init(value: value,
                      name: "Total Body Trainer Variant")
        case 190...199:
            self.init(value: value,
                      name: "Rower Variant")

        default:
            self.init(value: GymConnectEquipmentType.unknown.value,
                      name: GymConnectEquipmentType.unknown.name)
        }

    }

}

extension GymConnectEquipmentType {

    /// Unknown Equipment Type
    public static var unknown: GymConnectEquipmentType {
        return GymConnectEquipmentType(value: 0, name: "Unknown")
    }

    /// Treadmill
    public static var treadmill: GymConnectEquipmentType {
        return GymConnectEquipmentType(value: 1, name: "Treadmill")
    }

    /// Bike
    public static var bike: GymConnectEquipmentType {
        return GymConnectEquipmentType(value: 2, name: "Bike")
    }

    /// Stepper
    public static var stepper: GymConnectEquipmentType {
        return GymConnectEquipmentType(value: 3, name: "Stepper")
    }

    /// Step Mill
    public static var stepMill: GymConnectEquipmentType {
        return GymConnectEquipmentType(value: 4, name: "Step Mill")
    }

    /// Elliptical / Cross Trainer
    public static var elliptical: GymConnectEquipmentType {
        return GymConnectEquipmentType(value: 5, name: "Elliptical")
    }

    /// Total Body Trainer
    public static var totalBodyTrainer: GymConnectEquipmentType {
        return GymConnectEquipmentType(value: 6, name: "Total Body Trainer")
    }

    /// Tread Climber
    public static var treadClimber: GymConnectEquipmentType {
        return GymConnectEquipmentType(value: 7, name: "Tread Climber")
    }

    /// Rower
    public static var rower: GymConnectEquipmentType {
        return GymConnectEquipmentType(value: 8, name: "Rower")
    }

    /// Recumbent Bike
    public static var recumbentBike: GymConnectEquipmentType {
        return GymConnectEquipmentType(value: 144, name: "Recumbent Bike")
    }

}

extension GymConnectEquipmentType: Hashable {

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    public var hashValue: Int {
        return "\(name)\(value)".hashValue
    }
}

extension GymConnectEquipmentType: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static public func == (lhs: GymConnectEquipmentType, rhs: GymConnectEquipmentType) -> Bool {
        return (lhs.name == rhs.name) && (lhs.value == rhs.value)
    }
}
