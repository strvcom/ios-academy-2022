//
//  TabBarCoordinator.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 12.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import DependencyInjection
import UIKit

final class TabBarCoordinator {
    let container: Container
    var childCoordinators: [Coordinator] = []

    var tabBarController: UITabBarController = RMTabBarController()

    init(container: Container) {
        self.container = container
    }
}

// MARK: - Coordinator lifecycle
extension TabBarCoordinator: TabBarControllerCoordinator {
    func start() {
        let coordinators = [
            makeDummyScene()
        ]

        for coordinator in coordinators {
            childCoordinators.append(coordinator)

            coordinator.start()
        }

        tabBarController.setViewControllers(coordinators.map(\.rootViewController), animated: false)
    }
}

// MARK: - Factories
extension TabBarCoordinator {
    func makeDummyScene() -> ViewControllerCoordinator {
        let coordinator = DummyCoordinator(container: container)

        coordinator.rootViewController.tabBarItem.title = "Hello"
        coordinator.rootViewController.tabBarItem.image = .systemInfoCircle

        return coordinator
    }
}
