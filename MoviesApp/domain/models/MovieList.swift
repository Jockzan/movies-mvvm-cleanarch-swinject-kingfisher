//
//  Movie.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 7/31/24.
//

import Foundation

struct MovieList: Identifiable {
    var id: String
    var dates: Dates?
    var page: Int
    var results: [Movie]
    var totalPages: Int
    var totalResults: Int
}

struct Dates: Identifiable {
    var id: String
    var maximum: String
    var minimum: String
}

struct Movie: Identifiable {
    var id: Int
    var overview: String
    var popularity: Double
    var title: String
    var video: Bool
    var adult: Bool
    var backdropPath: String?
    var genreIds: [Int]
    var originalLanguage: String
    var originalTitle: String
    var posterPath: String?
    var releaseDate: String
    var voteAverage: Double
    var voteCount: Int
}


