import UIKit

final class MoviesConfigurator {
  
  static let sharedInstance = MoviesConfigurator()
  
  func configure(viewController: MoviesViewController) {
    
    let router = MoviesRouter(viewController: viewController)
    let presenter = MoviesPresenter(output: viewController)
    let interactor = MoviesInteractor(output: presenter)
    
    viewController.output = interactor
    viewController.router = router
  }
}
