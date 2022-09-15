//
//  EpisodeDetailViewEventHandling.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 18.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import Foundation

protocol EpisodeDetailViewEventHandling: AnyObject {
    func handle(event: EpisodeDetailView.Event)
}
