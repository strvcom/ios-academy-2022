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
            makeCharactersScene(),
            makeEpisodesScene(),
            makeLocationsScene()
        ]

        coordinators.forEach { coordinator in
            childCoordinators.append(coordinator)

            coordinator.start()
        }

        let viewControllers = coordinators.map(\.rootViewController)
        tabBarController.setViewControllers(viewControllers, animated: false)
    }
}

// MARK: - Factories
extension TabBarCoordinator {
    func makeCharactersScene() -> ViewControllerCoordinator {
        let coordinator = CharactersCoordinator(container: container)

        coordinator.rootViewController.tabBarItem.title = R.string.localizable.tabTitleCharacters()
        coordinator.rootViewController.tabBarItem.image = .systemPerson

        return coordinator
    }

    func makeEpisodesScene() -> ViewControllerCoordinator {
        let coordinator = EpisodesCoordinator(container: container)

        coordinator.rootViewController.tabBarItem.title = R.string.localizable.tabTitleEpisodes()
        coordinator.rootViewController.tabBarItem.image = .systemFilm

        return coordinator
    }

    func makeLocationsScene() -> ViewControllerCoordinator {
        let coordinator = LocationsCoordinator(container: container)

        coordinator.rootViewController.tabBarItem.title = R.string.localizable.tabTitleLocations()
        coordinator.rootViewController.tabBarItem.image = .systemGlobe

        return coordinator
    }
}
