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



