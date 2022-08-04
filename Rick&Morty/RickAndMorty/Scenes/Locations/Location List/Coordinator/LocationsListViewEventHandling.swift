//
//  LocationsListViewEventHandling.swift
//  RickAndMorty
//
//  Created by Marek Slávik on 02.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

protocol LocationsListViewEventHandling: AnyObject {
    func handle(event: LocationsListViewController.Event)
}
