//
//  Font+App.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import SwiftUI

// MARK: - SwiftUI
extension Font {
    static func clashDisplayVariableBoldSemibold(ofSize size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font {
        R.font.clashDisplayVariableBold.font(size: size, relativeTo: textStyle)
    }

    static func satoshiVariableBoldBold(ofSize size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font {
        R.font.satoshiVariableBold.font(size: size, relativeTo: textStyle)
    }
}

extension Font {
    static let appSectionTitle = clashDisplayVariableBoldSemibold(ofSize: 18, relativeTo: .title)

    static let appItemLargeTitle = clashDisplayVariableBoldSemibold(ofSize: 18, relativeTo: .title)
    static let appItemSmallTitle = clashDisplayVariableBoldSemibold(ofSize: 13, relativeTo: .title)
    static let appItemDescription = clashDisplayVariableBoldSemibold(ofSize: 13, relativeTo: .body)
}

// MARK: - UIKit
extension UIFont {
    static func clashDisplayVariableBoldSemibold(ofSize size: CGFloat) -> UIFont {
        // swiftlint:disable:next force_unwrapping
        R.font.clashDisplayVariableBold(size: size)!
    }
}

extension UIFont {
    static let appNavigationBarLargeBase = clashDisplayVariableBoldSemibold(ofSize: 34)
    static let appNavigationBarLarge = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: .appNavigationBarLargeBase)

    static let appNavigationBarCompactBase = clashDisplayVariableBoldSemibold(ofSize: 18)
    static let appNavigationBarCompact = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: .appNavigationBarCompactBase)

    static let appTabBarBase = clashDisplayVariableBoldSemibold(ofSize: 11)
    static let appTabBar = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: .appTabBarBase)

    static let appSectionTitleBase = clashDisplayVariableBoldSemibold(ofSize: 18)
    static let appSectionTitle = UIFontMetrics(forTextStyle: .title1).scaledFont(for: .appSectionTitleBase)

    static let appItemLargeTitleBase = clashDisplayVariableBoldSemibold(ofSize: 18)
    static let appItemLargeTitle = UIFontMetrics(forTextStyle: .title1).scaledFont(for: .appItemLargeTitleBase)
    static let appItemSmallTitleBase = clashDisplayVariableBoldSemibold(ofSize: 13)
    static let appItemSmallTitle = UIFontMetrics(forTextStyle: .title1).scaledFont(for: .appItemSmallTitleBase)
    static let appItemDescriptionBase = clashDisplayVariableBoldSemibold(ofSize: 13)
    static let appItemDescription = UIFontMetrics(forTextStyle: .body).scaledFont(for: .appItemDescriptionBase)
}
