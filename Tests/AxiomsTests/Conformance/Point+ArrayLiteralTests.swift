import Testing
import Axioms
import Foundation



struct PointArrayLiteralTests {
    @Test(arguments: [[1,9], [3,7], [4.5, 5.5]]) func arePoints(point: CGPoint) {
        #expect(point.x + point.y == 10.0)
    }
}
