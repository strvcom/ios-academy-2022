import Foundation

func merge(dictionaries: [[String: Int]]) -> [String: Int] {
    // Implement merging of multiple dictionaries
    // The method returns a resulting dictionary
    // If there is a conflict of keys add the two values
    // Example 1: Merge of ["one": 1, "two": 2] and ["three": 3] results in ["one": 1, "two": 2, "three": 3]
    // Example 2: Merge of ["one": 1, "two": 2] and ["one": 3] results in ["one": 4, "two": 2]
    return [:]
}

func intersect(dictionaries: [[String: Int]]) -> [String: Int] {
    // Implement intersection of multiple dictionaries
    // The method returns a resulting dictionary
    // Take the least value from the intersecting keys
    // Example 1: Intersection of ["one": 1, "two": 2] and ["three": 3] results in [:] (empty dictionary)
    // Example 2: Intersection of ["one": 1, "two": 2] and ["one": 3, "four": 4] results in ["one": 1]
    return [:]
}

extension Dictionary where Key == String, Value == Int {
    func filterPalindromeKeys() -> [String: Value] {
        // Palindrome is a string that reads the same backward as forward e.g. "radar"
        // Implement filtering of just those keys that are palindromes
        // The method returns a resulting dictionary
        // Example1: ["one": 1, "radar": 2] results in ["radar": 2]
        // Example2: ["wasitacaroracatisaw": 1, "two": 2] results in ["wasitacaroracatisaw": 1]
        return self
    }
}
