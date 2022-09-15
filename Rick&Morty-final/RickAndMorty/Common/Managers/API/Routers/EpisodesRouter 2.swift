//
//  EpisodesRouter.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

enum EpisodesRouter {
    case getEpisodes(page: Int?)
    case getEpisode(id: Episode.ID)
}

extension EpisodesRouter: Endpoint {
    var path: String {
        switch self {
        case .getEpisodes:
            return "episode"
        case let .getEpisode(id):
            return "episode/\(id)"
        }
    }

    var urlParameters: [String: Any]? {
        switch self {
        case let .getEpisodes(.some(page)):
            return ["page": page]
        case .getEpisodes, .getEpisode:
            return nil
        }
    }
}
