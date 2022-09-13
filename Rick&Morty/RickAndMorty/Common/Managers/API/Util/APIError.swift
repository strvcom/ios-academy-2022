//
//  APIError.swift
//  RickAndMorty
//
//  Created by Gleb on 13.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidUrlComponents
    case noResponse
    case unacceptableResponseStatusCode
    case customDecodingFailed
    case malformedUrl
}
