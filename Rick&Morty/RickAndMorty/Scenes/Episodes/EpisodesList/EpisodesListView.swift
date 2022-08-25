//
//  EpisodesListView.swift
//  RickAndMorty
//
//  Created by Róbert Oravec on 16.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import SwiftUI

struct EpisodesListView: View {
    enum Event {
        case didSelectEpisode(episode: Episode)
    }
    
    weak var coordinator: EpisodesListViewEventHandling?
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            content
        }
        .navigationTitle(R.string.localizable.tabTitleEpisodes())
        .foregroundColor(.appTextBody)
        .preferredColorScheme(.none)
    }

    @ViewBuilder private var content: some View {
        ScrollView {
            LazyVStack {
                ForEach(Episode.episodes) { episode in
                    EpisodesListItemView(episode: episode)
                        .onTapGesture {
                            coordinator?.handle(event: .didSelectEpisode(episode: episode))
                        }
                }
            }
            .padding(.horizontal, 8)
        }
    }
}


// MARK: - Previews
struct EpisodesListView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesListView()
    }
}
