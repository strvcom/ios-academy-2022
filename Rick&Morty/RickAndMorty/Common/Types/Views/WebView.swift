//
//  WebView.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 23.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import SwiftUI

struct WebView: View {
    let url: URL
    @State private var isLoaded: Bool = false
    
    var body: some View {
        ZStack {
            WebRenderingView(url: url, isLoaded: $isLoaded)
            
            if !isLoaded {
                ProgressView()
            }
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        // swiftlint:disable:next force_unwrapping
        WebView(url: Episode.mock.rottenTomatoesUrl!)
    }
}
