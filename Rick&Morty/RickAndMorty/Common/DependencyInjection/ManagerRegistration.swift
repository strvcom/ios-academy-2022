//
//  ManagerAssembly.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 01/12/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import DependencyInjection

enum ManagerRegistration {
    static func registerDependencies(to container: Container) {
        
        container.register(
            type: APIManaging.self,
            in: .shared,
            factory: { _ in
            APIManager()
        })
    }
}
