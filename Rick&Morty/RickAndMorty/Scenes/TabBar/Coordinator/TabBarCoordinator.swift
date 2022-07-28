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
        let viewControllers = [
            makeLocationsScene(),
            makeLocationDetailScene()
        ]
        tabBarController.setViewControllers(viewControllers.compactMap { $0 }, animated: false)
    }
}

// MARK: - Factories
extension TabBarCoordinator {
    func makeLocationsScene() -> UIViewController? {
        guard let viewController = R.storyboard.locationsListViewController().instantiateInitialViewController()
        else {
            return nil
        }

        viewController.tabBarItem.title = R.string.localizable.tabTitleLocations()
        viewController.tabBarItem.image = .systemGlobe
        return viewController
    }

    func makeLocationDetailScene() -> UIViewController? {
        guard let viewController = R.storyboard.locationDetailStoryboard().instantiateInitialViewController()
        else {
            return nil
        }

        viewController.tabBarItem.title = R.string.localizable.locationDetailInfo()
        viewController.tabBarItem.image = .systemGlobe
        return viewController
    }
}
