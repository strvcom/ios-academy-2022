//: [Previous](@previous)

//: # Property wrappers
import Foundation

/// special struct with annotation
@propertyWrapper struct Capitalized {
    private var originalValue: String
    /// wrappedValue & projected value
    var wrappedValue: String {
        didSet {
            originalValue = wrappedValue
            wrappedValue = wrappedValue.capitalized
        }
    }
    
    var projectedValue: String {
        originalValue
    }

    init(wrappedValue: String) {
        self.originalValue = wrappedValue
        self.wrappedValue = wrappedValue.capitalized
    }
}

struct User {
    /// usage of property wrapper
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}

// John Appleseed
var user = User(firstName: "john", lastName: "appleseed")

print(user.firstName)
print(user.lastName)
// projected value return original input
print(user.$firstName)


//: [Next](@next)
