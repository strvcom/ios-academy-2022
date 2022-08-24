//
//  EpisodesListViewEventHandling.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 23.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

protocol EpisodesListViewEventHandling: AnyObject {
    func handle(event: EpisodesListView.Event)
}
