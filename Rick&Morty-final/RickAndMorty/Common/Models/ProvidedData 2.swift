//
//  ProvidedData.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 30.01.2022.
//

import Foundation

// This enum is used to provide either the full entity (e.g. a Character)
// or its ID (when the full entity is not available) to the Stores
enum ProvidedData<T: Identifiable> {
    case entity(T)
    case id(T.ID)

    var id: T.ID {
        switch self {
        case let .entity(entity):
            return entity.id
        case let .id(id):
            return id
        }
    }
}
