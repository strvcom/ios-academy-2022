//
//  APIManager.swift
//  RickAndMorty
//
//  Created by Gleb on 13.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

final class APIManager: APIManaging {
    private lazy var urlSession: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 30

        return URLSession(configuration: config)
    }()

    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter
    }()

    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()

        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(dateFormatter)

        return decoder
    }()

    private func request(_ endpoint: Endpoint) async throws -> Data {
        fatalError("Implement")
    }

    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        fatalError("Implement")
    }
}
