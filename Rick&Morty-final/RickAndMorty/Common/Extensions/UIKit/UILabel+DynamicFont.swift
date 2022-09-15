//
//  UILabel+DynamicFonts.swift
//  STRV_template
//
//  Created by Jan on 25.02.2021.
//  Copyright © 2021 STRV. All rights reserved.
//

import UIKit

extension UILabel {
    var dynamicFont: UIFont {
        get {
            font
        }
        set {
            font = newValue
            adjustsFontForContentSizeCategory = true
        }
    }
}
