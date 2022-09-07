//
//  CharactersCoordinator.swift
//  RickAndMorty
//
//  Created by Marek Slávik on 02.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import DependencyInjection
import UIKit
import SwiftUI

final class CharactersCoordinator {
    let container: Container

    var childCoordinators: [Coordinator] = []

    lazy var navigationController: UINavigationController = RMNavigationController()

    init(container: Container) {
        self.container = container
    }
}

// MARK: NavigationControllerCoordinator
extension CharactersCoordinator: NavigationControllerCoordinator {
    func start() {
        navigationController.setViewControllers([makeCharactersListView()], animated: false)
    }
}

// MARK: - Factories
extension CharactersCoordinator {
    func makeCharactersListView() -> UIViewController {
        UIHostingController(rootView: CharactersListView(coordinator: self))
    }
    
    func makeCharacterDetailView(character: Character) -> UIViewController {
        let store = container.resolve(type: CharacterDetailStore.self, argument: character)
        return UIHostingController(
            rootView: CharacterDetailView(store: store)
        )
    }
}

// MARK: - Characters List Event Handling
extension CharactersCoordinator: CharactersListEventHandling {
    func handle(event: CharactersListView.Event) {
        switch event {
        case let .didSelectCharacter(character):
            navigationController.pushViewController(
                makeCharacterDetailView(character: character),
                animated: true
            )
        }
    }
}
