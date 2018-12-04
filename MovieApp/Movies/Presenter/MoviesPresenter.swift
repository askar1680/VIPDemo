import UIKit


protocol MoviesPresenterOutput: AnyObject {
  func displayMovies(viewModels: [MovieViewModel])
  func displayError(viewModel: ErrorViewModel)
}

final class MoviesPresenter {
  
  private weak var output: MoviesPresenterOutput?
  
  init(output: MoviesPresenterOutput) {
    
    self.output = output
  }
}

extension MoviesPresenter: MoviesInteractorOutput {
  func presentMovies(movies: [Movie]) {
    let viewModels = movies.compactMap { movie -> MovieViewModel in
      return MovieViewModel(id: movie.id, title: movie.title, original_title: movie.original_title,
                            release_date: movie.release_date,
                            imageURL: movie.poster_path, genre_ids: movie.genre_ids,
                            vote_average: movie.vote_average, popularity: movie.popularity)
    }
    output?.displayMovies(viewModels: viewModels)
  }
  
  func presentError(error: Error) {
    let errorViewModel = ErrorViewModel(title: Strings.Error.genericTitle,
                                        message: Strings.Error.genericMessage,
                                        buttonTitles: [Strings.Error.okButtonTitle])
    output?.displayError(viewModel: errorViewModel)
  }
}


enum MoviesError: Error {
  case generic
  case invalidURL
  case invalidResponse
}
