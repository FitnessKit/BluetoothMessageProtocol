//
//  CompanyIdentifierNonAssigned.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 12/23/17.
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

// MARK: - Non Assigned Companies
public extension CompanyIdentifier {
    //Non offical IDs

    //3521 DCI

    /// Four Eyes Viiiiva
    ///
    /// - note: Non assigned Number
    class var viiiiva: CompanyIdentifier { return CompanyIdentifier(id: 16657, name: "Four Eyes Viiiiva") }
    /// Exogal
    ///
    /// - note: Non assigned Number
    class var exogal: CompanyIdentifier { return CompanyIdentifier(id: 17752, name: "Exogal") }
    /// Unikey Technologies, Inc.
    ///
    /// Some of the devices have the Manufacturer in Big Endian
    ///
    /// - note: Non assigned Number
    /// - SeeAlso: unikeyTechnologies
    class var uniKey: CompanyIdentifier { return CompanyIdentifier(id: 24065, name: "Unikey Technologies, Inc.") }
    /// Dropcam
    ///
    /// - note: Non assigned Number
    class var dropcam: CompanyIdentifier { return CompanyIdentifier(id: 35888, name: "Dropcam") }

}

// MARK: - allCompanyIdentifiers
extension CompanyIdentifier {
    
    static func allCompanyIdentifiersAddNonAssigned() {
        //Non offical IDs
        allCompanyIdentifiers.append(.viiiiva)
        allCompanyIdentifiers.append(.exogal)
        allCompanyIdentifiers.append(.uniKey)
        allCompanyIdentifiers.append(.dropcam)
    }
}
