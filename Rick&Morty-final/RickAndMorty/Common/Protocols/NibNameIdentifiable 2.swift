//
//  NibNameIdentifiable.swift
//  STRV_template
//
//  Created by Jan Kaltoun on 28/12/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import UIKit

protocol NibNameIdentifiable {}

extension NibNameIdentifiable where Self: UIView {
    static var identifier: String {
        String(describing: Self.self)
    }

    static var nib: UINib {
        UINib(nibName: Self.identifier, bundle: Bundle(for: Self.self))
    }
}
