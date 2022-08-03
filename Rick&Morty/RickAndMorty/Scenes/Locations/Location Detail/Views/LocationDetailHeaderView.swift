//
//  LocationDetailHeaderView.swift
//  RickAndMorty
//
//  Created by Oliver Jansta on 02.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

class LocationDetailHeaderView: UIView {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var typeLabel: UILabel!
    @IBOutlet private var dimensionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupView()
    }

    func configure(with location: Location) {
        nameLabel.text = location.name
        typeLabel.text = location.type
        dimensionLabel.text = location.dimension
    }
}

// MARK: - Setup
private extension LocationDetailHeaderView {
    func setupView() {
        self.backgroundColor = .appBackgroundItem
        self.clipsToBounds = true

        nameLabel?.dynamicFont = .appItemLargeTitle
        nameLabel?.textColor = .appTextBody

        typeLabel?.dynamicFont = .appItemDescription
        typeLabel?.textColor = .appTextBody
        
        dimensionLabel?.dynamicFont = .appItemDescription
        dimensionLabel?.textColor = .appTextBody
    }
}

// MARK: - NibLoadableView
extension LocationDetailHeaderView: NibLoadableView {}
