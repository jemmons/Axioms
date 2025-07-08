import Foundation



extension Dictionary{
    /// Like `merging`, but explicitly named so we don’t need to add a conflict policy.
    public func merging(overwrittenBy newDictionary: [Key: Value]) -> [Key: Value] {
        return self.merging(newDictionary) { $1 }
    }
    
    
    /// Like `merge`, but explicitly named so we don’t need to add a conflict policy.
    mutating public func merge(overwrittenBy newDictionary: [Key: Value]) {
        self.merge(newDictionary){ $1 }
    }
}
