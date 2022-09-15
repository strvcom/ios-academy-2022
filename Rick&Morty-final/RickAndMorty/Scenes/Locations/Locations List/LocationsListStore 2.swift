//
//  LocationsListStore.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import Foundation

@MainActor final class LocationsListStore: ObservableObject {
    enum State: Equatable {
        case initial
        case loading
        case finished(loadingMore: Bool)
        case failed
    }

    private let apiManager: APIManaging

    @Published var state: State = .initial
    @Published var locations: [Location] = .init()

    private var currentResponseInfo: PaginationInfo?

    init(apiManager: APIManaging) {
        self.apiManager = apiManager
    }
}

// MARK: - Actions
extension LocationsListStore {
    func load() async {
        state = .loading

        await fetch()
    }

    func loadMoreIfNeeded(for location: Location) async {
        guard location == locations.last else {
            return
        }

        guard let nextPageNumber = currentResponseInfo?.nextPageNumber else {
            return
        }

        state = .finished(loadingMore: true)

        await fetch(page: nextPageNumber)
    }
}

// MARK: - Fetching
extension LocationsListStore {
    private func fetch(page: Int? = nil) async {
        let endpoint = LocationsRouter.getLocations(page: page)

        do {
            let response: PaginatedResponse<Location> = try await apiManager.request(endpoint)

            currentResponseInfo = response.info
            locations += response.results

            state = .finished(loadingMore: false)
        } catch {
            Logger.log("\(error)", .error)

            state = .failed
        }
    }
}
