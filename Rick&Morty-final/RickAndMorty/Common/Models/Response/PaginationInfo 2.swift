//
//  PaginationInfo.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import Foundation

struct PaginationInfo: Decodable {
    let count: Int
    let numberOfPages: Int
    let nextPageNumber: Int?

    enum CodingKeys: String, CodingKey {
        case count
        case numberOfPages = "pages"
        case nextUrl = "next"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        count = try container.decode(Int.self, forKey: .count)
        numberOfPages = try container.decode(Int.self, forKey: .numberOfPages)

        if
            let nextPageUrl = try? container.decode(URL.self, forKey: .nextUrl),
            let nextPageNumberString = nextPageUrl.valueOf(queryParameter: "page"),
            let nextPageNumber = Int(nextPageNumberString)
        {
            self.nextPageNumber = nextPageNumber
        } else {
            nextPageNumber = nil
        }
    }
}
