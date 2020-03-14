//
//  CharacteristicCurrentTimeTests.swift
//  BluetoothMessageProtocolTests
//
//  Created by Kevin Hoogheem on 12/23/17.
//

import XCTest
@testable import BluetoothMessageProtocol

@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
class CharacteristicCurrentTimeTests: XCTestCase {
    
    func testEncode() {

        let dt = DateTime(year: 2000, month: Month.january, day: 1, hours: 1, minutes: 1, seconds: 1)
        let dw = DayOfWeek.monday

        let char = CharacteristicCurrentTime(adjustmentReason: .manualTimeUpdate, currentTime: dt, dayOfWeek: dw, fractionalSeconds: 0)

        do {
            _ = try char.encode().get()
        } catch {
            XCTFail()
        }

    }

    func testDecode() {

        let dt = DateTime(year: 2020, month: Month.january, day: 1, hours: 1, minutes: 1, seconds: 1)
        let dw = DayOfWeek.monday

        let char = CharacteristicCurrentTime(adjustmentReason: [.manualTimeUpdate], currentTime: dt, dayOfWeek: dw, fractionalSeconds: 0)

        do {
            let data = try char.encode().get()

            let result: Result<CharacteristicCurrentTime, BluetoothDecodeError> = CharacteristicCurrentTime.decode(with: data)
            switch result {
            case .success(let newChar):
                if newChar.adjustmentReason.contains(.manualTimeUpdate) == false {
                    XCTFail()
                }
                
                if newChar.dayOfWeek != dw {
                    XCTFail()
                }
                
                if newChar.currentTime != dt {
                    XCTFail()
                }

            case .failure(let error):
                XCTFail(error.localizedDescription)
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
