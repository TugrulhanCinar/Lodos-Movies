//
//  BaseCollectionViewCell.swift
//  Lodos Movies
//
//  Created by Tuğrul on 16.03.2024.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {

        super.awakeFromNib()
        applyStyling()
        applyTranslation()
    }

    /// When the screen is rotated
    func applyTranslation() { }

    func applyStyling() { }
}
