//
//  WebView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 28.03.2022.
//

import SwiftUI
import WebKit

struct WebView: View {
    let url: URL

    @State private var isLoaded = false

    var body: some View {
        ZStack {
            WebRenderingView(url: url, isLoaded: $isLoaded)

            if !isLoaded {
                ProgressView()
            }
        }
    }
}
