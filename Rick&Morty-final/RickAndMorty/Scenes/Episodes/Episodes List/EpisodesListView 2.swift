//
//  EpisodesListView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import SwiftUI

struct EpisodesListView: View {
    enum Event {
        case didSelectEpisode(episode: Episode)
    }

    @StateObject var store: EpisodesListStore
    weak var coordinator: EpisodesListViewEventHandling?

    var body: some View {
        ZStack {
            BackgroundGradientView()

            switch store.state {
            case .finished:
                content
            case .initial, .loading:
                ProgressView()
            case .failed:
                Text(R.string.localizable.generalStateErrorSomethingWentWrong())
            }
        }
        .navigationTitle(R.string.localizable.tabTitleEpisodes())
        .onFirstAppear(perform: load)
        .foregroundColor(.appTextBody)
        .preferredColorScheme(.none)
    }

    @ViewBuilder var content: some View {
        ScrollView {
            Group {
                LazyVStack {
                    ForEach(store.episodes) { episode in
                        EpisodesListItemView(episode: episode)
                            .onTapGesture {
                                coordinator?.handle(event: .didSelectEpisode(episode: episode))
                            }
                            .task {
                                await loadMoreIfNeeded(for: episode)
                            }
                    }
                }

                if case let .finished(loadingMore) = store.state, loadingMore {
                    ProgressView()
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

// MARK: - Actions
private extension EpisodesListView {
    func load() {
        Task {
            await store.load()
        }
    }

    func loadMoreIfNeeded(for episode: Episode) async {
        await store.loadMoreIfNeeded(for: episode)
    }
}

// MARK: - Previews
struct EpisodesListView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesListView(store: EpisodesListStore(apiManager: APIManager.mock))
    }
}
