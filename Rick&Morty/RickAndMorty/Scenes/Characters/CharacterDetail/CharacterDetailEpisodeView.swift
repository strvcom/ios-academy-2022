//
//  CharacterDetailEpisodeView.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 23.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import SwiftUI

struct CharacterDetailEpisodeView: View {
    let episode: Episode

    var body: some View {
        HStack(spacing: 16) {
            Text(episode.name)
                .font(.appItemSmallTitle)
                .foregroundColor(.appTextItemTitle)
                .multilineTextAlignment(.leading)

            Spacer()

            Text(episode.code)
                .font(.appItemDescription)
        }
        .padding(16)
        .background(Color.appBackgroundItem)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct CharacterDetailEpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailEpisodeView(episode: .mock)
    }
}
