//
//  LocaleImages.swift
//  Lodos Movies
//
//  Created by Tuğrul on 14.03.2024.
//

import UIKit

enum LocaleImage: String {
    case brokenImage = "broken_image"
    
    func getUIImage() -> UIImage? {
     
        return UIImage(named: self.rawValue)
    }
}
