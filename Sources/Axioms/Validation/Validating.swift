import Foundation



@propertyWrapper public struct Validating<Value>: Validatable {
    private let validator: Validator<Value>
    public var wrappedValue: Value
    public var projectedValue: Validity {
        return validator.validate(wrappedValue)
    }
    
    
    public var validity: Validity {
        projectedValue
    }
    
    
    public init(wrappedValue aValue: Value, _ aValidator: Validator<Value>) {
        wrappedValue = aValue
        validator = aValidator
    }
}



extension Validating: Equatable, Hashable where Value: Hashable {
    public static func == (lhs: Validating<Value>, rhs: Validating<Value>) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
    
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(wrappedValue)
    }
}
