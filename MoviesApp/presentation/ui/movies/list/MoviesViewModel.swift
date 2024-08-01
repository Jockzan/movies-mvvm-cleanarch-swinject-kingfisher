//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    @Published var nowPlayingMovies: [Movie]?
    @Published var upcomingMovies: [Movie]?
    @Published var topRatedMovies: [Movie]?
    @Published var popularMovies: [Movie]?
    
    private let moviesRepository: MoviesRepository
    
    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }
    
    func fetchMovies() {
        getNowPlayingMovies()
        getUpcomingMovies()
        getTopRatedMovies()
        getPopularMovies()
    }
    
    private func getNowPlayingMovies(page: Int = 1) {
        moviesRepository.getNowPlayingMovies(page: page) { [weak self] result in
            switch result {
            case.success(let movieList):
                DispatchQueue.main.async {
                    self?.nowPlayingMovies = movieList.results
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func getUpcomingMovies(page: Int = 1) {
        moviesRepository.getUpcomingMovies(page: page) { [weak self] result in
            switch result {
            case.success(let movieList):
                DispatchQueue.main.async {
                    self?.upcomingMovies = movieList.results
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func getTopRatedMovies(page: Int = 1) {
        moviesRepository.getTopRatedMovies(page: page) { [weak self] result in
            switch result {
            case.success(let movieList):
                DispatchQueue.main.async {
                    self?.topRatedMovies = movieList.results
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func getPopularMovies(page: Int = 1) {
        moviesRepository.getPopularMovies(page: page) { [weak self] result in
            switch result {
            case.success(let movieList):
                DispatchQueue.main.async {
                    self?.popularMovies = movieList.results
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
