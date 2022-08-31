//: [Previous](@previous)

//: # Swift concurrency

import Foundation
import UIKit

// https://betterprogramming.pub/the-complete-guide-to-concurrency-and-multithreading-in-ios-59c5606795ca


// carefull with main thread

// sometimes Apple’s frameworks will help you a little here. For example, even though using the @State property wrapper in a view will cause the body to be refreshed when the property is changed, this property wrapper is designed to be safe to call on any thread

// sync by default
func randomBool() -> Bool {
    sleep(3)
    return Bool.random()
}

// ### async
func fetchData(charactedId: Int) async throws -> String? {
    
    let url = URL(string: "https://rickandmortyapi.com/api/character/\(charactedId)")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let stringContent = String(data: data, encoding: .utf8)
    print(stringContent)
    return stringContent
}

// unstructured concurrency
Task {
    try? await fetchData(charactedId: 1)
}

// parse json from server to own model via Decodable
struct RickMortyCharacter: Decodable {
    let name: String
}

func fetchCharacter(id: Int) async -> RickMortyCharacter? {
    do {
        let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        print("finish loading character \(id)")
        let character = try JSONDecoder().decode(RickMortyCharacter.self, from: data)
        return character
    } catch {
        print("Failed to fetch data")
        return nil
    }
}

// no more completion handlers 🎉
// queue
func fetchCharacters() {
    Task {
        let firstCharacter = await fetchCharacter(id: 1)
        let secondCharacter = await fetchCharacter(id: 2)
        let thirdCharacter = await fetchCharacter(id: 3)

        let characters = [firstCharacter, secondCharacter, thirdCharacter]
    }
}

fetchCharacters()

// doesn't work in playground
// async let
func fetchCharactersParallel() {
    Task {
//        async let firstCharacter = fetchCharacter(id: 1)
//        async let secondCharacter = fetchCharacter(id: 2)
//        async let thirdCharacter = fetchCharacter(id: 3)
//
//        let characters = await [firstCharacter, secondCharacter, thirdCharacter]
    }
}

fetchCharactersParallel()

//: [Next](@next)
