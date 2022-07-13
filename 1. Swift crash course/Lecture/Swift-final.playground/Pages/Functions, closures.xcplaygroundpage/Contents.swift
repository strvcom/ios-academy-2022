//: [Previous](@previous)
//: # Functions, closures
import Foundation

//: ## Functions
//: ### Void
example(of: "Void functions") {
    func helloWorld() {
        print("Hello world")
    }
    func helloWorld1() -> Void {
        print("Hello world 1")
    }
    func helloWorld2() -> () {
        print("Hello world 2")
        return
    }
    
    helloWorld()
    helloWorld1()
    helloWorld2()
}

//: ### Return value
example(of: "Function with return value") {
    func getHelloWorld() -> String {
        return "Hello world"
    }
    
    print(getHelloWorld())
}

//: ### Parameters
example(of: "Function with parameters") {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func anonymousAdd(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func fancyAdd(augend a: Int, addend b: Int) -> Int {
        return a + b
    }
    
    print(add(a: 1, b: 2))
    print(anonymousAdd(1, 2))
    print(fancyAdd(augend: 1, addend: 2))
}

//: ### Default value
example(of: "Function parameter with default value") {
    func add(number a: Int, to b: Int = 48) -> Int {
        return a + b
    }
    
    print(add(number: 2, to: 40))
    print(add(number: 2))
}

//: ## Closures
//: ### Function type
example(of: "Function type") {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    let addFunction = add
    
    print(type(of: addFunction))
}

//: ### Closure declaration
example(of: "Closure declaration") {
    let add: (Int, Int) -> Int = { a, b in
        return a + b
    }
    
    print(add(1, 2))
}

//: ### Closure as a function parameter
example(of: "Closure as a function parameter") {
    func combine(a: Int, b: Int, with block: (Int, Int) -> Int) -> Int {
        return block(a, b)
    }
    
    let addition = combine(a: 1, b: 2, with: { a, b in
        return a + b
    })
    print(addition)
    
    let subtract: (Int, Int) -> Int = { a, b in
        return a - b
    }
    
    let subtraction = combine(a: 1, b: 2, with: subtract)
    print(subtraction)
}

//: [Next](@next)
