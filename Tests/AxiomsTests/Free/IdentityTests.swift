import Testing
import Axioms



struct IdentityTests {
    @Test func `identity should return self`() {
        let source: [Int?] = [1, 2, nil, 4]
        let subject = source.compactMap(id)
        #expect(subject == [1,2,4])
    }
}
