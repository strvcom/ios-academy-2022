//: [Previous](@previous)
//: # Access control
import Foundation

struct Assignment {
    private var id: String
    internal var title: String
    fileprivate var description: String
    // ACCESS CONTROL KEYWORDS WITH '(set)' SUFFIX MODIFY JUST A PROPERTY SETTER
    private(set) var completed: Bool
    
    init(id: String = "1234", title: String = "Title", description: String = "Long description", completed: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.completed = completed
    }
    
    mutating func complete() {
        self.completed = true
    }
}

//: ### Private
example(of: "Private") {
    var assignment = Assignment()
    
    // assignment.id = "1"
    // assignment.completed = true
    assignment.complete()
    
    print(assignment)
}

//: ### Fileprivate
example(of: "Fileprivate and Internal") {
    // It is difficult to demonstrate the difference between fileprivate and internal in Playgrounds
    // Fileprivate property is visible to every class, struct etc. within one file
    // Internal is visible to every class, struct etc. within whole module
    
    // INTERNAL IS A DEFFAULT ACCESS CONTROL LEVEL
    // I.E. WHEN YOU DON'T SPECIFY AN ACCESS CONTROL LEVEL FOR PROPERTY, CLASS, STRUCT ETC. IT IS INTERNAL
    var assignment = Assignment()
    
    assignment.description = "New description"
    print(assignment.description)
    
    // YOU CAN FIND AN IMPLEMENTATION OF THE 'OpenAssignment' IN 'Sources/Common.swift'
    // FROM THE COMPILER POINT OF VIEW THE 'OpenAssignment' IS DEFINED IN A DIFFERENT MODULE
    let openAssignment = OpenAssignment()
    // openAssignment.id = "123456"
    print(openAssignment)
}

//: ### Public
example(of: "Public") {
    // PUBLIC PROPERTIES AND METHODS ARE VISIBLE TO DIFFERENT MODULES BUT THEY CANNOT BE OVERRIDEN
    let assignment = OpenAssignment()
    
    //print(assignment.id)
    print(assignment.title)
}

//: ### Open
example(of: "Open") {
    // OPEN PROPERTIES AND METHODS ARE VISIBLE TO DIFFERENT MODULES, PLUS, THEY CAN BE OVERRIDEN
    class SwiftAssignment: OpenAssignment {
        //        override var uniqueDescription: String {
        //            return "unique"
        //        }
        
        override func desc() -> String {
            return "No description"
        }
    }
    
    let assignment = SwiftAssignment()
    print(assignment.desc())
}

//: [Next](@next)
