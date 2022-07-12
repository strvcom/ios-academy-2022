//: [Previous](@previous)
//: # Operators, common methods
import Foundation

//: ## Operators
//: ### Arithmetic operators
example(of: "Arithmetic operators") {
    print(1 + 1)
    print(1 - 1)
    print(1 * 1)
    print(1 / 3)
    print(1.0 / 3.0)
    print(7 % 3)
    
    let integer: Int = 1
    let double: Double = 3
    // Cannot add values of different types
    //print(integer + double)
    print(Double(integer) + double)
}

//: ### Plus vs. other data types
example(of: "Plus vs. other data types") {
    print("1" + "1")
    print([1] + [1])
}

//: ### Compound assignment
example(of: "Compound assignment") {
    var one = 1
    // Cannot be used in Swift
    // one++
    one += 1
    print(one)
}

//: ### Comparison operators
example(of: "Comparison") {
    print(1 == 1)
    print(2 != 1)
    print(2 > 1)
    print(1 < 2)
    print(1 >= 1)
    print(2 <= 1)
}

//: ### Ternary conditional operator
example(of: "Ternary conditional operator") {
    let (a, b) = (3, 4)
    
    let max: Int
    if a > b {
        max = a
    } else {
        max = b
    }
    print(max)
    
    let optimizedMax = a > b ? a : b
    print(optimizedMax)
}

//: ### Nil-Coalescing operator
example(of: "Nil-Coalescing operator") {
    let optionalString: String? = "sth"
    print(optionalString.debugDescription)
    
    let _ = optionalString == nil ? "default" : optionalString!
    let resultString = optionalString ?? "default"
    print(resultString.debugDescription)
}

//: ### Logical operators
example(of: "Logical operators") {
    print(!true)
    print(true && false)
    print(true || false)
}

//: ## Ranges
let intArray = Array(0...100)
//: ### Closed range
example(of: "Closed range") {
    // Range containing 0, 1, 2, 3
    for index in 0...3 {
        print(index)
    }
    
    for number in intArray[30...36] {
        print(number)
    }
}

//: ### Half-open range
example(of: "Half-open range") {
    // Range containing 0, 1, 2
    for index in 0..<3 {
        print(index)
    }
    
    for number in intArray[30..<36] {
        print(number)
    }
}

//: ### One-sided range
example(of: "One-sided range") {
    // Infinite loop
    //    for index in 0... {
    //        print(index)
    //    }
    
    for number in intArray[95...] {
        print(number)
    }
}

//: ## Collections and functional programming
//: ### Map
example(of: "Map function") {
    let intsToTen = Array(0...10)
    
    // Convert Int array into String array
    let stringArray = intsToTen.map({ number in
        return String(number)
    })
    
    print(stringArray)
}

//: ### Compact map
example(of: "Compact map") {
    let names = ["0", "1", "two"]
    // Resulting array is an array of optional Ints
    let optionalInts = names.map({ Int($0) })
    print(optionalInts.debugDescription)
    
    // Convert String array into an array on non-optional Ints
    let ints = names.compactMap({ Int($0) })
    print(ints.debugDescription)
}

//: ### Functional programming
example(of: "Functional programming") {
    let array = Array(0...100)
    
    // You can combine as many functions as you want
    let magic = array
        .map({ $0 * 2 })
        .filter({ ($0 % 2) == 0 })
        .split(maxSplits: 10, omittingEmptySubsequences: true, whereSeparator: { number in
            let squaredNumber = sqrt(Double(number))
            return squaredNumber == round(squaredNumber)
        })
        .shuffled()
        .flatMap({ $0 })
        .sorted(by: >)
    
    print(magic)
}

//: ### Functional vs. on-place methods
example(of: "Functional vs. on-place methods") {
    let array = Array(0...10).shuffled()
    
    // Create sorted array from the existing array
    let sortedArray = array.sorted()
    print(sortedArray)
    
    var arrayToBeSorted = array
    // Sort the existing array
    arrayToBeSorted.sort()
    print(arrayToBeSorted)
}

//: ### Accessing elements
example(of: "Accessing elements") {
    let array = Array(0...10).shuffled()
    
    if let number = array.first(where: { $0 * 3 > 4 }) {
        print(number)
    }
    if let number = array.firstIndex(where: { $0 * 3 > 4 }) {
        print(number)
    }
}

//: ### Dictionary is also collection
example(of: "Dictionary is also collection") {
    let numberForName = [
        "one": 1,
        "two": 2,
        "three": 3
    ]
    
    let evenNumbersForNames = numberForName.filter({ _, value in
        return (value % 2) == 0
    })
    print(evenNumbersForNames)
}
