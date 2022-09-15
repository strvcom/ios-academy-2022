//
//  ViewControllerCoordinator.swift
//  RickAndMorty
//
//  Created by Jan on 07/08/2020.
//  Copyright © 2020 STRV. All rights reserved.
//

import UIKit

/// A coordinator protocol which contains `rootViewController`.
/// UIViewController-based coordinators confirm to this.
/// Coordinators which handles transition inside custom content view controllers (view controllers with childVCs) should conform to this.
/// For `UINavigationController` or `UITabBarController` based coordinators, use `NavigationControllerCoordinator` or `TabBarControllerCoordinator` respectively
protocol ViewControllerCoordinator: Coordinator {
    var rootViewController: UIViewController { get }
}
