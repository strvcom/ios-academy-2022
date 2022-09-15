//
//  LocationsCoordinator.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 13.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import DependencyInjection
import SwiftUI
import UIKit

final class LocationsCoordinator {
    let container: Container
    var childCoordinators: [Coordinator] = []

    lazy var navigationController: UINavigationController = RMNavigationController()

    init(container: Container) {
        self.container = container
    }
}

// MARK: - Coordinator lifecycle
extension LocationsCoordinator: NavigationControllerCoordinator {
    func start() {
        navigationController.setViewControllers([makeLocationsList()], animated: false)
    }
}

// MARK: - Factories
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
        let store = container.resolve(type: LocationDetailStore.self, argument: location)

        viewController.store = store
        viewController.coordinator = self

        return viewController
    }

    func makeCharacterDetail(for character: Character) -> UIViewController {
        let store = container.resolve(type: CharacterDetailStore.self, argument: character)
        let characterDetail = CharacterDetailView(store: store, coordinator: self)

        return UIHostingController(rootView: characterDetail)
    }

    func makeEpisodeDetail(for episode: Episode) -> UIViewController {
        let store = container.resolve(type: EpisodeDetailStore.self, argument: episode)
        let episodeDetail = EpisodeDetailView(store: store, coordinator: self)

        return UIHostingController(rootView: episodeDetail)
    }

    func makeLocationDetail(with id: Int) -> UIViewController {
        // swiftlint:disable:next force_unwrapping
        let viewController = R.storyboard.locationDetailViewController.instantiateInitialViewController()!
        let store = container.resolve(type: LocationDetailStore.self, argument: id)

        viewController.store = store
        viewController.coordinator = self

        return viewController
    }

    func makeWebView(for url: URL) -> UIViewController {
        let webView = WebView(url: url)

        return UIHostingController(rootView: webView)
    }
}

// MARK: - Locations list event handling
extension LocationsCoordinator: LocationsListViewEventHandling {
    func handle(event: LocationsListViewController.Event) {
        switch event {
        case let .didSelectLocation(location):
            navigationController.pushViewController(makeLocationDetail(for: location), animated: true)
        }
    }
}

// MARK: - Location detail event handling
extension LocationsCoordinator: LocationDetailViewEventHandling {
    func handle(event: LocationDetailViewController.Event) {
        switch event {
        case let .didSelectCharacter(character):
            navigationController.pushViewController(makeCharacterDetail(for: character), animated: true)
        }
    }
}

// MARK: - Characters detail event handling
extension LocationsCoordinator: CharacterDetailViewEventHandling {
    func handle(event: CharacterDetailView.Event) {
        switch event {
        case let .didSelectEpisode(episode):
            navigationController.pushViewController(makeEpisodeDetail(for: episode), animated: true)
        case let .didSelectLocation(id):
            navigationController.pushViewController(makeLocationDetail(with: id), animated: true)
        }
    }
}

// MARK: - Episode detail event handling
extension LocationsCoordinator: EpisodeDetailViewEventHandling {
    func handle(event: EpisodeDetailView.Event) {
        switch event {
        case let .didTapOnOpenWeb(url):
            navigationController.present(makeWebView(for: url), animated: true)
        case let .didSelectCharacter(character):
            navigationController.pushViewController(makeCharacterDetail(for: character), animated: true)
        }
    }
}
