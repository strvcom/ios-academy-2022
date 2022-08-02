//
//  LocationDetailHeaderView.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 19.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

class LocationDetailHeaderView: UITableViewHeaderFooterView {
    @IBOutlet private var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupView()
    }

    func configure(with title: String) {
        titleLabel.text = title
    }
}

// MARK: - Setup
private extension LocationDetailHeaderView {
    func setupView() {
        titleLabel.dynamicFont = .appSectionTitle
        titleLabel.textColor = .appTextSectionTitle
    }
}

// MARK: - NibLoadableView
extension LocationDetailHeaderView: NibLoadableView {}
