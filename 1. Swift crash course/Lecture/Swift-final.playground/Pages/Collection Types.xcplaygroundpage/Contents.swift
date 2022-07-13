//: [Previous](@previous)
//: # Collection types
import Foundation
//: ## Arrays
//: ### Declaration
example(of: "Array declaration") {
    let _ = Array<String>()
    let _ = [String]()
    let _: [String] = []
    
    var mentors = ["Veronika", "Honza", "Tomas"]
    
    print(mentors[2])
    
    mentors[0] = "Jan"
    
    print(mentors)
}
//: ### Properties and methods
example(of: "Array properties and methods") {
    var mentors = ["Veronika", "Honza", "Tomas"]
    
    print(mentors.count)
    print(mentors.isEmpty)
    
    if let mentor = mentors.first {
        print(mentor)
    }
    
    mentors.append("Mireya")
    mentors.append(contentsOf: ["Rob", "Martin"])
    mentors.insert("Gleb", at: 0)
    mentors.remove(at: 3)
    
    print(mentors)
}
//: ### Loop array
example(of: "Loop array") {
    let mentors = ["Veronika", "Honza", "Tomas"]
    
    for mentor in mentors {
        print(mentor)
    }
    
    for index in 0...mentors.count-1 {
        print(mentors[index])
    }
    
    for tuple in mentors.enumerated() {
        print("Mentor \(tuple.element) is at \(tuple.offset) position")
    }
    
    mentors.forEach { mentor in
        print(mentor)
    }
}

//: ## Sets
//: ### Declaration
example(of: "Set declaration") {
    let names = ["Jan", "Jan", "Mireya"]
    let set = Set(names)
    
    print(names)
    print(set)
}
//: ## Dictionaries
//: ### Declaration
example(of: "Dictionary declaration") {
    let _ = Dictionary<Int, String>()
    let _ = [Int: String]()
    let _: [Int: String] = [:]
    
    var mentors = [1: "Jan", 2: "Rob", 3: "Martin"]
    
    if let mentor = mentors[1] {
        print(mentor)
    }
    
    mentors[1] = "Gleb"
    
    print(mentors)
}
//: ### Loop
example(of: "Loop dictionary") {
    let mentors = [1: "Jan", 2: "Rob", 3: "Martin"]
    
    for (position, name) in mentors {
        print("\(name) is a mentor number \(position)")
    }
}
//: [Next](@next)
