//
//  CharacteristicAlertCategoryID.swift
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
/// BLE Alert Category ID Characteristic
open class CharacteristicAlertCategoryID: Characteristic {

    public static var name: String {
        return "Alert Category ID"
    }

    public static var uuidString: String {
        return "2A43"
    }

    public enum Category: UInt8 {
        case simpleAlert        = 0
        case email              = 1
        case news               = 2
        case call               = 3
        case missedCall         = 4
        case textMessage        = 5
        case voiceMail          = 6
        case schedule           = 7
        case highPrioritized    = 8
        case instantMessage     = 9

        var stringValue: String {

            switch self {
            case .simpleAlert:
                return "Simple Alert"
            case .email:
                return "Email"
            case .news:
                return "News"
            case .call:
                return "Call"
            case .missedCall:
                return "Missed Call"
            case .textMessage:
                return "SMS/MMS"
            case .voiceMail:
                return "Voice Mail"
            case .schedule:
                return "Calendar Alert"
            case .highPrioritized:
                return "High Priority"
            case .instantMessage:
                return "Instant Message"
            }
        }

    }

    /// Alert Type
    private(set) public var alertType: Category


    public init(alertType: Category) {

        self.alertType = alertType

        super.init(name: CharacteristicAlertCategoryID.name, uuidString: CharacteristicAlertCategoryID.uuidString)
    }

    open override class func decode(data: Data) throws -> CharacteristicAlertCategoryID {

        var decoder = DataDecoder(data)

        let alertType: Category = Category(rawValue: decoder.decodeUInt8()) ?? .simpleAlert

        return CharacteristicAlertCategoryID(alertType: alertType)
    }

    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(alertType.rawValue)
        
        return msgData
    }
    
}
