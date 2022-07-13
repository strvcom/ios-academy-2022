import Foundation

// Open class that can be overriden from a different module
open class OpenAssignment {
    var id: String
    public let title: String
    let description: String
    
    // Public initializer that can be accessed from a different module
    public init(id: String = "123", title: String = "Name", description: String = "Description") {
        self.id = id
        self.title = title
        self.description = description
    }
    
    // Public computed property that can be accessed but not overriden from a different module
    public var uniqueDescription: String {
        return "\(id)-\(title)"
    }

    // Public method that can be overriden from a different module
    open func desc() -> String {
        return description
    }
}
