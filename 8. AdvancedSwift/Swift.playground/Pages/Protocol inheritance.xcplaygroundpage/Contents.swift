//: [Previous](@previous)

//: # Protocols inheritance

import Foundation

//: ### Protocol inheritance

/// Protocol definitions heirarchy
protocol Identifiable {
    var id: String { get }
}

protocol NameProviding: Identifiable {
    var name: String { get }
}

protocol SurnameProviding: Identifiable {
    var surname: String { get }
}

/// compose by inheritance of all protocols above
protocol FullnameProviding: NameProviding, SurnameProviding {
    var newRequirement: String { get }
}
// difference between compose & typealias
typealias FullNameProvidingTypealias = NameProviding & SurnameProviding

struct OriginalPerson: FullNameProvidingTypealias {
    var name: String
    var surname: String
    var id: String
}

// Sample struct
struct Person: FullnameProviding {
    var newRequirement: String
    var id: String
    var name: String
    var surname: String
}

let person = Person(newRequirement: "Fillip asked", id: "id", name: "name", surname: "surname")

//: ### Default implementation

/// default implementation of Identifiable
extension Identifiable {
    var id: String {
        UUID().uuidString
    }
    
    func identify() {
        print("Protocol id \(id)")
    }
}

struct Human: Identifiable {
    var id: String {
        "my beautiful lady" // id given from public
    }
}

/// ad hoc example from lesson
class Foo: Identifiable {
    func identify() {
        print("Im foo")
    }
}

class ExtendedFoo: Foo {
    override func identify() {
        print("Im extended foo")
    }
}

let foo = Foo()
foo.identify()
let newExtendedFoo = ExtendedFoo()
newExtendedFoo.identify()


/// extra new method in extension
extension NameProviding {
    func initials() -> Character? {
        name.first
    }
}

let david = Person(newRequirement: "Filip asked", id: "23412", name: "David", surname: "Cooperfield")
david.initials()

//: ### Constraints

protocol UppercasedNamed {
    var uppercasedName: String { get }
}

/// constraint sample `where` key word
extension UppercasedNamed where Self: NameProviding {
        /// using variables & methods of NameProviding to implement UppercasedNamed
        /// constraint may be also used with classes
    var uppercasedName: String {
        name.uppercased()
    }
}

/// sample of static variable in protocol definition
protocol StaticName: AnyObject {
    static var name: String { get }
}

/// sample that static variable can be conformed also as class variable
class User: StaticName {
    class var name: String {
        "USER"
    }
}


//: [Next](@next)
