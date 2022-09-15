//
//  AppCoordinatorContaining.swift
//  RickAndMorty
//
//  Created by Jan on 01/05/2020.
//  Copyright © 2020 STRV. All rights reserved.
//

import Foundation

protocol AppCoordinatorContaining {
    // swiftlint:disable:next implicitly_unwrapped_optional
    var coordinator: AppCoordinating! { get }
}
