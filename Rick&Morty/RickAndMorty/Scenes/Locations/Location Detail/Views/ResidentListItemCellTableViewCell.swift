//
//  ResidentListItemCellTableViewCell.swift
//  RickAndMorty
//
//  Created by Oliver Jansta on 02.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

class ResidentListItemCellTableViewCell: UITableViewCell {

    @IBOutlet private var containerView: UIView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with character: Character) {
        nameLabel.text = character.name
        typeLabel.text = character.type
    }
}

// MARK: - Setup
private extension ResidentListItemCellTableViewCell {
    func setupView() {
        containerView.backgroundColor = .appBackgroundItem
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8

        nameLabel.dynamicFont = .appItemLargeTitle
        nameLabel.textColor = .appTextItemTitle

        typeLabel.dynamicFont = .appItemDescription
        typeLabel.textColor = .appTextItemTitle
    }
}

// MARK: - NibLoadableView
extension ResidentListItemCellTableViewCell: NibLoadableView {}
