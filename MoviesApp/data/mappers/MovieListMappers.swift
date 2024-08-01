//
//  MovieListMappers.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

import Foundation

extension MovieListModel {
    func toMovieList() -> MovieList {
        return MovieList(
            id: UUID().uuidString,
            dates: self.dates.map { $0.toDates() },
            page: self.page,
            results: self.results.map { $0.toMovie() },
            totalPages: self.totalPages,
            totalResults: self.totalResults
        )
    }
}

extension DatesModel {
    func toDates() -> Dates {
        return Dates(
            id: UUID().uuidString,
            maximum: self.maximum,
            minimum: self.minimum
        )
    }
}

extension MovieModel {
    func toMovie() -> Movie {
        return Movie(
            id: self.id,
            overview: self.overview,
            popularity: self.popularity,
            title: self.title,
            video: self.video,
            adult: self.adult,
            backdropPath: self.backdropPath,
            genreIds: self.genreIds,
            originalLanguage: self.originalLanguage,
            originalTitle: self.originalTitle,
            posterPath: self.posterPath,
            releaseDate: self.releaseDate,
            voteAverage: self.voteAverage,
            voteCount: self.voteCount
        )
    }
}
