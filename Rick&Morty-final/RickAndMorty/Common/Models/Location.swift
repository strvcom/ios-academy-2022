//
//  Location.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import Foundation

struct Location: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residentUrls: [URL]

    var residentIds: [Int] {
        residentUrls
            .compactMap {
                Int($0.lastPathComponent)
            }
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case dimension
        case residentUrls = "residents"
    }
}

// MARK: - Conformances
extension Location: Identifiable {}
extension Location: Equatable {}

// MARK: - Mock
#if DEBUG
    extension Location {
        static let mock: Location = .init(
            id: 1,
            name: "Earth",
            type: "Planet",
            dimension: "Dimension C-137",
            residentUrls: [
                // swiftlint:disable:next force_unwrapping
                URL(string: "https://rickandmortyapi.com/api/character/1")!,
                // swiftlint:disable:next force_unwrapping
                URL(string: "https://rickandmortyapi.com/api/character/2")!
            ]
        )
    }
#endif
