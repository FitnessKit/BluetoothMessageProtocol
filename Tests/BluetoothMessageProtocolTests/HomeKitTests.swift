//
//  HomeKitTests.swift
//  BluetoothMessageProtocolTests
//
//  Created by Kevin Hoogheem on 7/15/18.
//

import XCTest
@testable import BluetoothMessageProtocol
import DataDecoder
#if canImport(CryptoKit)
import CryptoKit
#else
import CryptoSwift
#endif

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
        let hashString: String
        
        #if canImport(CryptoKit)
        if #available(iOS 13.0, OSX 10.15, *) {
            let shaTest = SHA512.hash(data: test)
            hashString = shaTest.compactMap { String(format: "%02x", $0) }.joined()
            
            if hashString.prefix(8) != "f71012ce" {
                /// CE1210F7
                XCTFail()
            }

        } else {
            XCTFail()
        }
        #else
        let shaTest = test.sha512()
        hashString = shaTest.compactMap { String(format: "%02x", $0) }.joined()
        
        if hashString.prefix(8) != "f71012ce" {
            /// CE1210F7
            XCTFail()
        }
        #endif

    }

    func testTlvPairingDecode() {
        let tlvData = Data([0x06, 0x01, 0x03, 0x06, 0x02, 0x03, 0x00])

        var decoder = DecodeData()

        while decoder.index != tlvData.count {
            if let tlvType = HomeKitPairingTlvType(rawValue: decoder.decodeUInt8(tlvData)) {

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

    func testTlvPairingStringDecode() {
        let tlvData = Data([0x01, 0x05, 0x68, 0x65, 0x6C, 0x6C, 0x6F])

        var decoder = DecodeData()

        while decoder.index != tlvData.count {
            if let tlvType = HomeKitPairingTlvType(rawValue: decoder.decodeUInt8(tlvData)) {

                guard tlvType == .identifier else {
                    XCTFail()
                    return
                }

                let size = decoder.decodeUInt8(tlvData)

                switch tlvType.format {
                case .integer:
                    XCTFail()

                case .string:
                    let va = decoder.decodeData(tlvData, length: Int(size))

                    guard va.safeStringValue == "hello" else {
                        XCTFail()
                        return
                    }

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
        ("testTlvPairingDecode", testTlvPairingDecode),
        ("testTlvPairingStringDecode", testTlvPairingStringDecode),
        ]
}
