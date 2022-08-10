//
//  CharacterGridItemView.swift
//  RickAndMorty
//
//  Created by Róbert Oravec on 09.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterGridItemView: View {
    let character: Character
    
    var body: some View {
        WebImage(url: character.imageUrl)
            .placeholder {
                ProgressView()
            }
            .resizable()
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

// MARK: - Previews
struct CharacterGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterGridItemView(character: .mock)
            .frame(
                width: 200,
                height: 200
            )
    }
}
