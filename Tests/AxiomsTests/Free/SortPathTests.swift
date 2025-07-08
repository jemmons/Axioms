import Testing
import Axioms



struct SortPathTests {
    struct Obj {
        let value: Int
    }


    let source = [Obj(value: 2), Obj(value: 5), Obj(value: 3), Obj(value: 6), Obj(value: 1)]


    @Test func `sorts increasing`() {
        let subject = source.sorted(by: sortPath(\.value))
        #expect(subject.map(\.value) == [1,2,3,5,6])
    }
    
    
    @Test func `sorts increasing explicitly`() {
        let subject = source.sorted(by: sortPath(\.value, order: .increasing))
        #expect(subject.map(\.value) == [1,2,3,5,6])
    }
    
    
    @Test func `sorts decreasing`() {
        let subject = source.sorted(by: sortPath(\.value, order: .decreasing))
        #expect(subject.map(\.value) == [6,5,3,2,1])
    }
}

