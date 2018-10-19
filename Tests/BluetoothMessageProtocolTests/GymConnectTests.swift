//
//  GymConnectTests.swift
//  BluetoothMessageProtocolTests
//
//  Created by Kevin Hoogheem on 10/19/18.
//

import XCTest
@testable import BluetoothMessageProtocol

class GymConnectTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEquipmentType() {

        if GymConnectEquipmentType.rower != GymConnectEquipmentType(8) {
            XCTFail()
        }
        if GymConnectEquipmentType.recumbentBike != GymConnectEquipmentType(144) {
            XCTFail()
        }

        /// Test Tradmill Variant
        for idx: UInt8 in 128...143 {
            if GymConnectEquipmentType(idx).name != "Tradmill Variant" {
                XCTFail()
            }
        }

        for idx: UInt8 in 145...159 {
            if GymConnectEquipmentType(idx).name != "Bike Variant" {
                XCTFail()
            }
        }

        for idx: UInt8 in 160...169 {
            if GymConnectEquipmentType(idx).name != "Stepper Variant" {
                XCTFail()
            }
        }

        for idx: UInt8 in 170...179 {
            if GymConnectEquipmentType(idx).name != "Elliptical/Cross Trainer Variant" {
                XCTFail()
            }
        }

        for idx: UInt8 in 180...189 {
            if GymConnectEquipmentType(idx).name != "Total Body Trainer Variant" {
                XCTFail()
            }
        }

        for idx: UInt8 in 190...199 {
            if GymConnectEquipmentType(idx).name != "Rower Variant" {
                XCTFail()
            }
        }
    }


    static var allTests = [
        ("testEquipmentType", testEquipmentType),

        ]

}
