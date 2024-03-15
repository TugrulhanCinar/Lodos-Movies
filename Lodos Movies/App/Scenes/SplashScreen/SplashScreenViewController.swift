//
//  SplashScreenViewController.swift
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

protocol SplashScreenDisplayLogic: AnyObject {
    func displayInitializeResult(viewModel: SplashScreen.Initialize.ViewModel)
    func displayReloadResult(viewModel: SplashScreen.Reload.ViewModel)
    func displayFinalizeResult(viewModel: SplashScreen.Finalize.ViewModel)
}

class SplashScreenViewController: BaseViewController, SplashScreenDisplayLogic {
    
    var interactor: SplashScreenBusinessLogic?
    var router: SplashScreenRoutingLogic?
    
    // MARK: Outlets
    
    @IBOutlet weak var labelWelcomeText: UILabel!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        interactor?.initialize(request: SplashScreen.Initialize.Request())
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = SplashScreenInteractor()
        let presenter = SplashScreenPresenter()
        let router = SplashScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
    
    // MARK: - Display Logic

    extension SplashScreenViewController {

        func displayInitializeResult(viewModel: SplashScreen.Initialize.ViewModel) { 
            
            if viewModel.isConnection {
                interactor?.reload(request: SplashScreen.Reload.Request())
            } else {
                showAlertMessage(
                    title: UIMessageConstant.internetConnectionTitle,
                    message: UIMessageConstant.internetConnectionMSG
                )
            }
        }

        func displayReloadResult(viewModel: SplashScreen.Reload.ViewModel) { 
            
            DispatchQueue.main.sync {
                labelWelcomeText.text = viewModel.welcomeText
                router?.routeToMainPage()
            }
        }

        func displayFinalizeResult(viewModel: SplashScreen.Finalize.ViewModel) { }
    }
