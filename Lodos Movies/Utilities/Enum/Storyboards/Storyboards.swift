//
//  UIStoryboardSegue.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.
//

import UIKit

enum Storyboards: String {
    case main = "Main"
    
    func getStoryboards() -> UIStoryboard {
        
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}



