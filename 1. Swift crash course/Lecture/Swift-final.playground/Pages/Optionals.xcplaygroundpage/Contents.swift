//: [Previous](@previous)
//: # Optionals
import Foundation
//: ## Introduction
//: ### Why optionals
example(of: "Type casting") {
    let ageString = "a"
    let age = Int(ageString)
    
    print(age)
    print(type(of: age))
}
//: ### Declare an optional
example(of: "Optional integer") {
    let age: Int? = 23
    print(type(of: age))
    
    let age2: Optional<Int> = 23
    print(type(of: age2))
}
//: ## Unwrapping
//: ### Force unwrap
example(of: "Force unwrap") {
    let age: Int? = 23
    
    if age == nil {
        print("Age is nil")
    } else if age == 23 {
        print("Age is 23")
    } else {
        print("Age is \(age!)")
    }
    
    // this will crash
    // print(age!)
}
//: ### If let
example(of: "If let") {
    let age: Int? = 23
    
    if let unwrappedAge = age {
        print(unwrappedAge)
        print(type(of: unwrappedAge))
    }
    
    // can't use unwrappedAge here
    // print(unwrappedAge)
}
//: ### Guard let
example(of: "Guard let") {
    let age: Int? = 23
    
    guard let unwrappedAge = age else {
        print("Age is nil")
        
        // can't use unwrappedAge here
        // print(unwrappedAge)
        
        return
    }
    
    print(unwrappedAge)
}
//: ## Working with optionals
//: ### Comparison
example(of: "Comparison") {
    let age: Int? = 23
    
    if age == nil {
        print("Age is nil")
    // we have to unwrap the age first before comapring it
    } else if let age = age, age > 18 {
        print("You are adult \(age)")
    }
}
//: ### Calling function on optional
example(of: "Calling function on optional") {
    let age: Int? = nil
    
    // this will crash
    // print(age!.advanced(by: 2))
    
    // safely unwrapped
    print(age?.advanced(by: 2))
}
//: [Next](@next)
