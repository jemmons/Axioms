import Foundation



public struct Validator<Value> {
    private let validator: (Value)->Validity
    
    
    public init(validator aValidator: @escaping (Value)->Validity) {
        validator = aValidator
    }
    
    
    public init(_ reason: String, validator boolValidator: @escaping (Value)->Bool) {
        self.init { value in
            switch boolValidator(value) {
            case true: return .valid
            case false: return .invalid(reason)
            }
        }
    }
}



public extension Validator {
    static func throwing(validator: @escaping (Value) throws -> Void) -> Self {
        self.init  { value in
            do {
                try validator(value)
                return .valid
            } catch {
                return .invalid(error.localizedDescription)
            }
        }
    }
    
    
    static func simple(validator: @escaping (Value)->Bool) -> Self {
        self.init { value in
            switch validator(value) {
            case true: return .valid
            case false: return .invalid("“\(value)” is invalid.")
            }
        }
    }
    
    
    func validate(_ value: Value) -> Validity {
        validator(value)
    }
}
