//
//  HeartRateTests.swift
//  BluetoothMessageProtocolTests
//
//  Created by Kevin Hoogheem on 4/27/19.
//

import XCTest
@testable import BluetoothMessageProtocol

class HeartRateTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHeartRateMeasurementFlagsUInt8() {

        let flags = HeartRateMeasurementFlags(valueFormat: .uint8,
                                              contactStatus: .notSupported,
                                              isEnergyExpendedPresent: false,
                                              isRRIntervalPresent: false)
        
        if flags.rawValue != HeartRateMeasurementFlags(0).rawValue {
            XCTFail()
        }
        
    }
    
    func testHeartRateMeasurementFlagsUInt8WithStatus() {
        
        let detected = HeartRateMeasurementFlags(valueFormat: .uint8,
                                                 contactStatus: .detected,
                                                 isEnergyExpendedPresent: false,
                                                 isRRIntervalPresent: false)
        
        if detected.rawValue != HeartRateMeasurementFlags(6).rawValue {
            XCTFail()
        }
        
        let notDetected = HeartRateMeasurementFlags(valueFormat: .uint8,
                                                    contactStatus: .notDetected,
                                                    isEnergyExpendedPresent: false,
                                                    isRRIntervalPresent: false)
        
        if notDetected.rawValue != HeartRateMeasurementFlags(4).rawValue {
            XCTFail()
        }
        
        let stillNotSupportd =  HeartRateMeasurementFlags(valueFormat: .uint8,
                                                          contactStatus: .stillNotSupportd,
                                                          isEnergyExpendedPresent: false,
                                                          isRRIntervalPresent: false)
        
        if stillNotSupportd.rawValue != HeartRateMeasurementFlags(2).rawValue {
            XCTFail()
        }

    }

    
    func testHeartRateMeasurementFlagsUInt16() {
        
        let flags = HeartRateMeasurementFlags(valueFormat: .uint16,
                                              contactStatus: .notSupported,
                                              isEnergyExpendedPresent: false,
                                              isRRIntervalPresent: false)
        
        if flags.rawValue != HeartRateMeasurementFlags(1).rawValue {
            XCTFail()
        }
        
    }


    static var allTests = [
        ("testHeartRateMeasurementFlagsUInt8", testHeartRateMeasurementFlagsUInt8),
        ("testHeartRateMeasurementFlagsUInt8WithStatus", testHeartRateMeasurementFlagsUInt8WithStatus),
        ("testHeartRateMeasurementFlagsUInt16", testHeartRateMeasurementFlagsUInt16),
    ]

}
