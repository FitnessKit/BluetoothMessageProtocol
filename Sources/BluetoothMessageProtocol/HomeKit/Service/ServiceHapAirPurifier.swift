//
//  ServiceHapAirPurifier.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/8/18.
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

/// HAP-BLE HomeKit Air Purifier Service
///
/// This service describes an air purifier. An air purifier accessory can have additional
/// linked services such as:
/// - Filter Maintenance service(s) to describe one or more air filters.
/// - Air Quality Sensor services to describe air quality sensors.
/// - Fan v2 (ServiceHapAdvancedFan) service to describe a fan which can be independently controlled.
/// - Slat service to control vents.
///
/// If Fan v2 (ServiceHapAdvancedFan) is included as a linked service in an air purifier accessory:
/// - Changing Active characteristic on the Air Purifier must result in corresponding change
///   to Active characteristic on the Fan v2.
/// - Changing Active characteristic on the Fan v2 from Inactive to Active does not require
///   the Active on the Air Purifier to change. This enables Fan Only mode on air purifier.
/// - Changing Active characteristic on the Fan v2 from Active to Inactive must result in the
///   Active on the Air Purifier to change to *Inactive*
///
/// An air purifier accessory service may include Rotation Speed to control fan speed if the
/// fan cannot be independently controlled
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceHapAirPurifier: Service {

    /// Service Name
    public static var name: String {
        return "Air Purifier"
    }

    /// Service UUID
    public static var uuidString: String {
        return "000000BB-0000-1000-8000-0026BB765291"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "public.hap.service.air-purifier"
    }

    /// Creates Service
    public init() {
        super.init(name: ServiceHapAirPurifier.name,
                   uuidString: ServiceHapAirPurifier.uuidString,
                   uniformIdentifier: ServiceHapAirPurifier.uniformIdentifier
        )
    }
}
