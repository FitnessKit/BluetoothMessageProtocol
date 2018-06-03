//
//  MemberIdentifier.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 3/31/18.
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

internal var allMemberIdentifiers: [MemberIdentifier] = [MemberIdentifier]()

/// BLE 16 Bit UUIDs For Members
///
/// Provides the Members UUID 16 Assigned Numbers
@available(swift 4.0)
open class MemberIdentifier: Encodable {

    /// Members Assigned UUID 16 Number
    open internal(set) var assignedNumber: UInt16

    /// Company Name
    open internal(set) var name: String

    /// Creates Bluetooth 16 Bit UUIDs For Members
    ///
    /// - Parameters:
    ///   - assignedNumber: Assigned UUUID
    ///   - name: Assigned Company Name
    public init(assignedNumber: UInt16, name: String) {

        self.assignedNumber = assignedNumber
        self.name = name
    }
}

extension MemberIdentifier: Hashable {

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    public var hashValue: Int {
        return "\(name)\(assignedNumber)".hashValue
    }
}

extension MemberIdentifier: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static public func == (lhs: MemberIdentifier, rhs: MemberIdentifier) -> Bool {
        return (lhs.name == rhs.name) && (lhs.assignedNumber == rhs.assignedNumber)
    }
}

public extension MemberIdentifier {

    /// Finds a MemberIdentifier by the ID
    ///
    /// - Parameter assignedNumber: 16 Bit UUID For Member
    /// - Returns: MemberIdentifier Instance
    public class func company(assignedNumber: UInt16) -> MemberIdentifier? {

        let id = MemberIdentifier.supportedMemberIdentifers.first { (compObj) -> Bool in
            if compObj.assignedNumber == assignedNumber {
                return true
            }

            return false
        }

        return id
    }
}

