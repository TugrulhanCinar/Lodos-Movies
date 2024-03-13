//
//  SplashScreenInteractor.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol SplashScreenBusinessLogic {

    func initialize(request: SplashScreen.Initialize.Request)
    func reload(request: SplashScreen.Reload.Request)
    func finalize(request: SplashScreen.Finalize.Request)
}

protocol SplashScreenDataStore {
    //var name: String { get set }
}

class SplashScreenInteractor: SplashScreenBusinessLogic, SplashScreenDataStore {
    var presenter: SplashScreenPresentationLogic?
    var worker: SplashScreenWorker?
}

extension SplashScreenInteractor {

    func initialize(request: SplashScreen.Initialize.Request) {

        
        presenter?.presentInitializeResult(response: SplashScreen.Initialize.Response(isConnection: worker?.checkConnection() ?? false))
    }

    func reload(request: SplashScreen.Reload.Request) {

        presenter?.presentReloadResult(response: SplashScreen.Reload.Response())
    }

    func finalize(request: SplashScreen.Finalize.Request) {

        presenter?.presentFinalizeResult(response: SplashScreen.Finalize.Response())
    }
}