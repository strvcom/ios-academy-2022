//
//  CharactersListViewEventHandling.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 18.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

protocol CharactersListViewEventHandling: AnyObject {
    func handle(event: CharactersListView.Event)
}
