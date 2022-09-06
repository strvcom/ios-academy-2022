//
//  EpisodesCoordinator.swift
//  RickAndMorty
//
//  Created by Marek Slávik on 02.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import DependencyInjection
import UIKit
import SwiftUI

final class EpisodesCoordinator {
    let container: Container

    var childCoordinators: [Coordinator] = []

    lazy var navigationController: UINavigationController = RMNavigationController()

    init(container: Container) {
        self.container = container
    }
}

// MARK: NavigationControllerCoordinator
extension EpisodesCoordinator: NavigationControllerCoordinator {
    func start() {
        navigationController.setViewControllers([createEpisodesListView()], animated: false)
    }
    
    func createEpisodesListView() -> UIViewController {
        UIHostingController(rootView: EpisodesListView(coordinator: self))
    }

    func createEpisodeDetail(for episode: Episode) -> UIViewController {
        let episodeDetail = EpisodeDetailView(episode: episode, coordinator: self)

        return UIHostingController(rootView: episodeDetail)
    }

    func createWebView(url: URL) -> UIViewController {
        let webView = WebView(url: url)
        
        return UIHostingController(rootView: webView)
    }
}

// MARK: Episodes List View Event Handling
extension EpisodesCoordinator: EpisodesListViewEventHandling {
    func handle(event: EpisodesListView.Event) {
        switch event {
        case .didSelectEpisode(let episode):
            navigationController.pushViewController(createEpisodeDetail(for: episode), animated: true)
        }
    }
}

// MARK: Episodes Detail View Event Handling
extension EpisodesCoordinator: EpisodeDetailViewEventHandling {
    func handle(event: EpisodeDetailView.Event) {
        switch event {
        case .didTapOnOpenWeb(let url):
            navigationController.present(createWebView(url: url), animated: true)
        }
    }
}
