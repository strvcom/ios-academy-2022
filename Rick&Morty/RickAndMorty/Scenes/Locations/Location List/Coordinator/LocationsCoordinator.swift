//
//  LocationsCoordinator.swift
//  RickAndMorty
//
//  Created by Marek Slávik on 02.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import DependencyInjection
import UIKit

final class LocationsCoordinator {
    let container: Container

    var childCoordinators: [Coordinator] = []

    lazy var navigationController: UINavigationController = RMNavigationController()

    init(container: Container) {
        self.container = container
    }
}

// MARK: NavigationControllerCoordinator
extension LocationsCoordinator: NavigationControllerCoordinator {
    func start() {
        navigationController.setViewControllers([makeLocationsList()], animated: false)
    }
}

// MARK: Factories
extension LocationsCoordinator {
    func makeLocationsList() -> UIViewController {
        // swiftlint:disable:next force_unwrapping
        let viewController = R.storyboard.locationsListViewController.instantiateInitialViewController()!

        let store = container.resolve(type: LocationsListStore.self)
        viewController.store = store
        viewController.coordinator = self

        return viewController
    }

    func makeLocationDetail(for location: Location) -> UIViewController {
        // swiftlint:disable:next force_unwrapping
        let viewController = R.storyboard.locationDetailViewController.instantiateInitialViewController()!
        viewController.location = location
        return viewController
    }

}

// MARK: LocationsListViewEventHandling
extension LocationsCoordinator: LocationsListViewEventHandling {
    func handle(event: LocationsListViewController.Event) {
        switch event {
        case .didSelectLocation(let location):
            navigationController.pushViewController(makeLocationDetail(for: location), animated: true)
        }
    }
}
