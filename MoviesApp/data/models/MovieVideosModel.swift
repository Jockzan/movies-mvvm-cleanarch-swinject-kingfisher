//
//  MovieVideosModel.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

import Foundation

struct MovieVideosModel: Decodable {
    let id: Int
    let results: [VideoModel]
}

struct VideoModel: Decodable {
    let id: String
    let name: String
    let key: String
    let site: String
    let size: Int
    let type: String
    let official: Bool
    let publishedAt: String
    let iso6391: String
    let iso31661: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case key
        case site
        case size
        case type
        case official
        case publishedAt = "published_at"
        case iso6391 = "iso_639_1"
        case iso31661 = "iso_3166_1"
    }
}
