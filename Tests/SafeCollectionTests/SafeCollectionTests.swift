import XCTest
import SafeCollection

class SafeCollectionTests: XCTestCase {
  func testSafeCollection() {
    let arr = ["A", "B", "C"]
    XCTAssertEqual(arr.safe[0], "A")
    XCTAssertEqual(arr.safe[1], "B")
    XCTAssertEqual(arr.safe[2], "C")
    XCTAssertNil(arr.safe[3])

    var mutableArr = ["A", "B", "C"]
    XCTAssertEqual(mutableArr.safe[0], "A")
    XCTAssertEqual(mutableArr.safe[1], "B")
    XCTAssertEqual(mutableArr.safe[2], "C")
    XCTAssertNil(mutableArr.safe[3])
    mutableArr.safe[2] = "D"
    XCTAssertEqual(mutableArr.safe[2], "D")
  }
}
