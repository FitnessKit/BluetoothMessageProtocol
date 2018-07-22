//
//  CharacteristicMagneticDeclination.swift
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

/// BLE Magnetic Declination Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicMagneticDeclination: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Magnetic Declination"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A2C"
    }

    /// Magnetic Declination
    ///
    /// The magnetic declination is the angle on the horizontal plane between the
    /// direction of True North (geographic) and the direction of Magnetic North,
    /// measured clockwise from True North to Magnetic North
    private(set) public var declination: Measurement<UnitAngle>

    /// Creates Magnetic Declination
    ///
    /// - Parameter declination: Magnetic Declination
    public init(declination: Measurement<UnitAngle>) {
        self.declination = declination

        super.init(name: CharacteristicMagneticDeclination.name,
                   uuidString: CharacteristicMagneticDeclination.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicMagneticDeclination {
        var decoder = DecodeData()

        let value = decoder.decodeUInt16(data).resolution(0.01)

        let dec = Measurement(value: value, unit: UnitAngle.degrees)

        return CharacteristicMagneticDeclination(declination: dec)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        //Make sure we put this back to Degress before we create Data
        let value = declination.converted(to: UnitAngle.degrees).value

        guard kBluetoothMagneticDeclinationBounds.contains(value) else {
            throw BluetoothMessageProtocolError.boundsError(title: "Magnetic Declination must be between",
                                                            msg: "degress",
                                                            range: kBluetoothMagneticDeclinationBounds)
        }

        //put it back to uint16
        let dec = UInt16(value.resolution(1 / 0.01))

        msgData.append(Data(from: dec.littleEndian))

        return msgData
    }
}
