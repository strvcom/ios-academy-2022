//
//  HTTPHeader.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

enum HTTPHeader {
    enum HeaderField: String {
        case contentType = "Content-Type"
    }

    enum ContentType: String {
        case json = "application/json"
        case text = "text/html;charset=utf-8"
    }
}
