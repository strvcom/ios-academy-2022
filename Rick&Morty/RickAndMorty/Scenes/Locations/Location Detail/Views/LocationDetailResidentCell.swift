//
//  LocationDetailResidentCell.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 19.05.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

class LocationDetailResidentCell: UITableViewCell {
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var speciesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupView()
    }

    func configure(with character: Character) {
        nameLabel.text = character.name
        speciesLabel.text = character.species
    }
}

// MARK: - Setup
private extension LocationDetailResidentCell {
    func setupView() {
        containerView.backgroundColor = .appBackgroundItem
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8

        nameLabel.dynamicFont = .appItemSmallTitle
        nameLabel.textColor = .appTextItemTitle

        speciesLabel.dynamicFont = .appItemDescription
        speciesLabel.textColor = .appTextBody
    }
}

// MARK: - NibLoadableView
extension LocationDetailResidentCell: NibLoadableView {}
