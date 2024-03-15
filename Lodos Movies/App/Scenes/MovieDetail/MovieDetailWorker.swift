//
//  MovieDetailWorker.swift
//  Lodos Movies
//
//  Created by Tuğrul on 15.03.2024.


class MovieDetailWorker { 
    
    func fetchMovieDetail(movideID id: String, completion: @escaping (MovieDetailResponse?) -> Void) {
        
        MovieRepository.shared.fetchMovieDetail(movieID: id) { response in
            completion(response)
        }
    }
}
