public extension Collection {
  public subscript(safe index: Self.Index?) -> Self.Element? {
    get {
      guard let index = index else { return nil }
      return (self.startIndex..<self.endIndex).contains(index) ? self[index] : nil
    }
  }
}

public extension MutableCollection {
  public subscript(safe index: Self.Index?) -> Self.Element? {
    get {
      guard let index = index else { return nil }
      return (self.startIndex..<self.endIndex).contains(index) ? self[index] : nil
    }
    set {
      guard let index = index, let value = newValue, (self.startIndex..<self.endIndex).contains(index) else { return }
      self[index] = value
    }
  }
}
