//
//  Color+App.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import SwiftUI

// swiftlint:disable force_unwrapping

// MARK: - SwiftUI
extension Color {
    static let appBackgroundGradientTop = Color(uiColor: .appBackgroundGradientTop)
    static let appBackgroundGradientBottom = Color(uiColor: .appBackgroundGradientBottom)
    static let appBackgroundItem = Color(uiColor: .appBackgroundItem)

    static let appTextBody = Color(uiColor: .appTextBody)
    static let appTextSectionTitle = Color(uiColor: .appTextSectionTitle)
    static let appTextItemTitle = Color(uiColor: .appTextItemTitle)
    static let appTextNavigationBar = Color(uiColor: .appTextNavigationBar)
}

// MARK: - UIKit
extension UIColor {
    static let appBackgroundTabBar = R.color.colors.background.tabBar()!
    static let appBackgroundSegmentedControlGeneral = R.color.colors.background.segmentedControl.general()!
    static let appBackgroundSegmentedControlSelected = R.color.colors.background.segmentedControl.selected()!
    static let appBackgroundItem = R.color.colors.background.item()!
    static let appBackgroundGradientTop = R.color.colors.background.gradient.top()!
    static let appBackgroundGradientBottom = R.color.colors.background.gradient.bottom()!

    static let appTintNavigationBar = R.color.colors.tint.navigationBar()!
    static let appTintTabBarSelected = R.color.colors.tint.tabBar.selected()!
    static let appTintTabBarUnselected = R.color.colors.tint.tabBar.unselected()!

    static let appTextItemTitle = R.color.colors.text.itemTitle()!
    static let appTextItemTitleInverse = R.color.colors.text.itemTitleInverse()!
    static let appTextBody = R.color.colors.text.body()!
    static let appTextSectionTitle = R.color.colors.text.sectionTitle()!
    static let appTextNavigationBar = R.color.colors.text.navigationBar()!
}
