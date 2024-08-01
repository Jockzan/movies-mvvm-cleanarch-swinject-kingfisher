//
//  DetailsRepositoryImpl.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

class DetailsRepositoryImpl: DetailsRepository {
    private let api: Api
    
    init(api: Api) {
        self.api = api
    }
    
    func getMovieDetails(id: Int, completion: @escaping (Result<MovieDetails, any Error>) -> Void) {
        api.fetchMovieDetails(id: id) { response in
            switch response {
            case .success(let detailsResponse):
                completion(.success(detailsResponse.toMovieDetails()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getMovieVideos(id: Int, completion: @escaping (Result<MovieVideos, any Error>) -> Void) {
        api.fetchMovieVideos(id: id) { response in
            switch response {
            case .success(let videosResponse):
                completion(.success(videosResponse.toMovieVideos()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
