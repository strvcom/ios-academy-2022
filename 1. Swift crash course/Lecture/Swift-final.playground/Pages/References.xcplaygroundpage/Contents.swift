//: [Previous](@previous)
//: # References
import Foundation

//: ### Reference counting
example(of: "Reference counting") {
    class Person {
        let name: String
        
        init(name: String) {
            self.name = name
            
            print("Person \(name) initialized")
        }
        
        deinit {
            print("Person \(name) deinitialized")
        }
    }
    
    var person1: Person? = Person(name: "Jan")
    var person2: Person? = person1
    person1 = nil
    print("Setting person2 to nil")
    person2 = nil
}

//: ### Retain cycle
example(of: "Retain cycle") {
    class Person {
        let name: String
        var image: ProfileImage?
        
        init(name: String) {
            self.name = name
            
            print("Person \(name) initialized")
        }
        
        deinit {
            print("Person \(name) deinitialized")
        }
    }

    class ProfileImage {
        let url: URL?
        var person: Person?
        
        init(url: URL?) {
            self.url = url
            
            print("Image \(self) initialized")
        }
        
        deinit {
            print("Image \(self) deinitialized")
        }
    }
    
    var person: Person? = Person(name: "Jan")
    var image: ProfileImage? = ProfileImage(url: nil)
    
    person?.image = image
    image?.person = person
    
    person = nil
    image = nil
}

//: ### Weak reference
example(of: "Weak reference") {
    class Person {
        let name: String
        var image: ProfileImage?
        
        init(name: String) {
            self.name = name
            print("Person \(name) initialized")
        }
        
        deinit {
            print("Person \(name) deinitialized")
        }
    }
    
    class ProfileImage {
        let url: URL?
        weak var person: Person?
        
        init(url: URL?) {
            self.url = url
            print("Image \(self) initialized")
        }
        
        deinit {
            print("Image \(self) deinitialized")
        }
    }
    
    var person: Person? = Person(name: "Jan")
    var image: ProfileImage? = ProfileImage(url: nil)
    
    person?.image = image
    image?.person = person
    
    person = nil
    image = nil
}

//: ### Reference captured by a closure
example(of: "Reference captured by a closure") {
    class Assignment {
        let title: String
        private(set) var completed: Bool
        var toggleCompletedClosure: (() -> Void)?
        
        init(title: String = "Title", completed: Bool = false) {
            self.title = title
            self.completed = completed
            
            toggleCompletedClosure = {
                self.completed.toggle()
            }
            
            print("Assignment \(title) initialized")
        }
        
        deinit {
            print("Assignment \(title) deinitialized")
        }
    }

    var assignment: Assignment? = Assignment()
    assignment = nil
}

//: ### Weak reference in a closure
example(of: "Weak reference in a closure") {
    class Assignment {
        let title: String
        private(set) var completed: Bool
        var toggleCompletedClosure: (() -> Void)?
        
        init(title: String = "Title", completed: Bool = false) {
            self.title = title
            self.completed = completed
            
            toggleCompletedClosure = { [weak self] in
                self?.completed.toggle()
            }
            print("Assignment \(title) initialized")
        }
        
        deinit {
            print("Assignment \(title) deinitialized")
        }
    }

    var assignment: Assignment? = Assignment()
    assignment = nil
}

//: ### Unowned reference
example(of: "Unowned reference") {
    class Assignment {
        let title: String
        private(set) var completed: Bool
        var toggleCompletedClosure: (() -> Void)?
        
        init(title: String = "Title", completed: Bool = false) {
            self.title = title
            self.completed = completed
            
            toggleCompletedClosure = { [unowned self] in
                self.completed.toggle()
            }
            print("Assignment \(title) initialized")
        }
        
        deinit {
            print("Assignment \(title) deinitialized")
        }
    }

    var assignment: Assignment? = Assignment()
    let closure = assignment?.toggleCompletedClosure
    assignment = nil
    // closure?()
}

//: [Next](@next)
