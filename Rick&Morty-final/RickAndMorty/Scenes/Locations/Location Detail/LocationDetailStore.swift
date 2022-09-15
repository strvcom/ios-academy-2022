//
//  LocationDetailStore.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 30.01.2022.
//

import Foundation

@MainActor final class LocationDetailStore: ObservableObject {
    enum State: Equatable {
        case initial
        case loading
        case finished
        case failed
    }

    private let apiManager: APIManaging

    @Published var state: State = .initial
    @Published var location: Location?
    @Published var residents: [Character] = .init()

    let providedData: ProvidedData<Location>

    init(providedData: ProvidedData<Location>, apiManager: APIManaging) {
        self.apiManager = apiManager
        self.providedData = providedData

        if case let .entity(location) = providedData {
            self.location = location

            state = .finished
        }
    }
}

// MARK: - Actions
extension LocationDetailStore {
    func load() async {
        if case let .id(id) = providedData {
            await fetchLocation(with: id)
        }

        await fetchCharacters()
    }
}

// MARK: - Fetching
extension LocationDetailStore {
    private func fetchLocation(with id: Location.ID) async {
        let endpoint = LocationsRouter.getLocation(id: id)

        do {
            location = try await apiManager.request(endpoint)

            state = .finished
        } catch {
            Logger.log("\(error)", .error)

            state = .failed
        }
    }

    private func fetchCharacters() async {
        guard let location = location else {
            return
        }

        do {
            try await withThrowingTaskGroup(of: Character.self) { [weak self] group in
                guard let self = self else {
                    return
                }

                for residentId in location.residentIds {
                    group.addTask {
                        let endpoint = CharactersRouter.getCharacter(id: residentId)

                        return try await self.apiManager.request(endpoint)
                    }
                }

                var residents: [Character] = .init()

                for try await resident in group {
                    residents.append(resident)
                }

                self.residents = residents
            }
        } catch {
            Logger.log("\(error)", .error)
            // List of characters is not *that* important, so we'll ignore any errors
        }
    }
}
