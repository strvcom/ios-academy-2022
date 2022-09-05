//
//  LocationsListStore.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 05.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

@MainActor final class LocationsListStore: ObservableObject {
    @Published var locations: [Location] = .init()
}

// MARK: - Actions
extension LocationsListStore {
    func load() async {
        do {
            // wait 2 seconds
            try await Task.sleep(nanoseconds: 2_000_000_000)
            print("✅✅✅ done")
            locations = (0...99).map { _ in
                Location.mock
            }
        } catch {
            print("😡😡😡 error: \(error)")
        }
    }
}
