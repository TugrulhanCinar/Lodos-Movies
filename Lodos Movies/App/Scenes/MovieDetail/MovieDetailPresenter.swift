//
//  MovieDetailPresenter.swift
//  Lodos Movies
//
//  Created by Tuğrul on 15.03.2024.


import UIKit

protocol MovieDetailPresentationLogic {
    func presentInitializeResult(response: MovieDetail.Initialize.Response)
    func presentReloadResult(response: MovieDetail.Reload.Response)
    func presentFinalizeResult(response: MovieDetail.Finalize.Response)
}

class MovieDetailPresenter: MovieDetailPresentationLogic {
    weak var viewController: MovieDetailDisplayLogic?

}

// MARK: - Presentation Logic

extension MovieDetailPresenter {

    func presentInitializeResult(response: MovieDetail.Initialize.Response) { 
        
        viewController?.displayInitializeResult(viewModel: MovieDetail.Initialize.ViewModel())
    }

    func presentReloadResult(response: MovieDetail.Reload.Response) {
        
        viewController?.displayReloadResult(viewModel: MovieDetail.Reload.ViewModel(isContinue: response.isContinue, movieDetail: response.movieDetail))
    }

    func presentFinalizeResult(response: MovieDetail.Finalize.Response) {

        viewController?.displayFinalizeResult(viewModel: MovieDetail.Finalize.ViewModel())
    }
}
