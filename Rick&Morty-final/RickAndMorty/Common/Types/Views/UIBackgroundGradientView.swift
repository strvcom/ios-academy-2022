//
//  UIBackgroundGradientView.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 23.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

class UIBackgroundGradientView: UIView {
    private lazy var gradientLayer = CAGradientLayer()

    init() {
        super.init(frame: .zero)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        gradientLayer.frame = bounds
    }
}

// MARK: - Setup
private extension UIBackgroundGradientView {
    func setup() {
        gradientLayer.colors = [
            UIColor.appBackgroundGradientTop.cgColor,
            UIColor.appBackgroundGradientBottom.cgColor
        ]

        layer.addSublayer(gradientLayer)
    }
}
