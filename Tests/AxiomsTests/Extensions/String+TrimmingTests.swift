import Testing
import Axioms



struct StringTrimmingTests {
    @Test(arguments: ["  ", " \t \t", "\n\t\r", " ", " "])
    func `Whitespace should be blank`(subject: String) {
        #expect(!subject.isEmpty)
        #expect(subject.isBlank)
        #expect(!subject.isNotBlank)
    }
    
    @Test(arguments: ["|", "1", "a", "👾", "␠"])
    func `Weird characters should not be blank`(subject: String) {
        #expect(!subject.isBlank)
        #expect(subject.isNotBlank)
    }

    @Test func `Empty strings should be blank`() {
        let subject = ""
        #expect(subject.isEmpty)
        #expect(subject.isBlank)
        #expect(!subject.isNotBlank)
    }
}

