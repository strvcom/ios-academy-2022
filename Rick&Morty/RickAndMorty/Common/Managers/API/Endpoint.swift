//
//  Endpoint.swift
//  RickAndMorty
//
//  Created by Gleb on 13.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var urlParameters: [String: Any]? { get }
    var headers: [String: String]? { get }

    func asRequest() throws -> URLRequest
}

// MARK: - Default implementation
extension Endpoint {
    var method: HTTPMethod {
        .get
    }

    var headers: [String: String]? {
        nil
    }

    func asRequest() throws -> URLRequest {
        let urlPath = Configuration.default.apiBaseUrl.appendingPathComponent(path)

        
        
        
        guard var urlComponents = URLComponents(url: urlPath, resolvingAgainstBaseURL: true) else {
            throw APIError.invalidUrlComponents
        }

        if let urlParameters = urlParameters {
            urlComponents.queryItems = urlParameters.map { URLQueryItem(name: $0, value: String(describing: $1)) }
        }

        guard let url = urlComponents.url else {
            throw APIError.invalidUrlComponents
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers

        request.setValue(
            HTTPHeader.ContentType.json.rawValue,
            forHTTPHeaderField: HTTPHeader.HeaderField.contentType.rawValue
        )

        return request
    }
}
