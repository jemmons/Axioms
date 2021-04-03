import Foundation



public protocol Validatable {
    var validity: Validity { get }
}



extension Validatable {
    public var validity: Validity {
        return Mirror(reflecting: self)
            .children
            .compactMap { $0.value as? Validatable }
            .map(\.validity)
            .reduce(Validity.valid) { reduced, next in
                switch (reduced, next) {
                case (.invalid, _), (_, .valid): return reduced
                case(_, .invalid): return next
                }
            }
    }
}

