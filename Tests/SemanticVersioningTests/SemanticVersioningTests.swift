import XCTest
@testable import SemanticVersioning

final class SemanticVersioningTests: XCTestCase {
    
    func testCreation() {
        let expected1 = SemanticVersionComponents(major: 1, minor: 0, patch: 0)
        let actual1 = SemanticVersion(string: "1.0.0").components
        XCTAssertEqual(expected1, actual1)
        
        let expected123 = SemanticVersionComponents(major: 1, minor: 2, patch: 3)
        let actual123 = SemanticVersion(string: "1.2.3").components
        XCTAssertEqual(expected123, actual123)
        
        let expectedShort = SemanticVersionComponents(major: 9, minor: 0, patch: 0)
        let actualShort = SemanticVersion(string: "9").components
        XCTAssertEqual(expectedShort, actualShort)
        
        let expectedMedium = SemanticVersionComponents(major: 9, minor: 12, patch: 0)
        let actualMedium = SemanticVersion(string: "9.12").components
        XCTAssertEqual(expectedMedium, actualMedium)
    }
    
    func testCompatability() {
        let expectedSame = true
        let actualSame = SemanticVersion(string: "1.0.8").isFullyCompatible(with: SemanticVersion(string: "1.0.8"))
        XCTAssertEqual(expectedSame, actualSame)
        
        let expectedNewerPatch = false
        let actualNewerPatch = SemanticVersion(string: "1.0.1").isFullyCompatible(with: SemanticVersion(string: "1.0.2"))
        XCTAssertEqual(expectedNewerPatch, actualNewerPatch)
        
        let expectedNewerMinor = false
        let actualNewerMinor = SemanticVersion(string: "1.0.1").isFullyCompatible(with: SemanticVersion(string: "1.1"))
        XCTAssertEqual(expectedNewerMinor, actualNewerMinor)
        
        let expectedNewerMajor = false
        let actualNewerMajor = SemanticVersion(string: "1.0.1").isFullyCompatible(with: SemanticVersion(string: "2.0"))
        XCTAssertEqual(expectedNewerMajor, actualNewerMajor)
        
        let expectedOlderUgly = true
        let actualOlderUgly = SemanticVersion(string: "4.11.23").isFullyCompatible(with: SemanticVersion(string: "3.876.2344"))
        XCTAssertEqual(expectedOlderUgly, actualOlderUgly)
    }
    
}
