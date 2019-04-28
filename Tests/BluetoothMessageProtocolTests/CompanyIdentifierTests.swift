import XCTest
@testable import BluetoothMessageProtocol

class CompanyIdentifierTests: XCTestCase {

    func testRegisterCompany() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //XCTAssertEqual(BluetoothMessageProtocol().text, "Hello, World!")

        switch CompanyIdentifier.registerCompany(CompanyIdentifier(id: 65534, name: "Not")) {
        case .success(_):
            break
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }

        switch CompanyIdentifier.registerCompany(.apple) {
        case .success(_):
            XCTFail("This should have failed as apple is already registered")
        case .failure(_):
            break
        }

    }

    func testCompanyDups() {

        let x = CompanyIdentifier.supportedCompanyIdentifers
        let duplicates = Array(Set(x.filter({ (i: CompanyIdentifier) in x.filter({ $0.companyID == i.companyID }).count > 1})))

        if duplicates.count > 0 {
            for dup in duplicates {
                print("Dup: \(dup.companyID) - \(dup.name)")
            }
            XCTFail("Multiple same IDs found")
        }

        print("CompanyIdentifier Count: \(CompanyIdentifier.supportedCompanyIdentifers.count)")
    }

    func testFindCompany() {

        if CompanyIdentifier.company(id: 76) != CompanyIdentifier.apple {
            XCTFail()
        }

        if CompanyIdentifier.company(id: 86) == CompanyIdentifier.apple {
            XCTFail()
        }

        if CompanyIdentifier.company(id: 65534) != nil {
            XCTFail()
        }
    }


    static var allTests = [
        ("testRegisterCompany", testRegisterCompany),
        ("testCompanyDups", testCompanyDups),
        ("testFindCompany", testFindCompany),
    ]
}
