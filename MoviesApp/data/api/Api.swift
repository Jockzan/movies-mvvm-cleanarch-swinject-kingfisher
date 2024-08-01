//
//  Api.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

protocol Api {
    func fetchNowPlayingMovies(page: Int, completion: @escaping (Result<MovieListModel, Error>) -> Void)
    func fetchUpcomingMovies(page: Int, completion: @escaping (Result<MovieListModel, Error>) -> Void)
    func fetchTopRatedMovies(page: Int, completion: @escaping (Result<MovieListModel, Error>) -> Void)
    func fetchPopularMovies(page: Int, completion: @escaping (Result<MovieListModel, Error>) -> Void)
    func fetchMovieDetails(id: Int, completion: @escaping (Result<MovieDetailsModel, Error>) -> Void)
    func fetchMovieVideos(id: Int, completion: @escaping (Result<MovieVideosModel, Error>) -> Void)
}
