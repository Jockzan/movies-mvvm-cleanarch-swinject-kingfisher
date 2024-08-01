//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 7/31/24.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    let viewModel = container.resolve(MoviesViewModel.self)!
    var body: some Scene {
        WindowGroup {
            MoviesView(viewModel: viewModel)
        }
    }
}
