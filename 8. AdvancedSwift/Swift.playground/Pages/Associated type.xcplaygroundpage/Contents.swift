//: [Previous](@previous)

//: # Associated types

//: ### Protocol with associated type

import Foundation

protocol ItemManager {
    associatedtype ItemType // abstract type we named ItemType
    var items: [ItemType] { get }
}

class FirstItemManager: ItemManager {
    typealias ItemType = String // explicit assignment of ItemType type
    var items: [String] = []
}

class SecondItemManager: ItemManager {
    var items: [Int] = [] // implicit type assignment of Int
}

//: ### Constraints

protocol Identifiable {
    associatedtype ID: Hashable /// ID can be any type which is hashable
    var id: ID { get }
}

// ID is String
struct Website: Identifiable {
    var id: String
}

// ID is UUID type
struct Person: Identifiable {
    var id: UUID {
        UUID()
    }
}

//: ### Generic constraint issue
/// typical issue
/// 'protocol can only be used as a generic constraint because it has Self or associated type requirements'

// we can't use Identifiable here as it already has its own associated type abstraction
//struct NotWorking {
//    var identifiableVariable: Identifiable
//}

// solution can be opaque type, existencial type (any) or generic level of abstraction
struct Working {
    var identifiableVariable: some Identifiable {
        Person()
    }
}

//: ### Generic types

let website = Website(id: "test")
let person = Person()

// we can't compare different types even though both conforms Identifiable, method signature requires same type for both inputs

//func compareOne(_ lhs: Identifiable, rhs: Identifiable) -> Bool {
//    //we don't know types
//}

func compareGenericWay<T: Identifiable> (_ lhs: T, rhs: T) -> Bool {
    lhs.id == rhs.id
}

// can't use with two different types
// compareGenericWay(person, against: website)

///An opaque type can be seen as the reverse of a generic type. The types to which the generic types are mapped are dictated by the call site, and the function implementation is based on the abstract footprint of acceptable types. Those roles are reversed for a function with an opaque return type. An opaque type lets the function implementation pick the type for the value it returns in a way that is abstracted away from the call site.
///
/// https://www.avanderlee.com/swift/existential-any/

//: [Next](@next)
