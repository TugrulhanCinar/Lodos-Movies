//
//  SplashScreenRouter.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol SplashScreenRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SplashScreenDataPassing {
    var dataStore: SplashScreenDataStore? { get }
}

class SplashScreenRouter: NSObject, SplashScreenRoutingLogic, SplashScreenDataPassing {
    weak var viewController: SplashScreenViewController?
    var dataStore: SplashScreenDataStore?
}