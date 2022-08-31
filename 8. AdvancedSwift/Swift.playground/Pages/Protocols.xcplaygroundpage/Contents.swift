//: [Previous](@previous)

//: # Protocols

import Foundation


//: ### Protocol defitiniton

/// Protocol
/// Try to get setter as well
protocol Identifiable {
    var id: String { get }
    func identify()
}


//: ### Protocol conformation

/// class conforms Identifiable protocol
class Student: Identifiable {

    // implementation of property
    var id: String

    // implementation of method
    func identify() {
        print("My id is \(id)")
    }

    init (id: String) {
        self.id = id
    }
}

/// sample instance
let student = Student(id: "123456")
student.identify()

/// struct conforms Identifiable protocol
struct Lector: Identifiable {

    // implementation of property
    var id: String

    // implementation of method
    func identify() {
        print("My id is \(id)")
    }

    init (id: String) {
        self.id = id
    }
}

/// sample instance
let lector = Lector(id: "CJ")
lector.identify()


//: ### Multiple protocol conformation

/// Sample empty protocol
protocol Human {}

protocol NameProviding {
    var name: String { get }
}

/// Enum conforms all three protocols
struct Employee: Identifiable, NameProviding, Human {
    var id: String {
        UUID().uuidString
    }

    let name: String

    func identify() {
        print("My id is \(id)")
    }
}

/// sample instance
let employee = Employee(name: "CJ")
employee.identify()


//: ### Protocol abstraction in func signature
func createIdentifiable() -> Identifiable {
    // the return type is unknown
    Employee(name: "Parker")
    // Student(id: "asdas")
    // Lector(id: "asdasd")
}

let identifiableObject = createIdentifiable()

// check if object conforms protocol
if identifiableObject is NameProviding {
    print("Im name providing")
}

// retype object to one comforming other protocol
if let retypedObject = identifiableObject as? NameProviding {
    print(retypedObject.name)
}

//: ### Typealias

/// Typealis as syntax suger for multiple protocol conformance
typealias EmployeeInfo = NameProviding & Human

struct PizzaDeliveryBoy: EmployeeInfo {
    let name: String
    let numberOfPizzas: Int
    
    func identify() {
        print("I'm \(name) and I can deliver \(numberOfPizzas) at once!")
    }
}

let fry = PizzaDeliveryBoy(name: "Fry", numberOfPizzas: 2)
fry.identify()

//: [Next](@next)
