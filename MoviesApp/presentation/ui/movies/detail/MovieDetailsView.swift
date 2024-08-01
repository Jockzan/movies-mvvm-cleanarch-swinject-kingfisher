//
//  MovieDetail.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 7/31/24.
//

import SwiftUI
import Kingfisher
import UIKit

struct MovieDetailsView: View {
    @StateObject private var viewModel: MovieDetailsViewModel
    
    let movieId: Int
    
    init(viewModel: MovieDetailsViewModel, movieId: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.movieId = movieId
    }
    
    var body: some View {
        VStack {
            if let details = viewModel.movieDetails {
                KFImage(URL(string: Constants.imageBaseURL + (details.backdropPath ?? "")))
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                    
                ScrollView {
                    VStack {
                        Text(details.title)
                            .font(.title2)
                            .padding()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if let tagline = details.tagline {
                            Text(tagline)
                                .font(.body)
                                .padding(.horizontal)
                                .italic()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                        }
                        
                        Text(details.overview)
                            .font(.body)
                            .padding()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        
                        if let videos = viewModel.movieVideos {
                            if !videos.isEmpty {
                                Text("Trailers:")
                                    .font(.title3)
                                    .padding(.horizontal)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                
                                MoviesPreviewContent(videos: videos)
                            }
                        }
                        
                        if !details.genres.isEmpty {
                            Text("Genre:")
                                .font(.title3)
                                .padding(.horizontal)
                                .padding(.top)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            
                            Text(details.genres.map{$0.name}.joined(separator: ", "))
                                .font(.callout)
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            
                        }

                        Text("Release Date:")
                            .font(.title3)
                            .padding(.horizontal)
                            .padding(.top)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        
                        Text(details.releaseDate.convertToMediumDateFormat())
                            .font(.callout)
                            .padding(.horizontal)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        
                        if !details.productionCompanies.isEmpty {
                            MoviesProductionCompaniesContent(companies: details.productionCompanies)
                        }
                        
                        let movPost = Constants.imageBaseURL + (details.posterPath ?? "")
                        KFImage(URL(string: movPost))
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width)
                            .clipped()
                        
                        Spacer()
                    }
                }
                .scrollIndicators(.hidden)
            } else {
                ProgressView()
            }
        }
        .padding(.top)
        .background(Color.black)
        .onAppear {
            viewModel.getMovieDetails(movieId: movieId)
            viewModel.getMovieVideos(movieId: movieId)
        }
    }
}

struct MoviesProductionCompaniesContent: View {
    let companies: [ProductionCompany]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 8) {
                ForEach(companies) { company in
                    let previewImage = Constants.imageBaseURL + (company.logoPath ?? "")
                            KFImage(URL(string: previewImage))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipped()
                                .colorInvert()
                                .background(Color.black)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct MoviesPreviewContent: View {
    let videos: [Video]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 8) {
                ForEach(videos) { video in
                    let previewImage = Constants.youtubeImagePre + video.key + Constants.youtubeImagePost
                    Button(action: {
                        openYouTube(videoId: video.key)
                    }) {
                        VStack(alignment: .center, spacing: 8) {
                            KFImage(URL(string: previewImage))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 80)
                                .clipped()
                            
                            Text(video.name)
                                .font(.footnote)
                                .foregroundColor(.white)
                                .frame(width: 100, alignment: .center)
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

func openYouTube(videoId: String) {
    let youtubeURL = URL(string: Constants.youtubeURL + videoId)!
    let youtubeAppURL = URL(string: "vnd.youtube://\(videoId)")!
    
    if UIApplication.shared.canOpenURL(youtubeAppURL) {
        UIApplication.shared.open(youtubeAppURL, options: [:], completionHandler: nil)
    } else {
        UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
    }
}

//struct MovieDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsView(movieId: 123)
//    }
//}
