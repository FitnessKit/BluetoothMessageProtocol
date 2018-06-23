//
//  BluetoothSensorLocations.swift
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

/// Location of Sensor on Body
@available(swift 4.0)
public enum BodyLocation: UInt8, Codable {
    /// Other
    case other      = 0
    /// Chest
    case chest      = 1
    /// Wrist
    case wrist      = 2
    /// Finger
    case finger     = 3
    /// Hand
    case hand       = 4
    /// Ear Lobe
    case earLobe    = 5
    /// Foot
    case foot       = 6

    /// String Value for Body Location
    public var stringValue: String {

        switch self {
        case .other:
            return "Other"
        case .chest:
            return "Chest"
        case .wrist:
            return "Wrist"
        case .finger:
            return "Finger"
        case .hand:
            return "Hand"
        case .earLobe:
            return "Ear Lobe"
        case .foot:
            return "Foot"
        }
    }

    /// String Value for the Enum
    public var description: String {
        return String(describing: self)
    }
}

/// Location of Sensor
public enum SensorLocation: UInt8 {
    /// Other
    case other              = 0
    /// Top of shoe
    case topOfShoe          = 1
    /// In Shoe
    case inShoe             = 2
    /// Hip
    case hip                = 3
    /// Front Wheel
    case frontWheel         = 4
    /// Left Crank
    case leftCrank          = 5
    /// Right Crank
    case rightCrank         = 6
    /// Left Pedal
    case leftPedal          = 7
    /// Right Pedal
    case rightPedal         = 8
    /// Front Hub
    case frontHub           = 9
    /// Rear Dropout
    case rearDropout        = 10
    /// Chainstay
    case chainstay          = 11
    /// Rear Wheel
    case rearWheel          = 12
    /// Rear Hub
    case rearHub            = 13
    /// Chest
    case chest              = 14
    /// Spider
    case spider             = 15
    /// Chain Ring
    case chainRing          = 16

    /// String Representation
    public var stringValue: String {

        switch self {
        case .other:
            return "Other"
        case .topOfShoe:
            return "Top of shoe"
        case .inShoe:
            return "In Shoe"
        case .hip:
            return "Hip"
        case .frontWheel:
            return "Front Wheel"
        case .leftCrank:
            return "Left Crank"
        case .rightCrank:
            return "Right Crank"
        case .leftPedal:
            return "Left Pedal"
        case .rightPedal:
            return "Right Pedal"
        case .frontHub:
            return "Front Hub"
        case .rearDropout:
            return "Rear Dropout"
        case .chainstay:
            return "Chainstay"
        case .rearWheel:
            return "Rear Wheel"
        case .rearHub:
            return "Rear Hub"
        case .chest:
            return "Chest"
        case .spider:
            return "Spider"
        case .chainRing:
            return "Chain Ring"
        }
    }

    /// String Value for the Enum
    public var description: String {
        return String(describing: self)
    }
}
