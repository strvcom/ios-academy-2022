//
//  HTTPHeader.swift
//  RickAndMorty
//
//  Created by Gleb on 13.09.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

enum HTTPHeader {
    enum HeaderField: String {
        case contentType = "Content-Type"
    }

    enum ContentType: String {
        case json = "application/json"
        case text = "text/html;charset=utf-8"
    }
}
