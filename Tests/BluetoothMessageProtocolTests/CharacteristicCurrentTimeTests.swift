//
//  CharacteristicCurrentTimeTests.swift
//  BluetoothMessageProtocolTests
//
//  Created by Kevin Hoogheem on 12/23/17.
//

import XCTest
@testable import BluetoothMessageProtocol
import CryptoSwift

@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
class CharacteristicCurrentTimeTests: XCTestCase {


    func testSha() {
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
    
    func testEncode() {

        let dt = DateTime(year: 2000, month: Month.january, day: 1, hours: 1, minutes: 1, seconds: 1)
        let dw = DayOfWeek.monday

        let char = CharacteristicCurrentTime(adjustmentReason: .manualTimeUpdate, currentTime: dt, dayOfWeek: dw, fractionalSeconds: 0)

        do {
            let _ = try char.encode()
        } catch {
            XCTFail()
        }

    }

    func testDecode() {

        let dt = DateTime(year: 2020, month: Month.january, day: 1, hours: 1, minutes: 1, seconds: 1)
        let dw = DayOfWeek.monday

        let char = CharacteristicCurrentTime(adjustmentReason: [.manualTimeUpdate], currentTime: dt, dayOfWeek: dw, fractionalSeconds: 0)

        do {
            let data = try char.encode()

            do {
                let newChar = try CharacteristicCurrentTime.decode(data: data)

                if newChar.adjustmentReason.contains(.manualTimeUpdate) == false {
                    XCTFail()
                }

                if newChar.dayOfWeek != dw {
                    XCTFail()
                }

                if newChar.currentTime != dt {
                    XCTFail()
                }

            } catch {
                XCTFail()
            }

        } catch {
            XCTFail()
        }

    }


    static var allTests = [
        ("testEncode", testEncode),
        ("testDecode", testDecode),
        ]

}
