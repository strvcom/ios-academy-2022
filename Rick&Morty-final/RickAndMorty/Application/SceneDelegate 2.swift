//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Jan on 01/05/2020.
//  Copyright © 2020 STRV. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    // swiftlint:disable:next implicitly_unwrapped_optional
    weak var coordinator: InitialSceneCoordinator!

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        setupInitialScene(with: windowScene)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        appCoordinator.didDisconnectScene(scene)
    }
}

// MARK: - Setup
private extension SceneDelegate {
    func setupInitialScene(with windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        self.window = window

        coordinator = appCoordinator.didLaunchScene(windowScene, window: window)

        coordinator.start()
    }
}
