//
//  NavigationControllerCoordinator.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 01/12/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import UIKit

protocol NavigationControllerCoordinator: ViewControllerCoordinator {
    var navigationController: UINavigationController { get }
}

extension NavigationControllerCoordinator {
    var rootViewController: UIViewController {
        navigationController
    }
}
