//
//  CharacteristicApparentWindDirection.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/12/17.
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

/// BLE Apparent Wind Direction Characteristic
///
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicApparentWindDirection: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Apparent Wind Direction"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A73"
    }

    /// Wind Direction
    ///
    /// The apparent wind is the wind experienced by an observer in motion and is
    /// the relative velocity of the wind in relation to the observer.
    ///
    /// For example, an apparent wind coming from a direction that is 45 degrees
    /// clockwise relative to the heading of the observer is given as 45 degrees;
    /// one that is from a direction 45 degrees anti-clockwise relative to the
    /// heading of the observer is given as 315 degrees.
    ///
    private(set) public var windDirection: Measurement<UnitAngle>

    /// Creates Apparent Wind Direction Characteristic
    ///
    /// - Parameter windDirection: Angle of Wind Direction
    public init(windDirection: Measurement<UnitAngle>) {
        self.windDirection = windDirection

        super.init(name: CharacteristicApparentWindDirection.name,
                   uuidString: CharacteristicApparentWindDirection.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicApparentWindDirection {
        var decoder = DecodeData()

        let direction = decoder.decodeUInt16(data).resolution(0.01)

        let wind = Measurement(value: direction, unit: UnitAngle.degrees)

        return CharacteristicApparentWindDirection(windDirection: wind)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        //Make sure we put this back to deg before we create Data
        let direction = windDirection.converted(to: UnitAngle.degrees).value.resolution(1 / 0.01)

        msgData.append(Data(from: UInt16(direction).littleEndian))
        
        return msgData
    }
}
