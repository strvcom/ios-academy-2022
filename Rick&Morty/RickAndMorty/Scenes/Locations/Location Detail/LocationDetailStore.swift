//
//  LocationDetailStore.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 11.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

final class LocationDetailStore {
    @Published var location: Location
    @Published var residents: [Character] = .init()

    init(location: Location) {
        self.location = location
    }
}

extension LocationDetailStore {
    func load() {
        // wait 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.residents = Character.characters
        }
    }
}
