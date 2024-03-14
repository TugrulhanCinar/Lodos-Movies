//
//  BaseTableViewCell.swift
//  Lodos Movies
//
//  Created by Tuğrul on 14.03.2024.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {

        super.awakeFromNib()
        applyStyling()
        applyTranslation()
    }

    /// When the screen is rotated
    func applyTranslation() { }

    func applyStyling() {
        
        selectionStyle = .none
    }
}
