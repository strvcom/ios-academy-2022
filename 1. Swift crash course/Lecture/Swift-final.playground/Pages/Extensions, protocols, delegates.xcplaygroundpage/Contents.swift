//: [Previous](@previous)
//: # Extensions, protocols, delegates
import Foundation

//: ## Extensions
struct Person {
    let name: String
}

extension Person {
    // No stored properties in extensions
    // var age: Int

    var nameComponents: [String] {
        return name.components(separatedBy: " ")
    }
    
    func addDegree(_ degree: String) -> String {
        return "\(degree) \(name)"
    }
}

example(of: "Person extension") {
    let person = Person(name: "Jan Schwarz")
    
    print(person.addDegree("Bc."))
    print(person.nameComponents)
}

//: ## Protocols
protocol Human {
    var eyeColor: String { get }
    var hairColor: String { get set }
}

protocol StoryTeller {
    func tellStory() -> String
}
//: ### Conform to protocol
struct Woman: Human {
    let eyeColor: String
    var hairColor: String
}
extension Woman: StoryTeller {
    func tellStory() -> String {
        return "Once upon a time..."
    }
}
// Conform to StoryTeller

struct Man: Human {
    let eyeColor: String
    var hairColor: String
    
    func tellStory() -> String {
        return "Once upon a time..."
    }
}

example(of: "Conform to protocol") {
    let woman = Woman(eyeColor: "Brown", hairColor: "Brown")
    let man = Man(eyeColor: "Black", hairColor: "Black")
    
    var human: Human?
    
    human = woman
    print(type(of: human))
    print(human?.eyeColor ?? "Nothing there")
    print(human?.hairColor ?? "Nothing there")
    human?.hairColor = "Blond"
    print(human?.hairColor ?? "Nothing there")
    human = nil
    print(human?.hairColor ?? "Nothing there")
    
    human = man
    print(human?.eyeColor ?? "Nothing there")
    print(human?.hairColor ?? "Nothing there")

    var teller: StoryTeller?
    teller = woman
    print(teller?.tellStory() ?? "No story")
    
    // teller = man
}
//: ### Protocol extension
extension StoryTeller {
    func littleRedRidingHoodStory() -> String {
        return "Once upon a time there was a little red riding hood..."
    }
}

example(of: "Protocol extension") {
    let woman = Woman(eyeColor: "brown", hairColor: "brown")
    
    print(woman.littleRedRidingHoodStory())
}
//: ## Delegates
class ViewWithButton {
    weak var delegate: ViewWithButtonDelegate?
    
    func buttonWasTapped() {
        delegate?.buttonWasTapped(in: self)
    }
}

class Controller {
    var view: ViewWithButton?
}

protocol ViewWithButtonDelegate: class {
    func buttonWasTapped(in view: ViewWithButton)
}

extension Controller: ViewWithButtonDelegate {
    func buttonWasTapped(in view: ViewWithButton) {
        print("Button was tapped in \(view)")
    }
}

example(of: "Delegate") {
    let controller = Controller()
    let view = ViewWithButton()
    
    controller.view = view
    view.delegate = controller
    
    view.buttonWasTapped()
}
//: [Next](@next)
