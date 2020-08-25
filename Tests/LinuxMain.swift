import XCTest

import SemanticVersioningTests

var tests = [XCTestCaseEntry]()
tests += SemanticVersioningTests.allTests()
XCTMain(tests)
