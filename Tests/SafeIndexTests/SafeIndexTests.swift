// The MIT License (MIT)
//
// Copyright (c) 2016 Suyeol Jeon (xoul.kr)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import XCTest
import SafeIndex

class SafeIndexTests: XCTestCase {
  func testSafeIndex() {
    let arr = ["A", "B", "C"]
    XCTAssertEqual(arr[^0], "A")
    XCTAssertEqual(arr[^1], "B")
    XCTAssertEqual(arr[^2], "C")
    XCTAssertNil(arr[^3])

    var mutableArr = ["A", "B", "C"]
    XCTAssertEqual(mutableArr[^0], "A")
    XCTAssertEqual(mutableArr[^1], "B")
    XCTAssertEqual(mutableArr[^2], "C")
    XCTAssertNil(mutableArr[^3])
    mutableArr[^2] = "D"
    XCTAssertEqual(mutableArr[^2], "D")
  }

  func testSafeIndexMinus() {
    XCTAssertEqual(^-5, ^(-5))
  }

  func testSafeIndexEquatable() {
    XCTAssertTrue(^5 == ^5)
    XCTAssertTrue(^3 == 3)
    XCTAssertTrue(2 == ^2)
  }

  func testSafeIndexComparable() {
    XCTAssertTrue(^5 > ^4)
    XCTAssertTrue(5 > 4)
    XCTAssertTrue(5 > ^4)

    XCTAssertTrue(^3 >= ^3)
    XCTAssertTrue(^3 >= 3)
    XCTAssertTrue(3 >= ^3)

    XCTAssertTrue(^4 < ^6)
    XCTAssertTrue(^4 < 6)
    XCTAssertTrue(4 < ^6)

    XCTAssertTrue(^6 <= ^6)
    XCTAssertTrue(^6 <= 6)
    XCTAssertTrue(6 <= ^6)
  }

  func testSafeIndexArithmetic() {
    XCTAssertEqual(^5, ^2 + ^3)
    XCTAssertEqual(^11, ^10 + 1)
    XCTAssertEqual(^12, 2 + ^10)

    XCTAssertEqual(^1, ^3 - ^2)
    XCTAssertEqual(^9, ^10 - 1)
    XCTAssertEqual(^3, 11 - ^8)

    XCTAssertEqual(^6, ^2 * ^3)
    XCTAssertEqual(^20, ^10 * 2)
    XCTAssertEqual(^30, 3 * ^10)

    XCTAssertEqual(^2, ^6 / ^3)
    XCTAssertEqual(^3, ^10 / 3)
    XCTAssertEqual(^6, 20 / ^3)
  }
}
