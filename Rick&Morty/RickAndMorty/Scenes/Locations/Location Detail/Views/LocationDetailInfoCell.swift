//
//  LocationDetailInfoCell.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 19.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

class LocationDetailInfoCell: UITableViewCell {
    @IBOutlet private var iconImage: UIImageView!
    @IBOutlet private var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupView()
    }

    func configure(with image: UIImage?, title: String) {
        iconImage.image = image
        titleLabel.text = title
    }
}

// MARK: - Setup
private extension LocationDetailInfoCell {
    func setupView() {
        titleLabel.dynamicFont = .appItemDescription
        titleLabel.textColor = .appTextBody

        iconImage.tintColor = .appTextBody
    }
}

// MARK: - NibLoadableView
extension LocationDetailInfoCell: NibLoadableView {}
