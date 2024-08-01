//
//  MoviesRepositoryImpl.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

class MoviesRepositoryImpl: MoviesRepository {
    private let api: Api
    
    init(api: Api) {
        self.api = api
    }
    
    func getNowPlayingMovies(page: Int, completion: @escaping (Result<MovieList, Error>) -> Void) {
        api.fetchNowPlayingMovies(page: page) { response in
            switch response {
            case .success(let movieResponse):
                completion(.success(movieResponse.toMovieList()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getUpcomingMovies(page: Int, completion: @escaping (Result<MovieList, Error>) -> Void) {
        api.fetchUpcomingMovies(page: page) { response in
            switch response {
            case .success(let movieResponse):
                completion(.success(movieResponse.toMovieList()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieList, Error>) -> Void) {
        api.fetchTopRatedMovies(page: page) { response in
            switch response {
            case .success(let movieResponse):
                completion(.success(movieResponse.toMovieList()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getPopularMovies(page: Int, completion: @escaping (Result<MovieList, Error>) -> Void) {
        api.fetchPopularMovies(page: page) { response in
            switch response {
            case .success(let movieResponse):
                completion(.success(movieResponse.toMovieList()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
