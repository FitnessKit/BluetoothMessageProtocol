import XCTest
@testable import BluetoothMessageProtocolTests

XCTMain([
    testCase(CompanyIdentifierTests.allTests),
    testCase(CharacteristicCurrentTimeTests.allTests),
])
