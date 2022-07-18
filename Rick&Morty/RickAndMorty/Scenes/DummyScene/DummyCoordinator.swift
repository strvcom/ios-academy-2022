//
//  DummyCoordinator.swift
//  RickAndMorty
//
//  Created by Tomas Cejka on 18.07.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import DependencyInjection
import SwiftUI
import UIKit

final class DummyCoordinator {
    let container: Container
    var childCoordinators: [Coordinator] = []

    lazy var navigationController: UINavigationController = RMNavigationController()

    init(container: Container) {
        self.container = container
    }
}

// MARK: - Coordinator lifecycle
extension DummyCoordinator: NavigationControllerCoordinator {
    func start() {
        navigationController.setViewControllers([makeDummyViewController()], animated: false)
    }
}

// MARK: - Factories
extension DummyCoordinator {
    func makeDummyViewController() -> UIViewController {
       UIHostingController(rootView: DummyView())
    }
}
