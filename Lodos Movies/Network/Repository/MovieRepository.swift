//
//  MovieRepository.swift
//  Lodos Movies
//
//  Created by Tuğrul on 14.03.2024.
//

protocol MovieRepositoryLogic: Repository {
    func fetchMovies(movieTitle text: String, completion: @escaping  (MovieResponse?) -> Void)
    func fetchMovieDetail(movieID id: String, completion: @escaping (MovieDetailResponse?) -> Void)
}

class MovieRepository: MovieRepositoryLogic {
    
    static let shared = MovieRepository()
    private init() { }
    
    private var movieBaseUrl = "https://www.omdbapi.com/?s="
    private var movieDetailBaseUrl = "https://www.omdbapi.com/?i="
    
    func fetchMovies(movieTitle text: String, completion: @escaping (MovieResponse?) -> Void) {
        
        
        let responseUrl = movieBaseUrl + text.lowercased().replacingOccurrences(of: " ", with: "+") + "&apikey=\(NetworkConstant.apiKey)"
        
        LoodosMoviesService.shared.get(url: responseUrl) { response, error in
            if let response = response, let movies: MovieResponse = self.getObject(data: response) {
               completion(movies)
            } else {
                print("Error fetch movies: \(error?.errorDescription ?? "")")
                completion(nil)
            }
        }
    }
    
    func fetchMovieDetail(movieID id: String, completion: @escaping (MovieDetailResponse?) -> Void) {
        
        let responseUrl = movieDetailBaseUrl + id + "&apikey=\(NetworkConstant.apiKey)"
        
        LoodosMoviesService.shared.get(url: responseUrl) { response, error in
            if let response = response, let movies: MovieDetailResponse = self.getObject(data: response) {
               completion(movies)
            } else {
                print("Error fetch movie detail: \(error?.errorDescription ?? "")")
                completion(nil)
            }
        }
    }
    
}
