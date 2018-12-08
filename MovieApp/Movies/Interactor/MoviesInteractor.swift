import UIKit

protocol MoviesInteractorOutput {
  func presentMovies(movies: [Movie])
  func present(image: UIImage?, at index: Int)
  func presentError(error: Error)
}

final class MoviesInteractor {
  
  let output: MoviesInteractorOutput
  let worker: MoviesWorker
  
  var movies: [Movie] = []
  
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
          strongSelf.movies += moviesArray
          strongSelf.output.presentMovies(movies: moviesArray)
          for i in 0..<strongSelf.movies.count {
            strongSelf.fetchMovieImage(movie: strongSelf.movies[i], index: i)
          }
        }
      }
    }
  }
  func fetchMovieImage(movie: Movie, index: Int){
    worker.fetchMovieImage(movie: movie) { [weak self] (data, error) in
      if let strongSelf = self{
        if let data = data{
          strongSelf.output.present(image: UIImage(data: data), at: index)
        }
        else {
          strongSelf.output.present(image: nil, at: index)
        }
      }
    }
  }
  
  
}
