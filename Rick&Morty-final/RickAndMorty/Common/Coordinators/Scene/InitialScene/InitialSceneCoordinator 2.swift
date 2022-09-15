//
//  InitialSceneCoordinator.swift
//  RickAndMorty
//
//  Created by Jan on 01/05/2020.
//  Copyright © 2020 STRV. All rights reserved.
//

import DependencyInjection
import UIKit

final class InitialSceneCoordinator {
    var childCoordinators = [Coordinator]()

    let container: Container

    private let window: UIWindow

    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
    }
}

// MARK: - SceneCoordinating
extension InitialSceneCoordinator: InitialSceneCoordinating {
    func start() {
        let coordinator = makeTabBarScene()
        childCoordinators.append(coordinator)
        coordinator.start()

        window.rootViewController = coordinator.rootViewController
        window.makeKeyAndVisible()
    }
}

// MARK: - Factories
private extension InitialSceneCoordinator {
    func makeTabBarScene() -> TabBarCoordinator {
        TabBarCoordinator(container: container)
    }
}
