//
//  File.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 7/31/24.
//

import Foundation

struct MovieVideos: Identifiable {
    let id: Int
    let results: [Video]
}

struct Video: Identifiable {
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
}
