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
        
        await fetch()
    }
}

// MARK: - Fetching
private extension CharactersListStore {
    func fetch(page: Int? = nil) async {
        let endpoint = CharactersRouter.getCharacters(page: page)

        do {
            let response: PaginatedResponse<Character> = try await apiManager.request(endpoint)

            characters += response.results

            
        } catch {
            Logger.log("\(error)", .error)


        }
    }
}
