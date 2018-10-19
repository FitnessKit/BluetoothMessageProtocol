import XCTest
@testable import BluetoothMessageProtocolTests

XCTMain([
    testCase(CompanyIdentifierTests.allTests),
    testCase(MemberIdentifierTests.allTests),
    testCase(CharacteristicCurrentTimeTests.allTests),
    testCase(CodeableTests.allTests),
    testCase(ModelIdentifierTests.allTests),
    testCase(GymConnectTests.allTests),
    testCase(HomeKitTests.allTests),
])
