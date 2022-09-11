//
//  EpisodesListStore.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 11.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

@MainActor final class EpisodesListStore: ObservableObject {
    @Published var episodes: [Episode] = .init()
}

// MARK: Action

extension EpisodesListStore {
    func load() async {
        do {
            // wait 2 seconds
            try await Task.sleep(nanoseconds: 2_000_000_000)
            episodes = Episode.episodes
        } catch {
            print("😡😡😡 error: \(error)")
        }
    }
}
