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

internal extension Data {

    init<T>(from value: T) {
        var value = value
        self.init(buffer: UnsafeBufferPointer(start: &value, count: 1))
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

        if self[self.count - 1] == 0x00 {
            maybeString = String(data: self, encoding: .utf8)
        } else {
            maybeString = String(data: self, encoding: .ascii)
        }

        return maybeString
    }

    /// Formats Data as HEX String
    ///
    /// - Parameters:
    ///   - formatted: Use Formatting where data is "[0x00][0x00]"
    ///   - uselower: Lowercase string
    /// - Returns: HEX Formatted String
    func hexadecimalString(formatted: Bool = false, uselower: Bool = false) -> String {
        var bytes = [UInt8](repeating: 0, count: count)
        copyBytes(to: &bytes, count: count)

        var hexString = String()
        for byte in bytes {
            if formatted {
                hexString += String(format: "[%02x] ", byte)
            }else {
                hexString += String(format: "%02x ", byte)
            }
        }

        if uselower {
            return hexString.lowercased() as String
        }else {
            return hexString.uppercased() as String
        }
    }

}
