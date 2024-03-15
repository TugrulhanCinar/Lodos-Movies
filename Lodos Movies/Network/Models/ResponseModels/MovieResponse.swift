//
//  MovieResponse.swift
//  Lodos Movies
//
//  Created by Tuğrul on 14.03.2024.
//

import Foundation
import UIKit

// MARK: - MovieResponse

struct MovieResponse: Codable {
    var search: [Search]
    var totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search

struct Search: Codable {
    var title, year, imdbID, type: String
    var poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

// MARK: - MovieDetailResponse

struct MovieDetailResponse: Codable {
    var title, year, rated, released: String?
    var runtime, genre, director, writer: String?
    var actors, plot, language, country: String?
    var awards, poster: String?
    var ratings: [Rating]
    var metascore, imdbRating, imdbVotes, imdbID: String?
    var type, dvd, boxOffice, production: String?
    var response: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case response = "Response"
    }
}

// MARK: - Rating

struct Rating: Codable {
    var source, value: String

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}


// MARK: - MovieDetailResponse

extension MovieDetailResponse {
    
    func toAttributedString() -> NSAttributedString {
        let attributedString = NSMutableAttributedString()

        func append(key: String, value: String?) {
            
            guard let value = value else { return }
            let boldAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: FontSizeConstant.mediumFontSize)]
            let italicAttributes = [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: FontSizeConstant.mediumFontSize)]

            attributedString.append(NSAttributedString(string: "\n"))
            let keyString = NSAttributedString(string: "\(key): ", attributes: boldAttributes)
            let valueString = NSAttributedString(string: "\(value)\n", attributes: italicAttributes)

            attributedString.append(keyString)
            attributedString.append(valueString)
            
        }

        append(key: MovieDetailResponseKeys.metascore, value: self.metascore)
        append(key: MovieDetailResponseKeys.imdbRating, value: self.imdbRating)
        append(key: MovieDetailResponseKeys.imdbVotes, value: self.imdbVotes)
        append(key: MovieDetailResponseKeys.type, value: self.type)
        append(key: MovieDetailResponseKeys.type, value: self.dvd)
        append(key: MovieDetailResponseKeys.boxOffice, value: self.boxOffice)
        append(key: MovieDetailResponseKeys.production, value: self.production)
        append(key: MovieDetailResponseKeys.response, value: self.response)
        self.ratings.forEach { rating in
            append(key: rating.source, value: rating.value)
        }


        return attributedString
    }
}


class MovieDetailResponseKeys {
    static var metascore = "Metascore"
    static var imdbRating = "IMDB Rating"
    static var imdbVotes = "IMDB Votes"
    static var type = "Type"
    static var dvd = "DVD"
    static var boxOffice = "Box Office"
    static var production = "Production"
    static var response = "Response"
}
