//
//  BluetoothEncodeable.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 4/27/19.
//

import Foundation

/// Allows for Encoding of Objects into Data
public protocol BluetoothEncodable {
    
    /// Encodes Object into Data
    ///
    /// - Returns: Encoded Data Result
    func encode() -> Result<Data, BluetoothEncodeError>
}
