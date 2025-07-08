import Testing
import Axioms



struct ArrayAppendingTests {
    @Test func `should append array`() {
        let subject = [1,2,3].appending(contentsOf: [3,2,1])
        #expect(subject == [1,2,3,3,2,1])
    }
}

