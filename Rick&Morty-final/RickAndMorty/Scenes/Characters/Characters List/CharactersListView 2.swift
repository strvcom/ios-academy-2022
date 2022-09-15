//
//  CharactersListView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import SwiftUI

struct CharactersListView: View {
    enum Event {
        case didSelectCharacter(character: Character)
    }

    @StateObject var store: CharactersListStore
    weak var coordinator: CharactersListViewEventHandling?

    @State private var mode: Mode = .list

    let gridColumns: [GridItem] = Array(
        repeating: .init(.flexible(), spacing: 10),
        count: 3
    )

    var body: some View {
        ZStack {
            BackgroundGradientView()

            switch store.state {
            case .finished:
                content
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

    @ViewBuilder var content: some View {
        ScrollView {
            switch mode {
            case .list:
                listContent
            case .grid:
                gridContent
            }

            if case let .finished(loadingMore) = store.state, loadingMore {
                ProgressView()
            }
        }
    }

    @ViewBuilder var listContent: some View {
        LazyVStack(alignment: .leading, spacing: 12) {
            ForEach(store.characters) { character in
                CharactersListRowItemView(character: character)
                    .onTapGesture {
                        coordinator?.handle(event: .didSelectCharacter(character: character))
                    }
                    .task {
                        await loadMoreIfNeeded(for: character)
                    }
            }
        }
        .padding(.horizontal, 16)
        .transition(.fade)
    }

    @ViewBuilder var gridContent: some View {
        LazyVGrid(columns: gridColumns, spacing: 10) {
            ForEach(store.characters) { character in
                CharactersListGridItemView(character: character)
                    .onTapGesture {
                        coordinator?.handle(event: .didSelectCharacter(character: character))
                    }
                    .task {
                        await loadMoreIfNeeded(for: character)
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

    func loadMoreIfNeeded(for character: Character) async {
        await store.loadMoreIfNeeded(for: character)
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
        CharactersListView(store: CharactersListStore(apiManager: APIManager.mock))
    }
}
