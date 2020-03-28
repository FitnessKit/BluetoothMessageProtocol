//
//  DataExtension.swift
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

internal extension Data {

    init<T>(from value: T) {
        self = Swift.withUnsafeBytes(of: value) { Data($0) }
    }
    
    func to<T>(type: T.Type) -> T where T: ExpressibleByIntegerLiteral {
        var value: T = 0
        _ = Swift.withUnsafeMutableBytes(of: &value, { copyBytes(to: $0)} )
        return value as T
    }

    static var isLittleEndian: Bool {

        let endian = CFByteOrderGetCurrent()

        if endian == CFIndex(Int(CFByteOrderLittleEndian.rawValue)) {
            return true
        }

        return false
    }

    var safeStringValue: String? {

        var maybeString: String?

        if self.count > 0 {
            if self[self.count - 1] == 0x00 {
                maybeString = String(data: self, encoding: .utf8)
            } else {
                maybeString = String(data: self, encoding: .ascii)
            }
        }

        return maybeString
    }

    /// Formats Data as HEX String
    ///
    /// - Parameters:
    ///   - formatted: Use Formatting where data is "[0x00][0x00]"
    ///   - uselower: Lowercase string
    ///   - packed: Packs the data together (no spaces)
    /// - Returns: HEX Formatted String
    func hexadecimalString(formatted: Bool = false, uselower: Bool = false, packed: Bool = false) -> String {
        var hexString = String()

        if formatted {
            hexString = self.reduce("", { String(format: "\($0)[%02hhx] ", $1) })
        } else {
            hexString = self.reduce("", { String(format: "\($0)%02hhx ", $1) })
        }

        if packed {
            hexString = hexString.replacingOccurrences(of: " ", with: "")
        }

        if uselower {
            return hexString.lowercased() as String
        } else {
            return hexString.uppercased() as String
        }
    }
}

extension Data {

    /// Creates a 128Bit UUID From Data
    ///
    /// - Parameter reverseData: If the data should be Reversed
    /// - Returns: UUID String Value
    func create128BitUuid(reverseData: Bool = true) -> String {
        var decoder = DecodeData()

        var uuidData = self

        if reverseData {
            uuidData = Data(self.reversed())
        }

        var uuidString: String = ""
        uuidString += decoder.decodeData(uuidData, length: 4).hexadecimalString(packed: true) + "-"
        uuidString += decoder.decodeData(uuidData, length: 2).hexadecimalString(packed: true) + "-"
        uuidString += decoder.decodeData(uuidData, length: 2).hexadecimalString(packed: true) + "-"
        uuidString += decoder.decodeData(uuidData, length: 2).hexadecimalString(packed: true) + "-"
        uuidString += decoder.decodeData(uuidData, length: 6).hexadecimalString(packed: true)

        return uuidString
    }
}
