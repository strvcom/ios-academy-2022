//
//  LocationDetailViewEventHandling.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 19.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

protocol LocationDetailViewEventHandling: AnyObject {
    func handle(event: LocationDetailViewController.Event)
}
