//
//  Container.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

import Swinject

let container = Container() { container in
    container.register(Api.self) { _ in
        return ApiClient()
    }
    
    container.register(MoviesRepository.self) { resolver in
        let api = resolver.resolve(Api.self)!
        return MoviesRepositoryImpl(api: api)
    }
    
    container.register(DetailsRepository.self) { resolver in
        let api = resolver.resolve(Api.self)!
        return DetailsRepositoryImpl(api: api)
    }
    
    container.register(MoviesViewModel.self) { resolver in
        let moviesRepository = resolver.resolve(MoviesRepository.self)!
        return MoviesViewModel(moviesRepository: moviesRepository)
    }
    
    container.register(MovieDetailsViewModel.self) { resolver in
        let detailsRepository = resolver.resolve(DetailsRepository.self)!
        return MovieDetailsViewModel(detailsRepository: detailsRepository)
    }
}
