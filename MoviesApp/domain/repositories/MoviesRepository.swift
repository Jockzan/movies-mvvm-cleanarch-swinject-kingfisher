//
//  MoviesRepository.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

protocol MoviesRepository {
    func getNowPlayingMovies(page: Int, completion: @escaping (Result<MovieList, any Error>) -> Void)
    func getUpcomingMovies(page: Int, completion: @escaping (Result<MovieList, any Error>) -> Void)
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieList, any Error>) -> Void)
    func getPopularMovies(page: Int, completion: @escaping (Result<MovieList, any Error>) -> Void)
}
