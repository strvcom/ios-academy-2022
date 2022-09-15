//
//  EpisodeDetailCharacterView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 30.01.2022.
//

import SwiftUI

struct EpisodeDetailCharacterView: View {
    let character: Character

    var body: some View {
        HStack(spacing: 16) {
            Text(character.name)
                .font(.appItemSmallTitle)
                .foregroundColor(.appTextItemTitle)
                .multilineTextAlignment(.leading)

            Spacer()

            Text("\(character.species)")
                .font(.appItemDescription)
        }
        .padding(16)
        .background(Color.appBackgroundItem)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct EpisodeDetailCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailCharacterView(character: .mock)
    }
}
