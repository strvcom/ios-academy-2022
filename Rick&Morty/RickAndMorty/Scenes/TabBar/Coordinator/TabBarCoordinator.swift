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
        /*let coordinators = [
            makeDummyScene()
        ]

        for coordinator in coordinators {
            childCoordinators.append(coordinator)

            coordinator.start()
        }

        tabBarController.setViewControllers(coordinators.map(\.rootViewController), animated: false)*/

        let viewControllers = [
            makeLocationsScene(),
            makeLocationDetailScene()
        ]
        tabBarController.setViewControllers(viewControllers.compactMap { $0 },
                                            animated: false)
    }
}

// MARK: - Factories
extension TabBarCoordinator {
    func makeLocationsScene() -> UIViewController? {
        guard let viewController = R.storyboard.locationsStoryboard().instantiateInitialViewController()
        else {
            return nil
        }

        viewController.tabBarItem.title = "Locations"
        viewController.tabBarItem.image = .systemGlobe
        return viewController
    }

    func makeLocationDetailScene() -> UIViewController? {
        guard let viewController = R.storyboard.locationDetailStoryboard().instantiateInitialViewController()
        else {
            return nil
        }

        viewController.tabBarItem.title = "Location detail"
        viewController.tabBarItem.image = .systemGlobe
        return viewController
    }
}
