//
//  ContentView.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 7/31/24.
//

import SwiftUI
import Kingfisher

struct MoviesView: View {
    @StateObject private var viewModel: MoviesViewModel
    
    
    init(viewModel: MoviesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            ScrollView() {
                LazyVStack {
                    MovieCategory(titulo: "Now Playing", movies: viewModel.nowPlayingMovies ?? [])
                    MovieCategory(titulo: "Upcoming", movies: viewModel.upcomingMovies ?? [])
                    MovieCategory(titulo: "Top Rated", movies: viewModel.topRatedMovies ?? [])
                    MovieCategory(titulo: "Popular", movies: viewModel.popularMovies ?? [])
                }
            }
            .padding(.top)
            .scrollIndicators(.hidden)
            .background(Color.black)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            viewModel.fetchMovies()
        }
    }
}

struct MovieCategory: View {
    
    let titulo: String
    let movies: [Movie]
    
    var body: some View {
        VStack {
            Text(titulo)
                .font(.title2)
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            MoviesContent(movies: movies)
        }
    }
}

struct MoviesContent: View {
    let movies: [Movie]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(movies) { movie in
                    NavigationLink {
                        let viewModel = container.resolve(MovieDetailsViewModel.self)!
                        MovieDetailsView(viewModel: viewModel, movieId: movie.id)
                    } label: {
                        let imageUrl = Constants.imageBaseURL + (movie.posterPath ?? "")
                        KFImage(URL(string: imageUrl))
                            .resizable()
                            .placeholder{
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 150)
                                    .foregroundColor(.gray)
                            }
                            .retry(maxCount: 3)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 150)
                            .clipped()
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

//struct MoviesView_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviesView()
//    }
//}



