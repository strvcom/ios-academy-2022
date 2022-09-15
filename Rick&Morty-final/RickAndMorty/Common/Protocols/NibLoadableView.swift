//
//  NibLoadableView.swift
//  STRV_template
//
//  Created by Jan Kaltoun on 28/12/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import UIKit

protocol NibLoadableView: AnyObject, NibNameIdentifiable {
    func loadNibContent()
}

extension NibLoadableView where Self: UIView {
    static var nibInstance: Self {
        guard let loadedView = Self.nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("XIB file with identifier: \(identifier) could not be loaded!")
        }

        return loadedView
    }

    var nibViewInstance: UIView {
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("XIB file with identifier: \(Self.identifier) could not be loaded!")
        }

        return view
    }

    func loadNibContent() {
        let view = nibViewInstance

        view.frame = bounds

        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        addSubview(view)
    }
}
