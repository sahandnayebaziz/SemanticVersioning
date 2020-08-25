import XCTest
@testable import SemanticVersioning

final class SemanticVersioningTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SemanticVersioning().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
