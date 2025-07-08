import Foundation



extension CGPoint: @retroactive ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: CGFloat...) {
    precondition(elements.count == 2)
    self.init(x: elements[0], y: elements[1])
  }
}
