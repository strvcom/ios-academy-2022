//
//  CharactersRouter.swift
//  RickAndMorty
//
//  Created by Gleb on 13.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

enum CharactersRouter {
    case getCharacters(page: Int?)
}

extension CharactersRouter: Endpoint {
    
    var path: String {
        switch self {
        case .getCharacters:
            return "character"
        }
    }
    
    var urlParameters: [String: Any]? {
        switch self {
        case let .getCharacters(.some(page)):
            return ["page": page]
        case .getCharacters:
            return nil
        }
    }
}
