//
//  ServiceClient.swift
//  Lodos Movies
//
//  Created by Tuğrul on 14.03.2024.
//

import Alamofire
import Foundation

protocol MovieService {
    
    func get(url: String, completion: @escaping ResponseClosure)
    func post()
}

typealias ResponseClosure = (_ response: Data?, _ error: AFError?) -> Void


class LoodosMoviesService: MovieService {
    
    static let shared = LoodosMoviesService()
    private init() { }
    
    func get(url: String, completion: @escaping ResponseClosure) {
        
        AF.request(url, method: .get).response { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func post() { }
}
