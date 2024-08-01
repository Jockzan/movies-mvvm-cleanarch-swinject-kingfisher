//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

import Foundation
import Combine

class MovieDetailsViewModel: ObservableObject {
    @Published var movieVideos: [Video]?
    @Published var movieDetails: MovieDetails?
    
    private let detailsRepository: DetailsRepository
    
    init(detailsRepository: DetailsRepository) {
        self.detailsRepository = detailsRepository
    }
    
    func getMovieDetails(movieId: Int = 1) {
        detailsRepository.getMovieDetails(id: movieId) { [weak self] result in
            switch result {
            case.success(let movieDetails):
                DispatchQueue.main.async {
                    self?.movieDetails = movieDetails
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }

    
    func getMovieVideos(movieId: Int = 1) {
        detailsRepository.getMovieVideos(id: movieId) { [weak self] result in
            switch result {
            case.success(let movieVideos):
                DispatchQueue.main.async {
                    self?.movieVideos = movieVideos.results
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
