//
//  MainPageWorker.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.


class MainPageWorker {
   
    func fetchMovies(text: String, completion: @escaping  (MovieResponse?) -> Void) {
        
        MovieRepository.shared.fetchMovies(movieTitle: text) { response in
            completion(response)
        }
    }
}
