//
//  CharacteristicWaistCircumference.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/26/17.
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

/// BLE Waist Circumference Characteristic
///
/// Used with the Hip Circumference value to calculate the Waist to Hip Ratio (WHR)
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicWaistCircumference: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Waist Circumference"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A97"
    }

    /// Waist Circumference
    private(set) public var waistCircumference: Measurement<UnitLength>

    /// Creates Waist Circumference Characteristic
    ///
    /// - Parameter waistCircumference: Waist Circumference
    public init(waistCircumference: Measurement<UnitLength>) {
        self.waistCircumference = waistCircumference

        super.init(name: CharacteristicWaistCircumference.name,
                   uuidString: CharacteristicWaistCircumference.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicWaistCircumference {
        var decoder = DecodeData()

        let meters = decoder.decodeUInt16(data).resolution(0.01)

        let waistCircumference: Measurement = Measurement(value: meters, unit: UnitLength.meters)

        return CharacteristicWaistCircumference(waistCircumference: waistCircumference)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        //Make sure we put this back to Meters before we create Data
        let value = UInt16(waistCircumference.converted(to: UnitLength.meters).value.resolution(100.0))

        msgData.append(Data(from: value))

        return msgData
    }
}
