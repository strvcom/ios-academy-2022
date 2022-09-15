//
//  LocationsRouter.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import Foundation

enum LocationsRouter {
    case getLocations(page: Int?)
    case getLocation(id: Location.ID)
}

extension LocationsRouter: Endpoint {
    var path: String {
        switch self {
        case .getLocations:
            return "location"
        case let .getLocation(id):
            return "location/\(id)"
        }
    }

    var urlParameters: [String: Any]? {
        switch self {
        case let .getLocations(.some(page)):
            return ["page": page]
        case .getLocations, .getLocation:
            return nil
        }
    }
}
