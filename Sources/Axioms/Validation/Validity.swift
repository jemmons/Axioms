import Foundation



public enum Validity {
    case valid, invalid(String)
    
    public var isValid: Bool {
        switch self {
        case .valid: return true
        case .invalid: return false
        }
    }
    
    
    public var isInvalid: Bool {
        return !isValid
    }
}
