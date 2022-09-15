//
//  CharactersListRowItemView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import SDWebImageSwiftUI
import SwiftUI

struct CharactersListRowItemView: View {
    let character: Character

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            WebImage(url: character.imageUrl)
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .frame(width: 110, height: 110)

            VStack(alignment: .leading, spacing: 4) {
                Text(character.name)
                    .font(.appItemLargeTitle)
                    .foregroundColor(.appTextItemTitle)
                    .multilineTextAlignment(.leading)

                Text("\(character.species) • \(character.gender)")
                    .font(.appItemDescription)
            }
            .padding(.vertical, 16)
        }
    }
}

// MARK: - Previews
struct CharactersListItemView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListRowItemView(character: Character.mock)
    }
}
