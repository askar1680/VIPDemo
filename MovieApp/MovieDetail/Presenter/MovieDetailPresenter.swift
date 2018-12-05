import UIKit

protocol MovieDetailPresenterOutput: AnyObject {
  func displayMovieDetail(viewModel: MovieDetailViewModel)
  func displayError(viewModel: ErrorViewModel)
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
                                         backdrop_path: md.backdrop_path, poster_path: md.poster_path,
                                         budget: md.budget, genres: md.genres,
                                         production_companies: md.production_companies,
                                         production_countries: md.production_countries,
                                         spoken_languages: md.spoken_languages,
                                         release_date: md.release_date, revenue: md.revenue, runtime: md.runtime,
                                         status: md.status, tagline: md.tagline)
    
    output?.displayMovieDetail(viewModel: viewModel)
  }
  
  func presentError(error: Error) {
    let errorViewModel = ErrorViewModel(title: Strings.Error.genericTitle,
                                        message: error.localizedDescription,
                                        buttonTitles: [Strings.Error.okButtonTitle])
    output?.displayError(viewModel: errorViewModel)
  }
}
