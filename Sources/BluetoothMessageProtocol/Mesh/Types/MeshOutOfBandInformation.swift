//
//  MeshOutOfBandInformation.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/7/18.
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

/// Mesh OOB Information
///
/// The OOB Information field is used to help drive the provisioning process by
/// indicating the availability of OOB data, such as a public key of the device.
public struct MeshOutOfBandInformation: OptionSet, Hashable {
    public let rawValue: UInt16
    public init(rawValue: UInt16) { self.rawValue = rawValue }

    /// Other Supported
    public static let other                     = MeshOutOfBandInformation(rawValue: 1 << 0)
    /// Electronic / URI
    public static let electronicUrl             = MeshOutOfBandInformation(rawValue: 1 << 1)
    /// 2D machine-readable code
    public static let twoDMachineReadableCode   = MeshOutOfBandInformation(rawValue: 1 << 2)
    /// Bar code
    public static let barCode                   = MeshOutOfBandInformation(rawValue: 1 << 3)
    /// Near Field Communication (NFC)
    public static let nfc                       = MeshOutOfBandInformation(rawValue: 1 << 4)
    /// Number
    public static let number                    = MeshOutOfBandInformation(rawValue: 1 << 5)
    /// string
    public static let string                    = MeshOutOfBandInformation(rawValue: 1 << 6)
    /// On Box
    public static let onBox                     = MeshOutOfBandInformation(rawValue: 1 << 11)
    /// Inside Box
    public static let insideBox                 = MeshOutOfBandInformation(rawValue: 1 << 12)
    /// On piece of paper
    public static let onPieceOfPaper            = MeshOutOfBandInformation(rawValue: 1 << 13)
    /// Inside Manual
    public static let insideManual              = MeshOutOfBandInformation(rawValue: 1 << 14)
    /// On Device
    public static let onDevice                  = MeshOutOfBandInformation(rawValue: 1 << 15)
}

@available(swift 4.0)
extension MeshOutOfBandInformation: Encodable {

    enum CodeKeys: CodingKey {
        case other
        case electronicUrl
        case twoDMachineReadableCode
        case barCode
        case nfc
        case number
        case string
        case onBox
        case insideBox
        case onPieceOfPaper
        case insideManual
        case onDevice
    }

    public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }

    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodeKeys.self)

        try container.encode(self.contains(.other), forKey: .other)
        try container.encode(self.contains(.electronicUrl), forKey: .electronicUrl)
        try container.encode(self.contains(.twoDMachineReadableCode), forKey: .twoDMachineReadableCode)
        try container.encode(self.contains(.barCode), forKey: .barCode)
        try container.encode(self.contains(.nfc), forKey: .nfc)
        try container.encode(self.contains(.number), forKey: .number)
        try container.encode(self.contains(.string), forKey: .string)
        try container.encode(self.contains(.onBox), forKey: .onBox)
        try container.encode(self.contains(.insideBox), forKey: .insideBox)
        try container.encode(self.contains(.onPieceOfPaper), forKey: .onPieceOfPaper)
        try container.encode(self.contains(.insideManual), forKey: .insideManual)
        try container.encode(self.contains(.onDevice), forKey: .onDevice)
    }
}
