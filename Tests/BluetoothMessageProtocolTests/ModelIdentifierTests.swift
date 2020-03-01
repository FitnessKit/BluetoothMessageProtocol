//
//  ModelIdentifierTests.swift
//  BluetoothMessageProtocolTests
//
//  Created by Kevin Hoogheem on 7/29/18.
//

import Foundation
import XCTest
@testable import BluetoothMessageProtocol

class ModelIdentifierTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testModelIdentifierType() {

        func testSig(type: ModelIdentifierType) {

            switch type {
            case .sig(let id):
                if id != 55 {
                    XCTFail("ID Wrong")
                }

            case .vendor(_, _):
                XCTFail("Model Shouldn't be a Vendor Type")
            }
        }

        func testVendor(type: ModelIdentifierType) {

            switch type {
            case .sig(_):
                XCTFail("Model Shouldn't be a SIG Type")

            case .vendor(_, let id):
                if id != 55 {
                    XCTFail("ID Wrong")
                }
            }
        }

        testSig(type: ModelIdentifierType.sig(55))
        testVendor(type: ModelIdentifierType.vendor(.nordicSemiconductor, id: 55))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    static var allTests = [
        ("testModelIdentifierType", testModelIdentifierType),
        ]
}
