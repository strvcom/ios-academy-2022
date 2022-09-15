//
//  WebRenderingView.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 30.03.2022.
//

import SwiftUI
import WebKit

struct WebRenderingView: UIViewRepresentable {
    let url: URL
    @Binding var isLoaded: Bool

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url)

        webView.load(request)
        webView.navigationDelegate = context.coordinator

        return webView
    }

    func updateUIView(_: WKWebView, context _: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    // This is a standardized way of implementing delegates in `UIViewRepresentable`
    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: WebRenderingView

        init(parent: WebRenderingView) {
            self.parent = parent
        }

        // swiftlint:disable:next implicitly_unwrapped_optional
        func webView(_: WKWebView, didFinish _: WKNavigation!) {
            parent.isLoaded = true
        }
    }
}
