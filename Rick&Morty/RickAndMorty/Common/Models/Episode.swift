//
//  Episode.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import Foundation

struct Episode {
    let id: Int
    let name: String
    let code: String
    let airDate: Date
    let characterIds: [Int]

    var rottenTomatoesUrl: URL? {
        let codeParts = code.dropFirst().split(separator: "E")

        guard
            codeParts.count == 2,
            let serieNumber = codeParts.first,
            let episodeNumber = codeParts.last
        else {
            return nil
        }

        let urlString = "https://www.rottentomatoes.com/tv/rick_and_morty/s\(serieNumber)/e\(episodeNumber)"

        return URL(string: urlString)
    }

    init(
        id: Int,
        name: String,
        code: String,
        airDate: String,
        characterUrls: [URL]
    ) throws {
        self.id = id
        self.name = name
        self.code = code

        // TODO: throw APIError when implemented
        if let date = Self.airDateFormatter.date(from: airDate) {
            self.airDate = date
        } else {
            self.airDate = Date()
        }

        characterIds = characterUrls
            .compactMap {
                Int($0.lastPathComponent)
            }
    }
}

// MARK: - Date Formatter
extension Episode {
    static let airDateFormatter: DateFormatter = {
        let formatter = DateFormatter()

        formatter.dateFormat = "MMMM d, yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")

        return formatter
    }()
}

// MARK: - Conformances
extension Episode: Identifiable {}
extension Episode: Equatable {}

// MARK: - Mock
#if DEBUG
    extension Episode {
        // swiftlint:disable:next force_try
        static let mock: Episode = try! .init(
            id: 1,
            name: "Pilot",
            code: "S01E01",
            airDate: "December 2, 2013",
            characterUrls: [
                // swiftlint:disable:next force_unwrapping
                URL(string: "https://rickandmortyapi.com/api/character/1")!,
                // swiftlint:disable:next force_unwrapping
                URL(string: "https://rickandmortyapi.com/api/character/2")!
            ]
        )
    }
#endif
