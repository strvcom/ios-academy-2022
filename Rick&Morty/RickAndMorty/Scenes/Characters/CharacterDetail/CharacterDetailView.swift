//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 16.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct CharacterDetailView: View {
    @StateObject var store: CharacterDetailStore
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            content
        }
        .onFirstAppear(perform: load)
        .navigationTitle(store.character.name)
        .foregroundColor(.appTextBody)
        .preferredColorScheme(.none)
    }
    
    var content: some View {
        ScrollView {
            VStack(spacing: 16) {
                WebImage(url: store.character.imageUrl)
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                VStack(alignment: .leading, spacing: 16) {
                    info

                    episodes
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
        }
    }
    
    var info: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(R.string.localizable.characterDetailInfo())
                .font(.appSectionTitle)
                .foregroundColor(.appTextSectionTitle)
            
            HStack(alignment: .top, spacing: 8) {
                VStack(alignment: .horizontalInfoAlignment, spacing: 8) {
                    HStack(alignment: .top, spacing: 8) {
                        Image.systemCreditCard
                        
                        Text(store.character.name)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                    
                    HStack(alignment: .top, spacing: 8) {
                        Image.systemPersonFillQuestionMark
                        
                        Text(store.character.species)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                    
                    if !store.character.type.isEmpty {
                        HStack(alignment: .top, spacing: 8) {
                            Image.systemPersonFillViewFinder

                            Text(store.character.type)
                                .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                        }
                    }
                    
                    HStack(alignment: .top, spacing: 8) {
                        Image.systemPersonAndArrowLeft
                        
                        Text(store.character.gender)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .horizontalInfoAlignment, spacing: 8) {
                    HStack(alignment: .top, spacing: 8) {
                        Image.systemGlobe
                        
                        Text(store.character.origin.name)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                    
                    HStack(alignment: .top, spacing: 8) {
                        Image.systemEyes
                        
                        Text(store.character.location.name)
                            .alignmentGuide(.horizontalInfoAlignment) { $0[.leading] }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .font(.appItemDescription)
        }
        .padding(.horizontal, 8)
    }
    
    @ViewBuilder var episodes: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(R.string.localizable.characterDetailEpisodes())
                .font(.appSectionTitle)
                .foregroundColor(.appTextSectionTitle)
                .padding(.leading, 8)

            VStack(spacing: 8) {
                ForEach(store.mockedEpisodes) { episode in
                    CharacterDetailEpisodeView(episode: episode)
                }
            }
        }
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
