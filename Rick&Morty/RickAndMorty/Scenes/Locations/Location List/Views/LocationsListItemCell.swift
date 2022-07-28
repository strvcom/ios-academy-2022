//
//  LocationsListItemCell.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 18.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

class LocationsListItemCell: UITableViewCell {
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var typeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupView()
    }

    func configure(with location: Location) {
        nameLabel.text = location.name
        typeLabel.text = location.type
    }
}

// MARK: - Setup
private extension LocationsListItemCell {
    func setupView() {
        containerView.backgroundColor = .appBackgroundItem
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8

        nameLabel.dynamicFont = .appItemLargeTitle
        nameLabel.textColor = .appTextItemTitle

        typeLabel.dynamicFont = .appItemDescription
        typeLabel.textColor = .appTextBody
    }
}

// MARK: - NibLoadableView
extension LocationsListItemCell: NibLoadableView {}
