//
//  CharacterDetailStore.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 05.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

@MainActor final class CharacterDetailStore: ObservableObject {
    @Published var character: Character
    @Published var mockedEpisodes: [Episode] = .init()
    
    init(character: Character) {
        self.character = character
    }
}

// MARK: - Actions
extension CharacterDetailStore {
    func load() async {
        do {
            // wait 2 seconds
            try await Task.sleep(nanoseconds: 2_000_000_000)
            print("✅✅✅ done")
            mockedEpisodes = Episode.episodes
        } catch {
            print("😡😡😡 error: \(error)")
        }
    }
}
