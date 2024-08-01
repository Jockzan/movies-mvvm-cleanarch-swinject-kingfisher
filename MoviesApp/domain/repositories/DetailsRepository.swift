//
//  DetailsRepository.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

protocol DetailsRepository {
    func getMovieDetails(id: Int, completion: @escaping (Result<MovieDetails, any Error>) -> Void)
    func getMovieVideos(id: Int, completion: @escaping (Result<MovieVideos, any Error>) -> Void)
}
