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

    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    open override class func decoder<C: CharacteristicApparentWindDirection>(data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let direction = decoder.decodeUInt16(data).resolution(.removing, resolution: Resolution.oneHundredth)
        
        let wind = Measurement(value: direction, unit: UnitAngle.degrees)

        return.success(CharacteristicApparentWindDirection(windDirection: wind) as! C)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothDecodeError
    @available(*, deprecated, message: "use decoder instead")
    open override class func decode(data: Data) throws -> CharacteristicApparentWindDirection {
        return try decoder(data: data).get()
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    open override func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        //Make sure we put this back to deg before we create Data
        let direction = windDirection.converted(to: UnitAngle.degrees).value.resolution(.adding, resolution: Resolution.oneHundredth)

        msgData.append(Data(from: UInt16(direction).littleEndian))
        
        return.success(msgData)
    }
}
