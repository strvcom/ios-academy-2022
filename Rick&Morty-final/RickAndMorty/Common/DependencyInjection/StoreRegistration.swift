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
        container.register(type: EpisodesListStore.self, in: .new) { container in
            EpisodesListStore(apiManager: container.resolve(type: APIManaging.self))
        }

        container.register(type: EpisodeDetailStore.self) { container, episode in
            EpisodeDetailStore(
                providedData: .entity(episode),
                apiManager: container.resolve(type: APIManaging.self)
            )
        }

        container.register(type: CharactersListStore.self, in: .new) { container in
            CharactersListStore(apiManager: container.resolve(type: APIManaging.self))
        }

        container.register(type: CharacterDetailStore.self) { container, character in
            CharacterDetailStore(
                providedData: .entity(character),
                apiManager: container.resolve(type: APIManaging.self)
            )
        }

        container.register(type: LocationsListStore.self, in: .new) { container in
            LocationsListStore(apiManager: container.resolve(type: APIManaging.self))
        }

        container.register(type: LocationDetailStore.self) { container, locationId in
            LocationDetailStore(
                providedData: .id(locationId),
                apiManager: container.resolve(type: APIManaging.self)
            )
        }

        container.register(type: LocationDetailStore.self) { container, location in
            LocationDetailStore(
                providedData: .entity(location),
                apiManager: container.resolve(type: APIManaging.self)
            )
        }
    }
}
