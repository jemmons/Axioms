import Foundation


public enum SortOrder {
    case increasing
    case decreasing
}

/**
 Returns a function sutable for passing to `sorted` that uses the value at the
 `KeyPath` for the comparison.
 
 ```
 let people: [Person] = ...
 let sortedPeople = people.sorted(by: sortablePath(\.name))
 ```
 */
public func sortPath<Compared, Value>(_ kp: KeyPath<Compared, Value>, order: SortOrder = .increasing) -> (Compared, Compared) -> Bool
where Value: Comparable  {
    return { (a: Compared, b: Compared) -> Bool in
        switch order {
        case .increasing:
            return a[keyPath: kp] < b[keyPath: kp]
        case .decreasing:
            return a[keyPath: kp] > b[keyPath: kp]
        }
        
    }
}
