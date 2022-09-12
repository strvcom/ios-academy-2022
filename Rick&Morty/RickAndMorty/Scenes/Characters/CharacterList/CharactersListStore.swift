//
//  CharactersListStore.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 11.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

@MainActor final class CharactersListStore: ObservableObject {
    @Published var characters: [Character] = .init()
}

// MARK: - Actions
extension CharactersListStore {
    func load() async {
        do {
            // wait 2 seconds
            try await Task.sleep(nanoseconds: 2_000_000_000)
            characters = Character.characters
        } catch {
            print("😡😡😡 error: \(error)")
        }
    }
}
