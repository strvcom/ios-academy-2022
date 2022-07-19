//
//  AppCoordinating.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 24/01/2019.
//  Copyright © 2019 STRV. All rights reserved.
//

import UIKit

protocol AppCoordinating: Coordinator {
    func didLaunchScene<Coordinator: SceneCoordinating>(_ scene: UIScene, window: UIWindow) -> Coordinator

    func didDisconnectScene(_ scene: UIScene)
}
