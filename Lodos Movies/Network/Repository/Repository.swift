//
//  Repository.swift
//  Lodos Movies
//
//  Created by Tuğrul on 14.03.2024.
//

import Foundation

protocol Repository { }

extension Repository {
    
    func getObject<T: Decodable>(data: Data) -> T? {
        
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
