//
//  CharactersListEventHandling.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 16.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

protocol CharactersListEventHandling: AnyObject {
    func handle(event: CharactersListView.Event)
}
