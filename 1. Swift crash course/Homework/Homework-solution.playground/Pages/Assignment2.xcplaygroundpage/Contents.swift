import Foundation

// 'Node' represents the Tree data structure
// If you are not familiar with trees you can find a thorough explanation here: https://en.wikipedia.org/wiki/Tree_(data_structure)

class Node {
    let value: Int
    private(set) var children: [Node]
    
    init(value: Int, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    var maximum: Int {
        // Search all children recursively and return the maximum 'value'
        
        return children.reduce(value, { max($0, $1.maximum) })
    }
    
    func append(node: Node) {
        // Implement appending node to the children array

        children.append(node)
    }
    
    func removeNode(at index: Int) -> Node? {
        // Remove a child at given index
        // Do not crash when the index is out of range
        // Return a removed Node if any node was removed

        guard index >= 0 && index < children.count else {
            return nil
        }
        
        return children.remove(at: index)
    }
    
    func unsortedValues() -> [Int] {
        return children.map({ $0.unsortedValues() }).flatMap({ $0 }) + [value]
    }
    
    func sortedValues() -> [Int] {
        // Search all children recursively and return a sorted array of all values from the whole tree
        
        return unsortedValues().sorted()
    }
}

let tree = Node(
    value: 48,
    children: [
        Node(
            value: 2,
            children: [
                Node(value: 2, children: [])
            ]),
        Node(
            value: -5,
            children: [
                Node(value: 99, children: []),
                Node(value: 7, children: [])
            ]),
        Node(
            value: 103,
            children: [])
    ])

tree.children[0].append(node: Node(value: 2048, children: []))

tree.maximum == 2048 // MUST BE TRUE
tree.sortedValues() == [-5, 2, 2, 7, 48, 99, 103, 2048] // MUST BE TRUE

_ = tree.removeNode(at: 0)
tree.maximum == 103 // MUST BE TRUE
