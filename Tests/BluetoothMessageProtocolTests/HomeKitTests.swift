//
//  HomeKitTests.swift
//  BluetoothMessageProtocolTests
//
//  Created by Kevin Hoogheem on 7/15/18.
//

import XCTest
@testable import BluetoothMessageProtocol
import CryptoSwift
import DataDecoder

class HomeKitTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSetupHash() {

        let setupId = "FYMN"
        let deviceID = "E0:5F:0A:B8:12:20"

        let test = setupId.data(using: .utf8)! + deviceID.data(using: .utf8)!
        let shaTest = test.sha512()

        //        let hash = shaTest.prefix(4)
        let setupHash = shaTest.prefix(4).to(type: UInt32.self)

        if setupHash != 3457290487 {
            /// CE1210F7
            XCTFail()
        }
    }

    func testTlvDecode() {
        let tlvData = Data([0x06, 0x01, 0x03, 0x06, 0x02, 0x03, 0x00])

        var decoder = DecodeData()

        while decoder.index != tlvData.count {
            if let tlvType = HomeKitTlvType(rawValue: decoder.decodeUInt8(tlvData)) {

                guard tlvType == .state else {
                    XCTFail()
                    return
                }

                let size = decoder.decodeUInt8(tlvData)

                switch tlvType.format {
                case .integer:
                    switch size {
                    case UInt8(MemoryLayout<UInt8>.size):
                        let value = decoder.decodeUInt8(tlvData)

                        guard value == 3 else { XCTFail(); return }

                    case UInt8(MemoryLayout<UInt16>.size):
                        let value = decoder.decodeUInt16(tlvData)

                        guard value == 3 else { XCTFail(); return }

                    default:
                        XCTFail()
                    }
                case .string:
                    XCTFail()

                case .data:
                    XCTFail()

                case .null:
                    XCTFail()

                }

            } else {
                XCTFail()
            }
        }

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    static var allTests = [
        ("testSetupHash", testSetupHash),
        ("testTlvDecode", testTlvDecode),
        ]
}
