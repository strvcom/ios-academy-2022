//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29/11/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppCoordinatorContaining {
    var window: UIWindow?

    // swiftlint:disable:next implicitly_unwrapped_optional
    var coordinator: AppCoordinating!

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator = AppCoordinator()
        coordinator.start()
        
        print("Character \(CharactersMock.characters[0])")

        return true
    }
}

// MARK: UISceneSession Lifecycle
extension AppDelegate {
    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UISceneConfiguration(name: "DefaultScene", sessionRole: connectingSceneSession.role)
    }
}
