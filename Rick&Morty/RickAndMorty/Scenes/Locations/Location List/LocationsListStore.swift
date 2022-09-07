//
//  LocationsListStore.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 05.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

final class LocationsListStore {
    @Published var locations: [Location] = .init()
}

// MARK: - Actions
extension LocationsListStore {
    func load() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.locations = {
                // Initialize with 100 Location mocks.
                (0...99).map { _ in
                    Location.mock
                }
            }()
        }
    }
}
