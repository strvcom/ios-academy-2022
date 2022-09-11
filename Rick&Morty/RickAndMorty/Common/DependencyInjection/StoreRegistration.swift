//
//  ViewModelAssembly.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 01/12/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import DependencyInjection

@MainActor enum StoreRegistration {
    static func registerDependencies(to container: Container) {
        container.register(type: CharacterDetailStore.self) { _, character in
            CharacterDetailStore(
                character: character
            )
        }
        
        container.register(type: LocationsListStore.self, in: .new) { _ in
            LocationsListStore()
        }
        
        container.register(type: EpisodesListStore.self, in: .new) { _ in
            EpisodesListStore()
        }
    
        container.register(type: EpisodeDetailStore.self) { _, episode in
            EpisodeDetailStore(
                episode: episode
            )
        }
        
        container.register(type: CharactersListStore.self, in: .new) { _ in
            CharactersListStore()
        }
    }
}
