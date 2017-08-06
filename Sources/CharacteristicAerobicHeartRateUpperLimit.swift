//
//  CharacteristicAerobicHeartRateUpperLimit.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/5/17.
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


@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
/// BLE Aerobic Heart Rate Upper Limit Characteristic
open class CharacteristicAerobicHeartRateUpperLimit: Characteristic {

    public static var name: String {
        return "Aerobic Heart Rate Upper Limit"
    }

    public static var uuidString: String {
        return "2A84"
    }

    /// Aerobic Heart Rate Lower Limit
    private(set) public var heartRate: Measurement<UnitCadence>


    public init(heartRate: UInt8) {

        self.heartRate = Measurement(value: Double(heartRate), unit: UnitCadence.beatsPerMinute)

        super.init(name: CharacteristicAerobicHeartRateUpperLimit.name, uuidString: CharacteristicAerobicHeartRateUpperLimit.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicAerobicHeartRateUpperLimit {

        var decoder = DataDecoder(data)

        let heartRate: UInt8 = decoder.decodeUInt8()

        return CharacteristicAerobicHeartRateUpperLimit(heartRate: heartRate)
    }

    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(Data(from: UInt8(heartRate.value)))
        
        return msgData
    }
    
}
