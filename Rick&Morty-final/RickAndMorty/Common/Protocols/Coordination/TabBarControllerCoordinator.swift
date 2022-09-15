//
//  TabBarControllerCoordinator.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 01/12/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import UIKit

protocol TabBarControllerCoordinator: ViewControllerCoordinator {
    var tabBarController: UITabBarController { get }
}

extension TabBarControllerCoordinator {
    var rootViewController: UIViewController {
        tabBarController
    }
}
