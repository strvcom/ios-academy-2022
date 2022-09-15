//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 30.01.2022.
//

import SDWebImageSwiftUI
import SwiftUI

struct CharacterDetailView: View {
    enum Event {
        case didSelectEpisode(episode: Episode)
        case didSelectLocation(id: Int)
    }

    @StateObject var store: CharacterDetailStore
    weak var coordinator: CharacterDetailViewEventHandling?

    var body: some View {
        ZStack(alignment: .topLeading) {
            BackgroundGradientView()

            switch (store.state, store.character) {
            case let (.finished, .some(character)):
                makeContent(for: character)
            case (.initial, _), (.loading, _), (.finished, _):
                ProgressView()
            case (.failed, _):
                Text(R.string.localizable.generalStateErrorSomethingWentWrong())
            }
        }
        .navigationTitle(store.character?.name ?? R.string.localizable.generalStateLoading())
        .onFirstAppear(perform: load)
        .foregroundColor(.appTextBody)
        .preferredColorScheme(.none)
    }
}

// MARK: - UI
private extension CharacterDetailView {
    @ViewBuilder var episodes: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(R.string.localizable.characterDetailEpisodes())
                .font(.appSectionTitle)
                .foregroundColor(.appTextSectionTitle)
                .padding(.leading, 8)

            VStack(spacing: 8) {
                ForEach(store.episodes) { episode in
                    CharacterDetailEpisodeView(episode: episode)
                        .onTapGesture {
                            coordinator?.handle(event: .didSelectEpisode(episode: episode))
                        }
                }
            }
        }
    }

    @ViewBuilder func makeContent(for character: Character) -> some View {
        ScrollView {
            VStack(spacing: 16) {
                WebImage(url: character.imageUrl)
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .frame(maxWidth: .infinity)

                VStack(alignment: .leading, spacing: 16) {
                    makeInfo(for: character)

                    episodes
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 16)
        }
    }

    @ViewBuilder func makeInfo(for character: Character) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(R.string.localizable.characterDetailInfo())
                .font(.appSectionTitle)
                .foregroundColor(.appTextSectionTitle)

            HStack(alignment: .top) {
                VStack(alignment: .horizontalInfoAlignment, spacing: 8) {
                    HStack(alignment: .top, spacing: 8) {
                        Image.systemCreditCard

                        Text(character.name)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }

                    HStack(alignment: .top, spacing: 8) {
                        Image.systemPersonFillQuestionMark

                        Text(character.species)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }

                    if !character.type.isEmpty {
                        HStack(alignment: .top, spacing: 8) {
                            Image.systemPersonFillViewFinder

                            Text(character.type)
                                .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                        }
                    }

                    HStack(alignment: .top, spacing: 8) {
                        Image.systemPersonAndArrowLeft

                        Text(character.gender)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                }

                Spacer()

                VStack(alignment: .horizontalInfoAlignment, spacing: 8) {
                    let originView = HStack(alignment: .top, spacing: 8) {
                        Image.systemGlobe

                        Text(character.origin.name)
                            .multilineTextAlignment(.leading)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }

                    if let locationId = character.origin.locationId {
                        originView
                            .onTapGesture {
                                coordinator?.handle(event: .didSelectLocation(id: locationId))
                            }
                    } else {
                        originView
                    }

                    let locationView = HStack(alignment: .top, spacing: 8) {
                        Image.systemEyes

                        Text(character.location.name)
                            .multilineTextAlignment(.leading)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }

                    if let locationId = character.location.locationId {
                        locationView
                            .onTapGesture {
                                coordinator?.handle(event: .didSelectLocation(id: locationId))
                            }
                    } else {
                        locationView
                    }
                }
            }
            .font(.appItemDescription)
        }
        .padding(.horizontal, 8)
    }
}

// MARK: - Actions
private extension CharacterDetailView {
    func load() {
        Task {
            await store.load()
        }
    }
}

// MARK: - Previews
struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(
            store: .init(providedData: .entity(.mock), apiManager: APIManager.mock)
        )
    }
}
