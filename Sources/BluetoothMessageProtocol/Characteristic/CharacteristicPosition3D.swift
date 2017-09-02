//
//  CharacteristicPosition3D.swift
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
import DataDecoder
import FitnessUnits

/// BLE Position 3D Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicPosition3D: Characteristic {

    public static var name: String {
        return "Position 2D"
    }

    public static var uuidString: String {
        return "2AAF"
    }

    /// Latitude
    ///
    /// WGS84 North coordinate
    private(set) public var latitude: Int32

    /// Longitude
    ///
    /// WGS84 East coordinate
    private(set) public var longitude: Int32

    /// Elevation
    private(set) public var elevation: Measurement<UnitLength>

    public init(latitude: Int32, longitude: Int32, elevation: Measurement<UnitLength>) {

        self.latitude = latitude
        self.longitude = longitude
        self.elevation = elevation

        super.init(name: CharacteristicPosition3D.name, uuidString: CharacteristicPosition3D.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicPosition3D {
        var decoder = DataDecoder(data)

        let lat = decoder.decodeInt32()
        let lon = decoder.decodeInt32()

        let meters = Double(decoder.decodeInt24()) * 0.01

        let elevation: Measurement = Measurement(value: meters, unit: UnitLength.meters)

        return CharacteristicPosition3D(latitude: lat, longitude: lon, elevation: elevation)
    }

    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError.init(.unsupported)
    }
}

