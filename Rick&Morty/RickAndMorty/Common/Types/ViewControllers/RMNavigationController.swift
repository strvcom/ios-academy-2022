//
//  RMNavigationController.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 19.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

class RMNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        for viewController in viewControllers {
            setBackButton(for: viewController)
        }

        super.setViewControllers(viewControllers, animated: animated)
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        setBackButton(for: viewController)

        super.pushViewController(viewController, animated: animated)
    }
}

// MARK: - Setup
private extension RMNavigationController {
    func setBackButton(for viewController: UIViewController) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
    }

    func setup() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.titleTextAttributes = [
            .font: UIFont.appNavigationBarCompact,
            .foregroundColor: UIColor.appTextNavigationBar
        ]
        appearance.largeTitleTextAttributes = [
            .font: UIFont.appNavigationBarLarge,
            .foregroundColor: UIColor.appTextNavigationBar
        ]

        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactAppearance = appearance

        let standardAppearance = appearance.copy()
        standardAppearance.configureWithDefaultBackground()
        standardAppearance.backgroundColor = .appBackgroundTabBar

        navigationBar.standardAppearance = standardAppearance

        navigationBar.prefersLargeTitles = true
        navigationBar.tintColor = .appTintNavigationBar
    }
}
