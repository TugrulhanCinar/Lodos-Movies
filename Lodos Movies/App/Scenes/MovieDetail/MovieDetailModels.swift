//
//  MovieDetailModels.swift
//  Lodos Movies
//
//  Created by Tuğrul on 15.03.2024.


enum MovieDetail {
    // MARK: Use cases

    enum Initialize {
        struct Request { }

        struct Response { }

        struct ViewModel { }
    }

    enum Reload {

        struct Request { }

        struct Response { 
            var isContinue: Bool
            var movieDetail: MovieDetailResponse?
        }

        struct ViewModel {
            var isContinue: Bool
            var movieDetail: MovieDetailResponse?
        }
    }

    enum Finalize {

        struct Request { }

        struct Response { }

        struct ViewModel { }
    }
}
