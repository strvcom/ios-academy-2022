//: [Previous](@previous)
//: # Structures, classes, enumerations
import Foundation
//: ## Structures
//: ### Declaration
example(of: "Struct declaration") {
    struct Person {
        let firstName: String
        let lastName: String
    }
    
    let person = Person(firstName: "Veronika", lastName: "Zelinkova")
    print(person.firstName)
}

//: ### Explicit initializer
example(of: "Struct with explicit initializer") {
    struct Person {
        let firstName: String
        let lastName: String
        
        // Explicit initializer
        init(firstname: String) {
            self.firstName = firstname
            self.lastName = "Zelinkova"
        }
    }
    
    let person = Person(firstname: "Veronika")
    print(person.firstName)
    print(person.lastName)
}

//: ### Mutating
example(of: "Mutating structure") {
    struct Person1 {
        let firstName: String
        let lastName: String
    }
    
    let person = Person1(firstName: "V", lastName: "Z")
    // person.firstName = "Jan"
    
    struct Person2 {
        var firstName: String
        var lastName: String
        
        // Mutating function
        mutating func update(firstName: String) {
            self.firstName = firstName
        }
    }
    
    var person2 = Person2(firstName: "V", lastName: "Z")
    person2.update(firstName: "Jan")
    
    print(person2)
}

//: ### Value type
example(of: "Value type") {
    struct Person {
        var firstName: String
        var lastName: String
    }
    
    var person1 = Person(firstName: "V", lastName: "Z")
    var person2 = person1
    person1.firstName = "J"
    
    print(person1)
    print(person2)
}

//: ### Inheritance
example(of: "Inheritance") {
    struct Person {
        var firstName: String
        var lastName: String
    }

    // we can't inherit from structs
    
    /*struct UppercasedPerson: Person {
    }*/
}

//: ## Classes
//: ### Declaration
example(of: "Class declaration") {
    class Person {
        let firstName: String
        let lastName: String
        
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
    }
    
    let person = Person(firstName: "V", lastName: "Z")
    print(person.firstName)
}

//: ### Mutating
example(of: "Mutating class") {
    class Person1 {
        let firstName: String
        let lastName: String
        
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
    }
    
    let person = Person1(firstName: "V", lastName: "Z")
    // person.firstName = "J"
    
    class Person2 {
        var firstName: String
        var lastName: String
        
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
        
        func update(firstName: String) {
            self.firstName = firstName
        }
    }
    
    let person2 = Person2(firstName: "V", lastName: "Z")
    person2.firstName = "J"
    print(person2.firstName)
}

//: ### Reference type
example(of: "Reference type") {
    class Person {
        var firstName: String
        var lastName: String
        
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
    }
    
    var person1 = Person(firstName: "V", lastName: "Z")
    var person2 = person1
    person1.firstName = "J"
    
    print(person1.firstName)
    print(person2.firstName)
}

//: ### Inheritance
example(of: "Inheritance") {
    class Person {
        var firstName: String
        var lastName: String
        
        init() {
            self.firstName = "Jan"
            self.lastName = "Schwarz"
        }
    }
    
    class UppercasedPerson: Person {
        override init() {
            super.init()
            
            self.firstName = "JAN"
            self.lastName = "SCHWARZ"
        }
    }
    
    let person = UppercasedPerson()
    print(person.firstName)
}

//: ## Enumerations
//: ### Declaration
example(of: "Enum declaration") {
    enum Languages {
        case swift
        case objc
    }
    
    let language: Languages = .objc
}

//: ### Enum with raw value
example(of: "Enum with raw value") {
    enum Languages: String {
        case swift
        case objc = "objective-c"
    }
    
    print(Languages.objc.rawValue)
}

//: ### Enum with associated value
example(of: "Enum with associated value") {
    
    enum Language: String {
        case swift
        case objc = "objective-c"
    }
    
    enum Platform {
        case android
        case ios(language: Language)
    }
    
    let platform = Platform.ios(language: .swift)
}

//: [Next](@next)
