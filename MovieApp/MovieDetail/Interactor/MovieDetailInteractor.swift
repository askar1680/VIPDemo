import UIKit

protocol MovieDetailInteractorOutput {
  func presentMovieDetail(md: MovieDetail)
  func presentError(error: Error)
}

class MovieDetailInteractor {
  let output: MovieDetailInteractorOutput
  let worker: MovieDetailWorker
  var movieDetail: MovieDetail?
  init(output: MovieDetailInteractorOutput, worker: MovieDetailWorker = MovieDetailWorker()) {
    self.output = output
    self.worker = worker
  }
}

extension MovieDetailInteractor: MovieDetailViewControllerOutput {
  func fetchMovieDetail(id: Int) {
    worker.fetchMovieDetail(id: id) { [weak self] (movieDetail, error) in
      if let strongSelf = self{
        if let error = error {
          strongSelf.output.presentError(error: error)
        }
        if let movieDetail = movieDetail{
          strongSelf.output.presentMovieDetail(md: movieDetail)
          strongSelf.movieDetail = movieDetail
        }
      }
      
    }
  }
}
