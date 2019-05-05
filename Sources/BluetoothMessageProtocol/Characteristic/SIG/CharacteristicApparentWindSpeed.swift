//
//  CharacteristicApparentWindSpeed.swift
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

/// BLE Apparent Wind Speed Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicApparentWindSpeed: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Apparent Wind Speed"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A72"
    }

    /// Wind speed
    private(set) public var windSpeed: Measurement<UnitSpeed>

    /// Creates Apparent Wind Speed Characteristic
    ///
    /// - Parameter windSpeed: Wind Speed
    public init(windSpeed: Measurement<UnitSpeed>) {
        self.windSpeed = windSpeed

        super.init(name: CharacteristicApparentWindSpeed.name,
                   uuidString: CharacteristicApparentWindSpeed.uuidString)
    }

    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    open override class func decoder<C: CharacteristicApparentWindSpeed>(data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let speed = decoder.decodeUInt16(data).resolution(.removing, resolution: Resolution.oneHundredth)
        
        let wind = Measurement(value: speed, unit: UnitSpeed.metersPerSecond)

        return.success(CharacteristicApparentWindSpeed(windSpeed: wind) as! C)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothDecodeError
    @available(*, deprecated, message: "use results based decoder instead")
    open override class func decode(data: Data) throws -> CharacteristicApparentWindSpeed {
        return try decoder(data: data).get()
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    open override func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()

        //Make sure we put this back to m/s before we create Data
        let speed = windSpeed.converted(to: UnitSpeed.metersPerSecond).value.resolution(.adding, resolution: Resolution.oneHundredth)

        msgData.append(Data(from: UInt16(speed).littleEndian))
        
        return.success(msgData)
    }
}
