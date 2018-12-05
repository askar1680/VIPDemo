import UIKit

protocol MovieDetailPresenterOutput: AnyObject {
  func displayMovieDetail(viewModel: MovieDetailViewModel)
  func displayError(error: Error)
}

class MovieDetailPresenter {
  private weak var output: MovieDetailPresenterOutput?
  
  init(output: MovieDetailPresenterOutput) {
    self.output = output
  }
}

extension MovieDetailPresenter: MovieDetailInteractorOutput{
  func presentMovieDetail(md: MovieDetail) {
    let viewModel = MovieDetailViewModel(id: md.id, title: md.title, original_title: md.original_title,
                                         vote_average: md.vote_average, vote_count: md.vote_count,
                                         overview: md.overview, popularity: md.popularity,
                                         backdrop_path: md.backdrop_path, poster_path: md.poster_path)
    output?.displayMovieDetail(viewModel: viewModel)
  }
  
  func presentError(error: Error) {
    output?.displayError(error: error)
  }
}
