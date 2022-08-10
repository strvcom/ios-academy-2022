//
//  CharactersListView.swift
//  RickAndMorty
//
//  Created by Róbert Oravec on 09.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import SwiftUI

struct CharactersListView: View {
    @State var mode: Mode = .list
    
    let gridColumns: [GridItem] = Array(
        repeating: GridItem(.flexible(), spacing: 10),
        count: 3
    )
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            contentView
        }
        .navigationTitle(R.string.localizable.tabTitleCharacters())
        .toolbar {
            ToolbarItem {
                Button(action: toggleMode) {
                    mode.image
                }
            }
        }
        .foregroundColor(.appTextBody)
        .preferredColorScheme(.none)
    }
    
    @ViewBuilder private var contentView: some View {
        ScrollView {
            switch mode {
            case .list:
                listView
            case .grid:
                gridView
            }
        }
    }
    
    @ViewBuilder private var listView: some View {
        LazyVStack(alignment: .leading, spacing: 12) {
            ForEach(Character.characters) { character in
                CharacterRowItemView(character: character)
            }
        }
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder private var gridView: some View {
        LazyVGrid(columns: gridColumns, spacing: 10) {
            ForEach(Character.characters) { character in
                CharacterGridItemView(character: character)
            }
        }
    }
}

// MARK: - Actions
private extension CharactersListView {
    func toggleMode() {
        withAnimation {
            mode.toggle()
        }
    }
}

// MARK: - Mode
extension CharactersListView {
    enum Mode {
        case list
        case grid
        
        var image: Image {
            switch self {
            case .list:
                return Image.systemSquareGrid
            case .grid:
                return Image.systemListDash
            }
        }
        
        mutating func toggle() {
            switch self {
            case .list:
                self = .grid
            case .grid:
                self = .list
            }
        }
    }
}

// MARK: - Previews
struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
