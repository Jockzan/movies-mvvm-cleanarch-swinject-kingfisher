# MovieApp

MovieApp is an iOS application that showcases a list of movies in different categories: Popular, Top Rated, Upcoming, and Now Playing. The application follows the MVVM architecture and Clean Architecture principles to ensure a modular, maintainable, and testable codebase. The app uses modern iOS development tools and libraries, including SwiftUI for the user interface, Swinject for dependency injection, Kingfisher for image caching, and Alamofire for networking.

## Table of Contents

- [Screenshots](#screenshots)
- [Features](#features)
- [Architecture](#architecture)
  - [Data Layer](#data-layer)
  - [Domain Layer](#domain-layer)
  - [Presentation Layer](#presentation-layer)
- [Libraries](#libraries)
- [Setup](#setup)
- [Usage](#usage)

## Screenshots

### Home Screen
![home_screen](https://github.com/user-attachments/assets/7e517938-f0e7-46e9-a40d-7660534738ad)

### Movie Details Screen
![details_screen](https://github.com/user-attachments/assets/8b676d52-03b9-442f-9a30-e308d9d43f2d)

## Features

- Display a list of movies in four categories: Popular, Top Rated, Upcoming, and Now Playing.
- Navigate between screens using SwiftUI's NavigationView.
- Efficient image loading and caching with Kingfisher.
- Dependency injection with Swinject.
- Networking with Alamofire.

## Architecture

The application follows the MVVM (Model-View-ViewModel) architecture pattern and Clean Architecture principles. The project is divided into three main layers: Data, Domain, and Presentation.

### Data Layer

The Data layer is responsible for fetching data from various sources (network, cache, etc.) and providing it to the Domain layer. It includes:

- **API**: Defines the endpoints for the movie API.
- **Mappers**: Maps data from network models to domain models.
- **Models**: Contains the data models used in the Data layer.
- **Repositories**: Provides data to the Domain layer.

#### Example

```swift
// Api.swift
protocol  Api {
  func fetchPopularMovies(page: Int, completion: **@escaping** (Result<MovieListModel, Error>) -> Void)
  // other endpoints...
}

// ApiClient.swift
class ApiClient: Api {
  func fetchPopularMovies(page: Int, completion: @escaping (Result<MovieListModel, any Error>) -> Void) {
    let url = "\(Constants.baseURL)popular"
    let parameters: Parameters = ["page": page]

    AF.request(url, parameters: parameters, headers: headers).responseDecodable(of: MovieListModel.self) { response in
      switch response.result {
        case .success(let moviesResponse):
          completion(.success(moviesResponse))
        case .failure(let error):
          completion(.failure(error))
      }
    }
  }
}
```

### Domain Layer

The Domain layer contains the business logic of the application. It includes:

- **Models**: The core data models used throughout the application.
- **Repositories**: Interfaces that define the methods for data operations.

#### Example

```swift
// MovieListModel.swift
struct  MovieListModel: Decodable {
  let dates: DatesModel?
  let page: Int
  let results: [MovieModel]
  let totalPages: Int
  let totalResults: Int

  enum CodingKeys: String, CodingKey {
    case dates
    case page
    case results
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }
}

// MoviesRepository.swift
protocol MoviesRepository {
  func getPopularMovies(page: Int, completion: @escaping (Result<MovieList, any  Error>) -> Void)
  // other methods...
}
```

### Presentation Layer

The Presentation layer is responsible for displaying data to the user and handling user interactions. It includes:

- **Theme**: Defines the UI theme for the application.
- **UI**: Contains the SwiftUI views for the UI.
- **Utils**: Utility classes and extensions for the UI layer.

#### Example

```swift
// MoviesViewModel.swift
class MoviesViewModel: ObservableObject {
  @Published  var popularMovies: [Movie]?
  private let moviesRepository: MoviesRepository

  init(moviesRepository: MoviesRepository) {
    self.moviesRepository = moviesRepository
  }

  func fetchMovies() {
    getPopularMovies()
  }

  private func getPopularMovies(page: Int = 1) {
    moviesRepository.getPopularMovies(page: page) { [weak  self] result in
      switch result {
        case .success(let movieList):
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

// MoviesView.swift
struct MoviesView: View {
  @StateObject private var viewModel: MoviesViewModel

  init(viewModel: MoviesViewModel) {
    _viewModel = StateObject(wrappedValue: viewModel)
  }

  var body: some View {
    NavigationView {
      ScrollView() {
        LazyVStack {
          MovieCategory(titulo: "Popular", movies: viewModel.popularMovies ?? [])
          // more categories
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
```

## Libraries

- **[SwiftUI](https://developer.apple.com/xcode/swiftui/)**: For building the user interface.
- **[Swinject](https://github.com/Swinject/Swinject)**: For dependency injection.
- **[Kingfisher](https://github.com/onevcat/Kingfisher)**: For image loading and caching.
- **[Alamofire](https://github.com/Alamofire/Alamofire)**: For networking.

## Setup

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/MovieApp.git
   cd MovieApp
   ```

2. Open the project in Xcode.

3. Build the project to install the necessary dependencies.

4. Obtain an API key from [The Movie Database (TMDb)](https://www.themoviedb.org/documentation/api) and add it to a plist file called `Secrets.plist` (do not push this file to the repo):
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
   <dict>
       <key>API_TOKEN</key>
       <string>your_api_key</string>
   </dict>
   </plist>
   ```

5. Create a `Secrets.swift` helper class to access the API key:

   ```swift
   class Secrets {
     static let shared = Secrets()
     private var secrets: [String: Any] = [:]

     private  init() {
       if  let url = Bundle.main.url(forResource: "Secrets", withExtension: "plist") {
         if let data = try? Data(contentsOf: url) {
           secrets = (try? PropertyListSerialization.propertyList(from: data, options: [], format: nil)) as? [String: Any] ?? [:]
         }
       }
     }

     func value(forKey key: String) -> String? {
       return secrets[key] as? String
     }
   }
   ```

6. Run the application on an emulator or physical device.

## Usage

- Launch the app to see the list of movies in different categories.
- Tap on a movie to see its details.
- Navigate back and forth between the movie list and movie details using the navigation links.


