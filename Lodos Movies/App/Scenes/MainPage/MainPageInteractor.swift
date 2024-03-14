//
//  MainPageInteractor.swift
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

protocol MainPageBusinessLogic {
    func initialize(request: MainPage.Initialize.Request)
    func search(request: MainPage.Search.Request)
}

protocol MainPageDataStore {
    //var name: String { get set }
}

class MainPageInteractor: MainPageBusinessLogic, MainPageDataStore {

    var presenter: MainPagePresentationLogic?
    var worker: MainPageWorker?

    init() {
        
        worker = MainPageWorker()
    }
}
// MARK: - Display Logic

extension MainPageInteractor {
    
    func initialize(request: MainPage.Initialize.Request) {
        
    }
    
    func search(request: MainPage.Search.Request) {
        
        self.presenter?.presentSearchResult(response: MainPage.Search.Response(isContinue: true))
        worker?.fetchMovies(text: request.searchText, completion: { movieRepository in
            self.presenter?.presentSearchResult(response: MainPage.Search.Response(isContinue: false, results: movieRepository))
        })
    }

}
