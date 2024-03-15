//
//  MovieDetailInteractor.swift
//  Lodos Movies
//
//  Created by Tuğrul on 15.03.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MovieDetailBusinessLogic {
    func initialize(request: MovieDetail.Initialize.Request)
    func reload(request: MovieDetail.Reload.Request)
    func finalize(request: MovieDetail.Finalize.Request)}

protocol MovieDetailDataStore {
    var movieID: String { get set}
}

class MovieDetailInteractor: MovieDetailBusinessLogic, MovieDetailDataStore {
    var presenter: MovieDetailPresentationLogic?
    var worker: MovieDetailWorker?
    var movieID: String = ""

    init() {
        
        worker = MovieDetailWorker()
    }
    
}
// MARK: - Interactor Logic

extension MovieDetailInteractor {
    
    func initialize(request: MovieDetail.Initialize.Request) {

        presenter?.presentInitializeResult(response: MovieDetail.Initialize.Response())
    }
    
    func reload(request: MovieDetail.Reload.Request) {

        presenter?.presentReloadResult(response: MovieDetail.Reload.Response())
    }
    
    func finalize(request: MovieDetail.Finalize.Request) {

        presenter?.presentFinalizeResult(response: MovieDetail.Finalize.Response())
    }
}
