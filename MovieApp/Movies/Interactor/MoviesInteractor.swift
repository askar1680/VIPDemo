import UIKit

protocol MoviesInteractorOutput {
  func presentMovies(movies: [Movie])
  func presentError(error: Error)
}

final class MoviesInteractor {
  
  let output: MoviesInteractorOutput
  let worker: MoviesWorker
  
  var movies: [Movie]?
  
  init(output: MoviesInteractorOutput, worker: MoviesWorker = MoviesWorker()) {
    self.output = output
    self.worker = worker
    
  }
}

extension MoviesInteractor: MoviesViewControllerOutput {
  func fetchMovies(page: Int) {
    worker.fetchMovies(page: page) { [weak self] movies, error in
      if let strongSelf = self {
        if let artistsError = error {
          strongSelf.output.presentError(error: artistsError)
        } else if let moviesArray = movies {
          strongSelf.movies = moviesArray
          strongSelf.output.presentMovies(movies: moviesArray)
        }
      }
    }
  }
}
