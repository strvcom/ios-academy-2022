//
//  CharacterDetailEpisodeView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 30.01.2022.
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
