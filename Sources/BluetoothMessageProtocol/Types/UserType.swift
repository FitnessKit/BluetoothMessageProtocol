//
//  UserType.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/2/17.
//
//

import Foundation


/// Bluetooth User
public enum User {
    case unknown
    case value(_: UInt8)

    public var rawValue: UInt8 {
        switch self {
        case .unknown:
            return UInt8.max
        case .value(let num):
            return num
        }
    }

    public static func create(_ value: UInt8) -> User {
        if value == UInt8.max {
            return User.unknown
        } else {
            return User.value(value)
        }
    }
}
