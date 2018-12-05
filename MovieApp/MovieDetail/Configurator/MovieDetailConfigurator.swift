import UIKit

final class MovieDetailConfigurator {
  private init() {}
  static let shared = MovieDetailConfigurator()
  func configure(viewController: MovieDetailViewController){
    let router = MovieDetailRouter(viewController: viewController)
    let presenter = MovieDetailPresenter(output: viewController)
    let interactor = MovieDetailInteractor(output: presenter)
    
    viewController.output = interactor
    viewController.router = router
    
  }
}
