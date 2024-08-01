//
//  MovieDetails.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 7/31/24.
//

import Foundation

struct MovieDetails: Identifiable {
    let id: Int
    let overview: String
    let popularity: Double
    let revenue: Int64
    let runtime: Int
    let status: String
    let tagline: String?
    let title: String
    let video: Bool
    let adult: Bool
    let budget: Int
    let genres: [Genre]
    let homepage: String?
    let backdropPath: String?
    let belongsToCollection: Collection?
    let imdbId: String?
    let originCountry: [String]
    let originalLanguage: String
    let originalTitle: String
    let posterPath: String?
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let spokenLanguages: [SpokenLanguage]
    let voteAverage: Double
    let voteCount: Int
}

struct Collection: Identifiable {
    let id: Int
    let name: String
    let posterPath: String?
    let backdropPath: String?
}

struct Genre: Identifiable {
    let id: Int
    let name: String
}

struct ProductionCompany: Identifiable {
    let id: Int
    let name: String
    let logoPath: String?
    let originCountry: String
}

struct ProductionCountry: Identifiable {
    let id: String
    let name: String
    let iso: String
}

struct SpokenLanguage: Identifiable {
    let id: String
    let name: String
    let englishName: String
    let iso: String
}
