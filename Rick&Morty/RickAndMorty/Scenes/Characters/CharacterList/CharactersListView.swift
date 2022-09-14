//
//  CharactersListView.swift
//  RickAndMorty
//
//  Created by Róbert Oravec on 09.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import SwiftUI

struct CharactersListView: View {
    enum Event {
        case didSelectCharacter(character: Character)
    }
    
    @State private var mode: Mode = .list
    @StateObject var store: CharactersListStore
    weak var coordinator: CharactersListEventHandling?
    
    let gridColumns: [GridItem] = Array(
        repeating: GridItem(.flexible(), spacing: 10),
        count: 3
    )
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            switch store.state {
            case .finished:
                contentView
            case .initial, .loading:
                ProgressView()
            case .failed:
                Text(R.string.localizable.generalStateErrorSomethingWentWrong())
            }
        }
        .navigationTitle(R.string.localizable.tabTitleCharacters())
        .toolbar {
            ToolbarItem {
                Button(action: toggleMode) {
                    mode.image
                }
            }
        }
        .onFirstAppear(perform: load)
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
        
        if case let .finished(loadingMore) = store.state, loadingMore {
            ProgressView()
        }
    }
    
    @ViewBuilder private var listView: some View {
        LazyVStack(alignment: .leading, spacing: 12) {
            ForEach(store.characters) { character in
                CharacterRowItemView(character: character)
                    .onTapGesture {
                        coordinator?.handle(event: .didSelectCharacter(character: character))
                    }
                    .task {
                        await store.loadMoreIfNeeded(for: character)
                    }
            }
        }
        .padding(.horizontal, 16)
        .transition(.fade)
    }
    
    @ViewBuilder private var gridView: some View {
        LazyVGrid(columns: gridColumns, spacing: 10) {
            ForEach(store.characters) { character in
                CharacterGridItemView(character: character)
                    .onTapGesture {
                        coordinator?.handle(event: .didSelectCharacter(character: character))
                    }
                    .task {
                        await store.loadMoreIfNeeded(for: character)
                    }
            }
        }
        .padding(.horizontal, 10)
        .transition(.fade)
    }
}

// MARK: - Actions
private extension CharactersListView {
    func load() {
        Task {
            await store.load()
        }
    }

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
        CharactersListView(store: .init(apiManager: APIManager()))
    }
}
