//
//  SplashScreenRouter.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit


protocol SplashScreenRoutingLogic {
    func routeToMainPage()
}

protocol SplashScreenDataPassing {
    var dataStore: SplashScreenDataStore? { get }
}

class SplashScreenRouter: SplashScreenRoutingLogic, SplashScreenDataPassing {
    weak var viewController: SplashScreenViewController?
    var dataStore: SplashScreenDataStore?
    
    func routeToMainPage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if let navigationController = self.viewController?.navigationController {
                var viewControllers = navigationController.viewControllers
                viewControllers.removeLast() // Bu adım opsiyonel, eğer mevcut VC'yi stack'de tutmak istemiyorsanız kullanın.
                
                let mainVC = ViewControllers.mainPage.getViewcontrollers() as! MainPageViewController
                
                let newViewController = MainPageViewController()
                viewControllers.append(mainVC)
                navigationController.setViewControllers(viewControllers, animated: false)
            }
        }
       
    }
}
