//
//  MovieDetailsModel.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

import Foundation

struct MovieDetailsModel: Decodable {
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
    let genres: [GenreModel]
    let homepage: String?
    let backdropPath: String?
    let belongsToCollection: CollectionModel?
    let imdbId: String?
    let originCountry: [String]
    let originalLanguage: String
    let originalTitle: String
    let posterPath: String?
    let productionCompanies: [ProductionCompanyModel]
    let productionCountries: [ProductionCountryModel]
    let releaseDate: String
    let spokenLanguages: [SpokenLanguageModel]
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case popularity
        case revenue
        case runtime
        case status
        case tagline
        case title
        case video
        case adult
        case budget
        case genres
        case homepage
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case imdbId = "imdb_id"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case spokenLanguages = "spoken_languages"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct CollectionModel: Decodable {
    let id: Int
    let name: String
    let posterPath: String?
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

struct GenreModel: Decodable {
    let id: Int
    let name: String
}

struct ProductionCompanyModel: Decodable {
    let id: Int
    let name: String
    let logoPath: String?
    let originCountry: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}

struct ProductionCountryModel: Decodable {
    let name: String
    let iso: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case iso = "iso_3166_1"
    }
}

struct SpokenLanguageModel: Decodable {
    let name: String
    let englishName: String
    let iso: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case englishName = "english_name"
        case iso = "iso_639_1"
    }
}

