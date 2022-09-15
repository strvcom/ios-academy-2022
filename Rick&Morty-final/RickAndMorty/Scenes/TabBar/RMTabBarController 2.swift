//
//  RMTabBarController.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 19.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

class RMTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - Setup
private extension RMTabBarController {
    func setup() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .appBackgroundTabBar
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .font: UIFont.appTabBar,
            .foregroundColor: UIColor.appTintTabBarUnselected
        ]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .font: UIFont.appTabBar,
            .foregroundColor: UIColor.appTintTabBarSelected
        ]
        appearance.stackedLayoutAppearance.normal.iconColor = .appTintTabBarUnselected
        appearance.stackedLayoutAppearance.selected.iconColor = .appTintTabBarSelected

        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}
