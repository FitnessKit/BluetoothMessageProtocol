//
//  MemberIdentifierTests.swift
//  BluetoothMessageProtocolTests
//
//  Created by Kevin Hoogheem on 3/31/18.
//

import Foundation
import XCTest
@testable import BluetoothMessageProtocol

class MemberIdentifierTests: XCTestCase {

    func testMemberDups() {

        let x = MemberIdentifier.supportedMemberIdentifers
        let duplicates = Array(Set(x.filter({ (i: MemberIdentifier) in
            x.filter({ $0.assignedNumber == i.assignedNumber }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.assignedNumber) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("MemberIdentifier Count: \(MemberIdentifier.supportedMemberIdentifers.count)")

    }

    func testFindMember() {

        if MemberIdentifier.company(assignedNumber: 65267)?.name != "Google Inc." {
            XCTFail()
        }

        if MemberIdentifier.company(assignedNumber: 0xFE13)?.name != "Apple Inc." {
            XCTFail()
        }

        if MemberIdentifier.company(assignedNumber: 65534) != nil {
            XCTFail()
        }


    }

    static var allTests = [
        ("testMemberDups", testMemberDups),
        ("testFindMember", testFindMember),
        ]
}
