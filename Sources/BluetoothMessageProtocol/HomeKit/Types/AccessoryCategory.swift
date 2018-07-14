//
//  AccessoryCategory.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/14/18.
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

/// HomeKit Accessory Categories
///
/// An accessory with support for multiple categories should advertise the primary
/// category. An accessory for which a primary category cannot be determined or the
/// primary category isn't among the well defined categories (2-9) falls in the
/// 'Other' category
public enum HomeKitAccessoryCategory: UInt16 {
    /// Unknonw
    case unknown            = 0
    /// Other
    case other              = 1
    /// Bridge
    case bridge             = 2
    /// Fan
    case fan                = 3
    /// Garage Door Openers
    case garageDoorOpener   = 4
    /// Lighting
    case lighting           = 5
    /// Locks
    case lock               = 6
    /// Outlet
    case outlet             = 7
    /// Switch
    case `switch`           = 8
    /// Thermostat
    case thermostat         = 9
    /// Sensor
    case sensor             = 10
    /// Security Systems
    case securitySystem     = 11
    /// Door
    case door               = 12
    /// Window
    case window             = 13
    /// Window Covering
    case windowCovering     = 14
    /// Programmable Switch
    case programmableSwitch = 15
    /// Range Extender
    case rangeExtender      = 16
    /// IP Camera
    case ipCamera           = 17
    /// Video Door Bell
    case videoDoorBell      = 18
    /// Air Purifier
    case airPurifier        = 19
    /// Header
    case heater             = 20
    /// Air Conditioner
    case airConditioner     = 21
    /// Humidifier
    case humidifier         = 22
    /// Dehumidifier
    case dehumidifier       = 23
    /// Sprinkler
    case sprinkler          = 28
    /// Faucet
    case faucet             = 29
    /// Shower System
    case showSystem         = 30
}

extension HomeKitAccessoryCategory {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension HomeKitAccessoryCategory: Encodable {

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
