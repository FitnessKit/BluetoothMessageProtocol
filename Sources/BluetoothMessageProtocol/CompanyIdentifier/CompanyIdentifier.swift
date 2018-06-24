//
//  CompanyIdentifier.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/6/17.
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

internal var allCompanyIdentifiers: [CompanyIdentifier] = [CompanyIdentifier]()

/// BLE Company Identifier
///
/// Provides the Company Assigned ID and Name
@available(swift 4.0)
open class CompanyIdentifier: Codable {

    /// Company ID
    open internal(set) var companyID: UInt16

    /// Company Name
    open internal(set) var name: String

    /// Creates Bluetooth Company Assigned Identifier
    ///
    /// - Parameters:
    ///   - id: Assigned ID
    ///   - name: Assigned Company Name
    public init(id: UInt16, name: String) {

        self.companyID = id
        self.name = name
    }

}

extension CompanyIdentifier: Hashable {

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    public var hashValue: Int {
        return "\(name)\(companyID)".hashValue
    }
}

extension CompanyIdentifier: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static public func == (lhs: CompanyIdentifier, rhs: CompanyIdentifier) -> Bool {
        return (lhs.name == rhs.name) && (lhs.companyID == rhs.companyID)
    }
}

public extension CompanyIdentifier {

    /// Registers a CompanyIdentifer
    ///
    ///  Allows adding a CompanyIdentifer to the system
    ///
    /// - Parameter company: CompanyIdentifer Object
    /// - Throws: BluetoothMessageProtocolError
    public class func registerCompany(_ company: CompanyIdentifier) throws {

        let id = CompanyIdentifier.supportedCompanyIdentifers.first { (compObj) -> Bool in
            if compObj.companyID == company.companyID {
                return true
            }

            return false
        }

        if let _ = id {
            throw BluetoothMessageProtocolError(.companyRegistration(msg: "Company already registered"))
        }

        if CompanyIdentifier.supportedCompanyIdentifers.contains(company) == false {
            allCompanyIdentifiers.append(company)
        }
    }

    /// Finds a CompanyIdentifier by the ID
    ///
    /// - Parameter id: Company Identifier per Bluetooth SIG
    /// - Returns: CompanyIdentifier Instance
    public class func company(id: UInt16) -> CompanyIdentifier? {

        let id = CompanyIdentifier.supportedCompanyIdentifers.first { (compObj) -> Bool in
            if compObj.companyID == id {
                return true
            }

            return false
        }

        return id
    }
}
