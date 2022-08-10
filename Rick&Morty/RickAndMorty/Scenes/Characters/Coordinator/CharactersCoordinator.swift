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
        navigationController.setViewControllers([createCharactersListView()], animated: false)
    }
    
    func createCharactersListView() -> UIViewController {
        UIHostingController<CharactersListView>(rootView: CharactersListView())
    }
}
