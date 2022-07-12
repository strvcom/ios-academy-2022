//: [Previous](@previous)
//: # Extensions, protocols, delegates
import Foundation

//: ## Extensions
struct Person {
    let name: String
}

extension Person {
    // Property age
    // Computed property name components
    // Function name with degree
}

example(of: "Person extension") {
    // Instantiate
    // Use
}

//: ## Protocols
protocol Human {
    // Hair color variable
    // Eye color constant
}

protocol StoryTeller {
    // Tell story function
}
//: ### Conform to protocol
struct Woman {
    // Conform to human
}
// Conform to StoryTeller

struct Man {
    // Conform to human
}

example(of: "Conform to protocol") {
    // Instantiate man
    // Instantiate woman
    
    // Human property
    // Assign women to human
    // Assign man to human

    // StoryTeller property
    // Assign women to StoryTeller
    // Assign man to StoryTeller
}
//: ### Protocol extension
extension StoryTeller {
    // Little Red Riding hood
}

example(of: "Protocol extension") {
    // Instantiate
    // Tell story
}
//: ## Delegates
class ViewWithButton {
    // Delegate
    // Tap on button method
}

class Controller {
    // View property
}

protocol ViewWithButtonDelegate: class {
    // Did tap on button
}

// Conform Controller to protocol

example(of: "Delegate") {
    // Create controller
    // Create view
    // Point to each other
    // Tap on button
}
//: [Next](@next)
