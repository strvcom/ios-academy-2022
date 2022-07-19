//
//  SceneCoordinating.swift
//  RickAndMorty
//
//  Created by Jan on 01/05/2020.
//  Copyright © 2020 STRV. All rights reserved.
//

import DependencyInjection
import UIKit

protocol SceneCoordinating: Coordinator {
    init(window: UIWindow, container: Container)
}
