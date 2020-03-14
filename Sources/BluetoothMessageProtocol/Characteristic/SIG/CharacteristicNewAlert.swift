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
final public class CharacteristicNewAlert: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "New Alert" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A3E" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
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
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let alertType: AlertCategory = AlertCategory(rawValue: decoder.decodeUInt8(data)) ?? .simpleAlert
        
        let numberOfAlerts = decoder.decodeUInt8(data)
        
        var alertInfo: String?
        if data.count > 2 {
            let stringData = Data(data[2...data.count])
            alertInfo = stringData.safeStringValue
        }
        
        let char = CharacteristicNewAlert(alertType: alertType,
                                          numberOfAlerts: numberOfAlerts,
                                          alertInformation: alertInfo)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        var msgData = Data()
        
        msgData.append(alertType.rawValue)
        msgData.append(numberOfAlerts)
        
        if let info = alertInformation {
            guard kNewAlertTextStringBounds.contains(info.count) else {
                return.failure(BluetoothEncodeError.boundsError(title: "Alert Information must be between",
                                                                msg: "characters in size",
                                                                range: kNewAlertTextStringBounds))
            }
            
            if let stringData = info.data(using: .utf8) {
                msgData.append(stringData)
            }
        }
        
        return.success(msgData)
    }
}

extension CharacteristicNewAlert: Hashable {
    
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuidString)
        hasher.combine(alertType)
        hasher.combine(numberOfAlerts)
        hasher.combine(alertInformation)
    }
}

extension CharacteristicNewAlert: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicNewAlert, rhs: CharacteristicNewAlert) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.alertType == rhs.alertType)
            && (lhs.numberOfAlerts == rhs.numberOfAlerts)
            && (lhs.alertInformation == rhs.alertInformation)
    }
}
