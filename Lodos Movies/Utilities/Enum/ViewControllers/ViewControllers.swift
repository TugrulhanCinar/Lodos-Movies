//
//  ViewControllers.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.
//

import UIKit

enum ViewControllers: String {
    case mainPage = "MainPageViewController"
    case movieDetail = "MovieDetailViewController"
    
    func getViewcontrollers(storyboard: Storyboards = .main) -> BaseViewController {
        
        return storyboard.getStoryboards().instantiateViewController(withIdentifier: self.rawValue) as! BaseViewController
    }
}
