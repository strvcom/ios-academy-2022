//
//  URL+Convenience.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 12.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

extension URL {
    func valueOf(queryParameter: String) -> String? {
        guard let url = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return nil
        }

        return url.queryItems?
            .first { $0.name == queryParameter }?
            .value
    }
}
