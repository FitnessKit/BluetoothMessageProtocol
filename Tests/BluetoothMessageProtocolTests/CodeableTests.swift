//
//  CodeableTests.swift
//  BluetoothMessageProtocolTests
//
//  Created by Kevin Hoogheem on 6/24/18.
//

import XCTest
@testable import BluetoothMessageProtocol
@testable import FitnessUnits

class CodeableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testServiceEncode() {

        let service = ServiceHapFan()

        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = [.prettyPrinted]
        do {
            let jsonData = try jsonEncoder.encode(service)

            let jsonString = String(data: jsonData, encoding: .utf8)
            print("JSON String : " + jsonString!)

        }
        catch {
            print(error)
            XCTFail()
        }

    }

    func testPolarEncodeable() {

//        let polar = ManufacturerDataPolarHeartRate(heartRate: 89)
        let polar = ManufacturerDataPolarHeartRate(heartRate: Measurement(value: 0, unit: UnitCadence.beatsPerMinute))

        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = [.prettyPrinted]
        do {
            let jsonData = try jsonEncoder.encode(polar)

            let jsonString = String(data: jsonData, encoding: .utf8)
            print("JSON String : " + jsonString!)

        }
        catch {
            print(error)
            XCTFail()
        }

    }

    func testMeshModelEncode() {

//        let sigType = ModelIdentifierType.create(sig: 55)
        let sigType = ModelIdentifierType.vendor(.nordicSemiconductor, id: 5343)

        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = [.prettyPrinted]
        do {
            let jsonData = try jsonEncoder.encode(sigType)

            let jsonString = String(data: jsonData, encoding: .utf8)
            print("JSON String : " + jsonString!)

        }
        catch {
            print(error)
            XCTFail()
        }

    }

    func testMeshModelIdentifierTypeEncode() {

//        let service = MeshModelIdentifier.genericOnOffServer
        let service = MeshModelIdentifier.nordicSimpleOnOffClient

        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = [.prettyPrinted]
        do {
            let jsonData = try jsonEncoder.encode(service)

            let jsonString = String(data: jsonData, encoding: .utf8)
            print("JSON String : " + jsonString!)

        }
        catch {
            print(error)
            XCTFail()
        }

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    static var allTests = [
        ("testServiceEncode", testServiceEncode),
        ("testPolarEncodeable", testPolarEncodeable),
        ("testMeshModelEncode", testMeshModelEncode),
        ]

}
