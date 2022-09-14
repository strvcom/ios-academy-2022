//
//  CharactersListStore.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 11.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

@MainActor final class CharactersListStore: ObservableObject {
    enum State: Equatable {
        case initial
        case loading
        case finished(loadingMore: Bool)
        case failed
    }
    
    @Published var state: State = .initial
    @Published var characters: [Character] = .init()
    
    private var currentResponseInfo: PaginationInfo?
    
    private let apiManager: APIManaging
    
    init(apiManager: APIManaging) {
        self.apiManager = apiManager
    }
}

// MARK: - Actions
extension CharactersListStore {
    func load() async {
        state = .loading
        
        await fetch()
    }
    
    func loadMoreIfNeeded(for character: Character) async {
        guard character == characters.last else {
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
private extension CharactersListStore {
    func fetch(page: Int? = nil) async {
        let endpoint = CharactersRouter.getCharacters(page: page)

        do {
            let response: PaginatedResponse<Character> = try await apiManager.request(endpoint)

            currentResponseInfo = response.info
            characters += response.results
            
            state = .finished(loadingMore: false)
        } catch {
            Logger.log("\(error)", .error)
            
            state = .failed
        }
    }
}
