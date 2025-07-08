import Testing
import Axioms



struct DictionaryMergeTests {
    @Test func `should merge without conflict`() {
        var subject = [1: "one", 2: "two"]
        subject.merge(overwrittenBy: [3: "three", 4: "four"])
        #expect(subject[1] == "one")
        #expect(subject[2] == "two")
        #expect(subject[3] == "three")
        #expect(subject[4] == "four")
    }
    
    
    @Test func `argument should overwrite subject`() {
        var subject = [1: "one", 2: "two"]
        subject.merge(overwrittenBy: [2: "new", 3: "three"])
        #expect(subject[1] == "one")
        #expect(subject[2] == "new")
        #expect(subject[3] == "three")
    }
    
    
    @Test func `should make copy with no conflicts`() {
        let source = [1: "one", 2: "two"]
        let subject = source.merging(overwrittenBy: [3: "three", 4: "four"])
        #expect(subject[1] == "one")
        #expect(subject[2] == "two")
        #expect(subject[3] == "three")
        #expect(subject[4] == "four")
    }
    
    
    @Test func `copy with subject overwritten by argument`() {
        let source = [1: "one", 2: "two"]
        let subject = source.merging(overwrittenBy: [2: "new", 3: "three"])
        #expect(subject[1] == "one")
        #expect(subject[2] == "new")
        #expect(subject[3] == "three")
    }
}
