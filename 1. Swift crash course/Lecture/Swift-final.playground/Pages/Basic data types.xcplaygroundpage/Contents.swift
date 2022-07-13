//: # Basic data types
import Foundation

//: ### Strings
example(of: "Strings") {
    let name = "Veronika"
    
    print(name)
    print(type(of: name))
    
    let name2: String = "Veronika"
    
    print(name2)
    print(type(of: name2))
    
    let multilineString = """
    aa
    aa
    bb
    """
    
    print(multilineString)
}
//: ### Mutability
example(of: "Mutability") {
    // let is a constant
    let name = "Veronika"
    // name = "Honza"
    
    // var can be mutated
    var name2 = "Veronika"
    name2 = "Honza"
}
//: ### Numbers
example(of: "Numbers") {
    let age = 23
    print(type(of: age))
    
    let height = 1.72
    print(type(of: height))
    
    let floatHeight: Float = 1.72
    print(type(of: floatHeight))
}
//: ### Boolean
example(of: "Boolean") {
    var completed = true
    completed = false
    completed.toggle()
    
    print(completed)
}
//: ### Tuple
example(of: "Tuple") {
    let person = (name: (firstname: "Veronika", surname: "Zelinkova"), age: 23)
    
    print(person.name.firstname)
}
//: [Next](@next)
