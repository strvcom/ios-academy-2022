//
//  EpisodeDetailStore.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 11.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

@MainActor final class EpisodeDetailStore: ObservableObject {
    @Published var episode: Episode
    @Published var mockedCharacters: [Character] = .init()

    init(episode: Episode) {
        self.episode = episode
    }
}

// MARK: - Actions
extension EpisodeDetailStore {
    func load() async {
        do {
            // wait 2 seconds
            try await Task.sleep(nanoseconds: 2_000_000_000)
            mockedCharacters = Character.characters
        } catch {
            print("😡😡😡 error: \(error)")
        }
    }
}
