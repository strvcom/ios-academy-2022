//
//  CharacterOrigin.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 30.01.2022.
//

import Foundation

struct CharacterOrigin: Decodable {
    let name: String
    let locationId: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }

    init(name: String, url: URL?) {
        self.name = name

        if let url = url {
            locationId = Int(url.lastPathComponent)
        } else {
            locationId = nil
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        
        if let url = try? container.decode(URL?.self, forKey: .url) {
            locationId = Int(url.lastPathComponent)
        } else {
            locationId = nil
        }
    }
    
}

// MARK: - Conformances
extension CharacterOrigin: Equatable {}

// MARK: - Mock
#if DEBUG
    extension CharacterOrigin {
        static let mock: CharacterOrigin = .init(
            name: "Earth",
            // swiftlint:disable:next force_unwrapping
            url: URL(string: "https://rickandmortyapi.com/api/location/1")!
        )
    }
#endif
