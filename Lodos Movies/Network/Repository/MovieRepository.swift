//
//  MovieRepository.swift
//  Lodos Movies
//
//  Created by Tuğrul on 14.03.2024.
//

protocol MovieRepositoryLogic: Repository {
    func fetchMovies(movieTitle text: String, completion: @escaping  (MovieResponse?) -> Void)
    func fetchMovieDetail(movieID id: String)
}

class MovieRepository: MovieRepositoryLogic {
    
    static let shared = MovieRepository()
    private init() { }
    
    private var baseUrl = "https://www.omdbapi.com/?s="
    
    func fetchMovies(movieTitle text: String, completion: @escaping (MovieResponse?) -> Void) {
        
        
        let responseUrl = baseUrl + text.lowercased().replacingOccurrences(of: " ", with: "+") + "&apikey=\(NetworkConstant.apiKey)"
        
        LoodosMoviesService.shared.get(url: responseUrl) { response, error in
            if let response = response, let movies: MovieResponse = self.getObject(data: response) {
               completion(movies)
            } else {
                print("Error fetch movies: \(error?.errorDescription ?? "")")
                completion(nil)
            }
        }
    }
    
    func fetchMovieDetail(movieID id: String) {
        
        
    }
    
}