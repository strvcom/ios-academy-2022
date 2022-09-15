//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 30/11/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import DependencyInjection

protocol Coordinator: AnyObject {
    var container: Container { get }
    var childCoordinators: [Coordinator] { get set }

    func start()
}
