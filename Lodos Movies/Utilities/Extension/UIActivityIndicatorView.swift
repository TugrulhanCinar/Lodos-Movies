//
//  UIActivityIndicatorView.swift
//  Lodos Movies
//
//  Created by Tuğrul on 16.03.2024.
//

import UIKit

extension UIActivityIndicatorView {

    func hiddenAndStopAnimation() {
        
        self.stopAnimating()
        self.isHidden = true
    }
    
    func unHiddenAndStartAnimation() {
        
        self.startAnimating()
        self.isHidden = false
    }
}
