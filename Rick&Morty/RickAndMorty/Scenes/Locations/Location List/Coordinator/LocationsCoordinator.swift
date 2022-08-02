//
//  LocationsCoordinator.swift
//  RickAndMorty
//
//  Created by Marek Slávik on 02.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import DependencyInjection
import UIKit

protocol LocationDetailCoordinatoring: AnyObject {
    var navigationController: UINavigationController { get }

    func showLocationDetail(location: Location)
}

extension LocationDetailCoordinatoring {
    func showLocationDetail(location: Location) {
        let viewController: LocationDetailViewController = R.storyboard.locationDetailViewController().instantiateInitialViewController()!
        viewController.location = location

        navigationController.pushViewController(viewController, animated: true)
    }
}



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
        navigationController.setViewControllers([makeLocationsScene()], animated: false)
    }
}

// MARK: Factories
extension LocationsCoordinator {
    func makeLocationsScene() -> UIViewController {
        let viewController: LocationsListViewController = R.storyboard.locationsListViewController().instantiateInitialViewController()!
        viewController.coordinator = self
        return viewController
    }
}

extension LocationsCoordinator: LocationDetailCoordinatoring { }

// MARK: LocationsListViewEventHandling
extension LocationsCoordinator: LocationsListViewEventHandling {
    func handle(event: LocationsListViewController.Event) {
        switch event {
        case .didSelectLocation(let location):
            showLocationDetail(location: location)
//            let locationDetailViewController = makeLocationDetailScene(location: location)
//            navigationController.pushViewController(locationDetailViewController, animated: true)
        }
    }
}
