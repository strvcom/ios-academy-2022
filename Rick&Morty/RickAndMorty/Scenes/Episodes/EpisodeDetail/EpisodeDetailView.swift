//
//  EpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 30.01.2022.
//

import SwiftUI

struct EpisodeDetailView: View {
    enum Event {
        case didTapOnOpenWeb(url: URL)
    }

    let episode: Episode
    let mockedCharacters = Character.characters
    weak var coordinator: EpisodeDetailViewEventHandling?

    var body: some View {
        ZStack(alignment: .topLeading) {
            BackgroundGradientView()

            makeContent(for: episode)
        }
        .navigationTitle(episode.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if episode.rottenTomatoesUrl != nil {
                    Button(action: showRottenTomatoes) {
                        Image.systemSafari
                    }
                }
            }
        }
        .foregroundColor(.appTextBody)
        .preferredColorScheme(.none)
    }

    @ViewBuilder var characters: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(R.string.localizable.episodeDetailAppearingCharacters())
                .font(.appSectionTitle)
                .foregroundColor(.appTextSectionTitle)
                .padding(.leading, 8)

            VStack(spacing: 8) {
                ForEach(mockedCharacters) { character in
                    EpisodeDetailCharacterView(character: character)
                }
            }
        }
    }

    @ViewBuilder func makeContent(for episode: Episode) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                makeInfo(for: episode)

                characters
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 8)
        }
    }

    @ViewBuilder func makeInfo(for episode: Episode) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(R.string.localizable.episodeDetailInfo())
                .font(.appSectionTitle)
                .foregroundColor(.appTextSectionTitle)

            VStack(alignment: .horizontalInfoAlignment, spacing: 8) {
                HStack(alignment: .top, spacing: 8) {
                    Image.systemInfoCircle

                    Text(episode.name)
                        .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                }

                HStack(alignment: .top, spacing: 8) {
                    Image.systemFilm

                    Text(episode.code)
                        .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                }

                HStack(alignment: .top, spacing: 8) {
                    Image.systemPlayTv

                    Text(
                        episode.airDate.formatted(
                            .dateTime
                                .month(.wide)
                                .day(.defaultDigits)
                                .year()
                        )
                    )
                    .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                }
            }
            .font(.appItemDescription)
        }
        .padding(.horizontal, 8)
    }

    @ViewBuilder var webViewError: some View {
        ZStack {
            BackgroundGradientView()

            Text(R.string.localizable.generalStateErrorSomethingWentWrong())
        }
    }
}

// MARK: - Actions
private extension EpisodeDetailView {
    func showRottenTomatoes() {
        guard let url = episode.rottenTomatoesUrl else {
            return
        }

        coordinator?.handle(event: .didTapOnOpenWeb(url: url))
    }
}

// MARK: - Previews
struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView(
            episode: .mock
        )
    }
}
