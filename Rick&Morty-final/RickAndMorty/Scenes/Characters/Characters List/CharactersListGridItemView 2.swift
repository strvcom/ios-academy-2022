//
//  CharactersListGridItemView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 30.01.2022.
//

import SDWebImageSwiftUI
import SwiftUI

struct CharactersListGridItemView: View {
    let character: Character

    var body: some View {
        WebImage(url: character.imageUrl)
            .placeholder {
                ProgressView()
            }
            .resizable()
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Previews
struct CharactersListGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListGridItemView(character: .mock)
    }
}
