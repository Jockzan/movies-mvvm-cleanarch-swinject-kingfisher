//
//  MovideDetailsMapper.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

import Foundation

extension MovieDetailsModel {
    func toMovieDetails() -> MovieDetails {
        return MovieDetails(
            id: self.id,
            overview: self.overview,
            popularity: self.popularity,
            revenue: self.revenue,
            runtime: self.runtime,
            status: self.status,
            tagline: self.tagline,
            title: self.title,
            video: self.video,
            adult: self.adult,
            budget: self.budget,
            genres: self.genres.map { $0.toGenre() },
            homepage: self.homepage,
            backdropPath: self.backdropPath,
            belongsToCollection: self.belongsToCollection.map { $0.toCollection() },
            imdbId: self.imdbId,
            originCountry: self.originCountry,
            originalLanguage: self.originalLanguage,
            originalTitle: self.originalTitle,
            posterPath: self.posterPath,
            productionCompanies: self.productionCompanies.map { $0.toProductionCompany() },
            productionCountries: self.productionCountries.map { $0.toProductionCountry() },
            releaseDate: self.releaseDate,
            spokenLanguages: self.spokenLanguages.map { $0.toSpokenLanguageModel() },
            voteAverage: self.voteAverage,
            voteCount: self.voteCount
        )
    }
}

extension CollectionModel {
    func toCollection() -> Collection {
        return Collection(
            id: self.id,
            name: self.name,
            posterPath: self.posterPath,
            backdropPath: self.backdropPath
        )
    }
}

extension GenreModel {
    func toGenre() -> Genre {
        return Genre(
            id: self.id,
            name: self.name
        )
    }
}

extension ProductionCompanyModel {
    func toProductionCompany() -> ProductionCompany {
        return ProductionCompany(
            id: self.id,
            name: self.name,
            logoPath: self.logoPath,
            originCountry: self.originCountry
        )
    }
}

extension ProductionCountryModel {
    func toProductionCountry() -> ProductionCountry {
        return ProductionCountry(
            id: UUID().uuidString,
            name: self.name,
            iso: self.iso
        )
    }
}

extension SpokenLanguageModel {
    func toSpokenLanguageModel() -> SpokenLanguage {
        return SpokenLanguage(
            id: UUID().uuidString,
            name: self.name,
            englishName: self.englishName,
            iso: self.iso
        )
    }
}
