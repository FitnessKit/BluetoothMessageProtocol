//
//  CharacteristicWeightScaleFeature.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/9/17.
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

/// BLE Weight Scale Feature Characteristic
///
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicWeightScaleFeature: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Weight Scale Feature"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A9E"
    }

    /// Weight Resolution Types
    public enum WeightResolution: UInt8 {
        /// Not Specified
        case notSpecified               = 0
        /// Resolution of 0.5 kg or 1 lb
        case resolution0_5kg            = 1
        /// Resolution of 0.2 kg or 0.5 lb
        case resolution0_2kg            = 2
        /// Resolution of 0.1 kg or 0.2 lb
        case resolution0_1kg            = 3
        /// Resolution of 0.05 kg or 0.1 lb
        case resolution0_05kg           = 4
        /// Resolution of 0.02 kg or 0.05 lb
        case resolution0_02kg           = 5
        /// Resolution of 0.01 kg or 0.02 lb
        case resolution0_01kg           = 6
        /// Resolution of 0.005 kg or 0.01 lb
        case resolution0_005kg          = 7

        /// Metric Resolution multiplier
        var metricValue: Double {
            switch self {
            case .resolution0_5kg:
                return 0.5
            case .resolution0_2kg:
                return 0.2
            case .resolution0_1kg:
                return 0.1
            case .resolution0_05kg:
                return 0.05
            case .resolution0_02kg:
                return 0.02
            case .resolution0_01kg:
                return 0.01
            case .resolution0_005kg:
                return 0.005
            default:
                return 1
            }
        }

        /// Imperial Resolution mulitpler
        var imperialValue: Double {
            switch self {
            case .resolution0_5kg:
                return 1
            case .resolution0_2kg:
                return 0.5
            case .resolution0_1kg:
                return 0.2
            case .resolution0_05kg:
                return 0.1
            case .resolution0_02kg:
                return 0.05
            case .resolution0_01kg:
                return 0.02
            case .resolution0_005kg:
                return 0.01
            default:
                return 1
            }
        }
    }

    /// Height Resolution Types
    public enum HeightResolution: UInt8 {
        /// Not Specified
        case notSpecified           = 0
        /// Resolution of 0.01 meter or 1 inch
        case resoltuion0_01meter    = 1
        /// Resolution of 0.005 meter or 0.5 inch
        case resolution0_005meter   = 2
        /// Resolution of 0.001 meter or 0.1 inch
        case resolution0_001meter   = 3

        /// Metric Resolution multiplier
        var metricValue: Double {
            switch self {
            case .resoltuion0_01meter:
                return 0.01
            case .resolution0_001meter:
                return 0.001
            case .resolution0_005meter:
                return 0.005
            default:
                return 1.0
            }
        }

        /// Imperial Resolution multiplier
        var imperialValue: Double {
            switch self {
            case .resoltuion0_01meter:
                return 1.0
            case .resolution0_001meter:
                return 0.5
            case .resolution0_005meter:
                return 0.1
            default:
                return 1.0
            }
        }
    }

    /// Time Stamp Supported
    private(set) public var isTimestampSupported: Bool

    /// Multiple Users Supported
    private(set) public var isMultipleUsersSupported: Bool

    /// Body Mass Index (BMI) Supported
    private(set) public var isBMISupported: Bool

    /// Weight Measurement Resolution
    private(set) public var weightResolution: WeightResolution

    /// Height Measurement Resolution
    private(set) public var heightResolution: HeightResolution

    /// Creates Weight Scale Feature Characteristic
    ///
    /// - Parameters:
    ///   - timestampSupported: Time Stamp Supported
    ///   - multipleUsersSupported: Multiple Users Supported
    ///   - bmiSupported: Body Mass Index (BMI) Supported
    ///   - weightResolution: Weight Measurement Resolution
    ///   - heightResolution: Height Measurement Resolution
    public init(timestampSupported: Bool,
                multipleUsersSupported: Bool,
                bmiSupported: Bool,
                weightResolution: WeightResolution,
                heightResolution: HeightResolution) {

        self.isTimestampSupported = timestampSupported
        self.isMultipleUsersSupported = multipleUsersSupported
        self.isBMISupported = bmiSupported
        self.weightResolution = weightResolution
        self.heightResolution = heightResolution

        super.init(name: CharacteristicWeightScaleFeature.name,
                   uuidString: CharacteristicWeightScaleFeature.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicWeightScaleFeature {
        var decoder = DecodeData()

        let value = decoder.decodeUInt32(data)

        let timestamp = (value & 0x01 == 0x01)
        let multiUsers = (value & 0x02 == 0x02)
        let bmi = (value & 0x04 == 0x04)

        let weightValue: UInt8 = UInt8((value & 0x78) >> 3)
        let weightRes = WeightResolution(rawValue: weightValue) ?? .notSpecified

        let heightValue: UInt8 = UInt8((value & 0x380) >> 7)
        let heightRes = HeightResolution(rawValue: heightValue) ?? .notSpecified

        return CharacteristicWeightScaleFeature(timestampSupported: timestamp,
                                                multipleUsersSupported: multiUsers,
                                                bmiSupported: bmi,
                                                weightResolution: weightRes,
                                                heightResolution: heightRes)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        //Not Yet Supported
        throw BluetoothMessageProtocolError(.unsupported)
    }
}
