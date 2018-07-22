//
//  CharacteristicNewAlert.swift
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

/// BLE New Alert Characteristic
///
/// This characteristic defines the category of the alert and how many new alerts
/// of that category have occurred in the server device. Brief text information may
/// also be included for the last alert in the category
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicNewAlert: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "New Alert"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2A3E"
    }

    /// Alert Type
    ///
    /// Category of the new alert
    private(set) public var alertType: AlertCategory

    /// Number of New Alerts
    ///
    /// Provides the number of new alerts in the server
    private(set) public var numberOfAlerts: UInt8

    /// Alert Information
    ///
    /// Brief text information for the last alert
    private(set) public var alertInformation: String?

    /// Creates New Alert Characteristic
    ///
    /// - Parameters:
    ///   - alertType: Category of the new alert
    ///   - numberOfAlerts: Number of New Alerts
    ///   - alertInformation: Brief text information for the last alert
    public init(alertType: AlertCategory, numberOfAlerts: UInt8, alertInformation: String?) {
        self.alertType = alertType
        self.numberOfAlerts = numberOfAlerts
        self.alertInformation = alertInformation

        super.init(name: CharacteristicNewAlert.name,
                   uuidString: CharacteristicNewAlert.uuidString)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothMessageProtocolError
    open override class func decode(data: Data) throws -> CharacteristicNewAlert {
        var decoder = DecodeData()

        let alertType: AlertCategory = AlertCategory(rawValue: decoder.decodeUInt8(data)) ?? .simpleAlert

        let numberOfAlerts = decoder.decodeUInt8(data)

        var alertInfo: String?
        if data.count > 2 {
            let stringData = Data(data[2...data.count])
            alertInfo = stringData.safeStringValue
        }

        return CharacteristicNewAlert(alertType: alertType,
                                      numberOfAlerts: numberOfAlerts,
                                      alertInformation: alertInfo)
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Data representation of the Characteristic
    /// - Throws: BluetoothMessageProtocolError
    open override func encode() throws -> Data {
        var msgData = Data()

        msgData.append(alertType.rawValue)
        msgData.append(numberOfAlerts)

        if let info = alertInformation {
            guard kNewAlertTextStringBounds.contains(info.count) else {
                throw BluetoothMessageProtocolError.boundsError(title: "Alert Information must be between",
                                                                msg: "characters in size",
                                                                range: kNewAlertTextStringBounds)
            }

            if let stringData = info.data(using: .utf8) {
                msgData.append(stringData)
            }
        }

        return msgData
    }
}
