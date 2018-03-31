import XCTest
@testable import BluetoothMessageProtocolTests

XCTMain([
    testCase(CompanyIdentifierTests.allTests),
    testCase(MemberIdentifierTests.allTests),
    testCase(CharacteristicCurrentTimeTests.allTests),
])
