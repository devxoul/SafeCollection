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

public struct SafeIndex<T: Comparable> {
  public var index: T
  public init(_ index: T) {
    self.index = index
  }
}

extension SafeIndex: CustomStringConvertible {
  public var description: String {
    return "^\(self.index)"
  }
}

extension SafeIndex: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "^\(self.index)"
  }
}

extension SafeIndex: Equatable {
  public static func == (lhs: SafeIndex<T>, rhs: SafeIndex<T>) -> Bool {
    return lhs.index == rhs.index
  }
  public static func == (lhs: SafeIndex<T>, rhs: T) -> Bool {
    return lhs.index == rhs
  }
  public static func == (lhs: T, rhs: SafeIndex<T>) -> Bool {
    return lhs == rhs.index
  }
}

extension SafeIndex: Comparable {
  public static func < (lhs: SafeIndex<T>, rhs: SafeIndex<T>) -> Bool {
    return lhs.index < rhs.index
  }
  public static func < (lhs: SafeIndex<T>, rhs: T) -> Bool {
    return lhs.index < rhs
  }
  public static func < (lhs: T, rhs: SafeIndex<T>) -> Bool {
    return lhs < rhs.index
  }

  public static func <= (lhs: SafeIndex<T>, rhs: SafeIndex<T>) -> Bool {
    return lhs.index <= rhs.index
  }
  public static func <= (lhs: SafeIndex<T>, rhs: T) -> Bool {
    return lhs.index <= rhs
  }
  public static func <= (lhs: T, rhs: SafeIndex<T>) -> Bool {
    return lhs <= rhs.index
  }

  public static func >= (lhs: SafeIndex<T>, rhs: SafeIndex<T>) -> Bool {
    return lhs.index >= rhs.index
  }
  public static func >= (lhs: SafeIndex<T>, rhs: T) -> Bool {
    return lhs.index >= rhs
  }
  public static func >= (lhs: T, rhs: SafeIndex<T>) -> Bool {
    return lhs >= rhs.index
  }

  public static func > (lhs: SafeIndex<T>, rhs: SafeIndex<T>) -> Bool {
    return lhs.index > rhs.index
  }
  public static func > (lhs: SafeIndex<T>, rhs: T) -> Bool {
    return lhs.index > rhs
  }
  public static func > (lhs: T, rhs: SafeIndex<T>) -> Bool {
    return lhs > rhs.index
  }
}

extension SafeIndex where T: IntegerArithmetic {
  public static func + (lhs: SafeIndex<T>, rhs: SafeIndex<T>) -> SafeIndex<T> {
    return SafeIndex(lhs.index + rhs.index)
  }
  public static func + (lhs: SafeIndex<T>, rhs: T) -> SafeIndex<T> {
    return SafeIndex(lhs.index + rhs)
  }
  public static func + (lhs: T, rhs: SafeIndex<T>) -> SafeIndex<T> {
    return SafeIndex(lhs + rhs.index)
  }

  public static func - (lhs: SafeIndex<T>, rhs: SafeIndex<T>) -> SafeIndex<T> {
    return SafeIndex(lhs.index - rhs.index)
  }
  public static func - (lhs: SafeIndex<T>, rhs: T) -> SafeIndex<T> {
    return SafeIndex(lhs.index - rhs)
  }
  public static func - (lhs: T, rhs: SafeIndex<T>) -> SafeIndex<T> {
    return SafeIndex(lhs - rhs.index)
  }

  public static func * (lhs: SafeIndex<T>, rhs: SafeIndex<T>) -> SafeIndex<T> {
    return SafeIndex(lhs.index * rhs.index)
  }
  public static func * (lhs: SafeIndex<T>, rhs: T) -> SafeIndex<T> {
    return SafeIndex(lhs.index * rhs)
  }
  public static func * (lhs: T, rhs: SafeIndex<T>) -> SafeIndex<T> {
    return SafeIndex(lhs * rhs.index)
  }

  public static func / (lhs: SafeIndex<T>, rhs: SafeIndex<T>) -> SafeIndex<T> {
    return SafeIndex(lhs.index / rhs.index)
  }
  public static func / (lhs: SafeIndex<T>, rhs: T) -> SafeIndex<T> {
    return SafeIndex(lhs.index / rhs)
  }
  public static func / (lhs: T, rhs: SafeIndex<T>) -> SafeIndex<T> {
    return SafeIndex(lhs / rhs.index)
  }

  public static func % (lhs: SafeIndex<T>, rhs: SafeIndex<T>) -> SafeIndex<T> {
    return SafeIndex(lhs.index % rhs.index)
  }
  public static func % (lhs: SafeIndex<T>, rhs: T) -> SafeIndex<T> {
    return SafeIndex(lhs.index % rhs)
  }
  public static func % (lhs: T, rhs: SafeIndex<T>) -> SafeIndex<T> {
    return SafeIndex(lhs % rhs.index)
  }

  public func toIntMax() -> IntMax {
    return self.index.toIntMax()
  }
}

prefix operator ^
public prefix func ^ <T: Comparable>(index: T) -> SafeIndex<T> {
  return SafeIndex(index)
}

prefix operator ^-
public prefix func ^- <T: Integer>(index: T) -> SafeIndex<T> {
  return SafeIndex(-1 * index)
}

public extension Collection {
  public subscript(safe: SafeIndex<Self.Index>?) -> Self._Element? {
    get {
      guard let safe = safe else { return nil }
      return (self.startIndex..<self.endIndex).contains(safe.index) ? self[safe.index] : nil
    }
  }
}

public extension MutableCollection {
  public subscript(safe: SafeIndex<Self.Index>?) -> Self._Element? {
    get {
      guard let safe = safe else { return nil }
      return (self.startIndex..<self.endIndex).contains(safe.index) ? self[safe.index] : nil
    }
    set {
      guard let safe = safe,
        let value = newValue,
        self.startIndex..<self.endIndex ~= safe.index
        else { return }
      self[safe.index] = value
    }
  }
}
