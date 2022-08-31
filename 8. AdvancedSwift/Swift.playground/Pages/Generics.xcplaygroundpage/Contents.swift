//: [Previous](@previous)

//: # Generics

import Foundation

//: ### Generics

/// Cache
func store(item: String) -> String {
    print(item)
    return item
}

func store(item: Int) -> Int {
    print(item)
    return item
}

// generic function instead of multiple similar implementation
func store<T: Decodable & Identifiable>(item: T) -> T {
    print(item)
    return item
}

// In this case the return type might be different to input type but both Decodable conforming
//func store(item: Decodable) -> Decodable {
//    Lady(name: "Jane")
//}

//let result = store(item: Person(name: "Jack"))


struct Person: Decodable, Identifiable {
    var name: String
    var id: String
}

struct Lady: Decodable, Identifiable {
    var name: String
    var id: String
}

let person = Person(name: "CJ Parker", id: "123456")
let newPerson = store(item: person)
newPerson.self

let lady = Lady(name: "Jane", id: "654321")
let newLady = store(item: lady)
newLady.self

/// sample of generic struct
struct Queue<T> {
    private var internalArray = [T]()

    var count: Int {
        internalArray.count
    }

    mutating func add(_ item: T) {
        internalArray.append(item)
    }

    mutating func remove() -> T? {
        if internalArray.count > 0 {
            return internalArray.removeFirst()
        } else {
            return nil
        }
    }
}
/// Here T is resolved as Int
let queue = Queue<Int>()

/// generic with constraint

func findIndex<T:Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for(index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
 }


//: [Next](@next)
