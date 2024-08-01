//
//  ApiClient.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

import Alamofire

class ApiClient: Api {
    func fetchNowPlayingMovies(page: Int, completion: @escaping (Result<MovieListModel, any Error>) -> Void) {
        let url = "\(Constants.baseURL)now_playing"
        let parameters: Parameters = ["page": page]
        let headers: HTTPHeaders = ["Authorization": "Bearer \(Secrets.shared.value(forKey: "API_TOKEN") ?? "")"]
        
        AF.request(url, parameters: parameters, headers: headers).responseDecodable(of: MovieListModel.self) { response in
            switch response.result {
            case .success(let moviesResponse):
                completion(.success(moviesResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchUpcomingMovies(page: Int, completion: @escaping (Result<MovieListModel, any Error>) -> Void) {
        let url = "\(Constants.baseURL)upcoming"
        let parameters: Parameters = ["page": page]
        let headers: HTTPHeaders = ["Authorization": "Bearer \(Secrets.shared.value(forKey: "API_TOKEN") ?? "")"]
        
        AF.request(url, parameters: parameters, headers: headers).responseDecodable(of: MovieListModel.self) { response in
            switch response.result {
            case .success(let moviesResponse):
                completion(.success(moviesResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchTopRatedMovies(page: Int, completion: @escaping (Result<MovieListModel, any Error>) -> Void) {
        let url = "\(Constants.baseURL)top_rated"
        let parameters: Parameters = ["page": page]
        let headers: HTTPHeaders = ["Authorization": "Bearer \(Secrets.shared.value(forKey: "API_TOKEN") ?? "")"]
        
        AF.request(url, parameters: parameters, headers: headers).responseDecodable(of: MovieListModel.self) { response in
            switch response.result {
            case .success(let moviesResponse):
                completion(.success(moviesResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchPopularMovies(page: Int, completion: @escaping (Result<MovieListModel, any Error>) -> Void) {
        let url = "\(Constants.baseURL)popular"
        let parameters: Parameters = ["page": page]
        let headers: HTTPHeaders = ["Authorization": "Bearer \(Secrets.shared.value(forKey: "API_TOKEN") ?? "")"]
        
        AF.request(url, parameters: parameters, headers: headers).responseDecodable(of: MovieListModel.self) { response in
            switch response.result {
            case .success(let moviesResponse):
                completion(.success(moviesResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchMovieDetails(id: Int, completion: @escaping (Result<MovieDetailsModel, any Error>) -> Void) {
        let url = Constants.baseURL + String(id)
        let headers: HTTPHeaders = ["Authorization": "Bearer \(Secrets.shared.value(forKey: "API_TOKEN") ?? "")"]
        
        AF.request(url, headers: headers).responseDecodable(of: MovieDetailsModel.self) { response in
            switch response.result {
            case .success(let detailsResponse):
                completion(.success(detailsResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchMovieVideos(id: Int, completion: @escaping (Result<MovieVideosModel, any Error>) -> Void) {
        let url = "\(Constants.baseURL + String(id))/videos"
        let headers: HTTPHeaders = ["Authorization": "Bearer \(Secrets.shared.value(forKey: "API_TOKEN") ?? "")"]
        
        AF.request(url, headers: headers).responseDecodable(of: MovieVideosModel.self) { response in
            switch response.result {
            case .success(let detailsResponse):
                completion(.success(detailsResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
