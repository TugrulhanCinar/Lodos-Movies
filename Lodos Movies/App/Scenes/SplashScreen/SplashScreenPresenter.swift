//
//  SplashScreenPresenter.swift
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

protocol SplashScreenPresentationLogic {
    func presentInitializeResult(response: SplashScreen.Initialize.Response)
    func presentReloadResult(response: SplashScreen.Reload.Response)
    func presentFinalizeResult(response: SplashScreen.Finalize.Response)}

class SplashScreenPresenter: SplashScreenPresentationLogic {
    
    weak var viewController: SplashScreenDisplayLogic?

    // MARK: VIP Protocols

}
// MARK: - Presentation Logic

extension SplashScreenPresenter {

    func presentInitializeResult(response: SplashScreen.Initialize.Response) {

        viewController?.displayInitializeResult(viewModel: SplashScreen.Initialize.ViewModel(isConnection: response.isConnection))
    }

    func presentReloadResult(response: SplashScreen.Reload.Response) {

        viewController?.displayReloadResult(viewModel: SplashScreen.Reload.ViewModel())
    }

    func presentFinalizeResult(response: SplashScreen.Finalize.Response) {

        viewController?.displayFinalizeResult(viewModel: SplashScreen.Finalize.ViewModel())
    }
}
