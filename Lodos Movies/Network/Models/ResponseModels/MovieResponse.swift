//
//  MovieResponse.swift
//  Lodos Movies
//
//  Created by Tuğrul on 14.03.2024.
//

import Foundation

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

// MARK: - Rating

struct MovieDetailResponse: Codable {
    var title, year, rated, released: String
    var runtime, genre, director, writer: String
    var actors, plot, language, country: String
    var awards, poster: String
    var ratings: [Rating]
    var metascore, imdbRating, imdbVotes, imdbID: String
    var type, dvd, boxOffice, production: String
    var website, response: String

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
        case website = "Website"
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
