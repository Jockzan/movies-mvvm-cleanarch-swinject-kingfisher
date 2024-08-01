//
//  MovieVideosMappers.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

import Foundation

extension MovieVideosModel {
    func toMovieVideos() -> MovieVideos {
        return MovieVideos(
            id: self.id,
            results: self.results.map { $0.toVideo() }
        )
    }
}

extension VideoModel {
    func toVideo() -> Video {
        return Video(
            id: self.id,
            name: self.name,
            key: self.key,
            site: self.site,
            size: self.size,
            type: self.type,
            official: self.official,
            publishedAt: self.publishedAt,
            iso6391: self.iso6391,
            iso31661: self.iso31661
        )
    }
}
