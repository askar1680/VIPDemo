import UIKit

protocol MoviesRouterProtocol {
  var viewController: MoviesViewController? { get }
  func navigateToMovie(atIndexPath indexPath: IndexPath)
}

final class MoviesRouter {
  weak var viewController: MoviesViewController?
  init(viewController: MoviesViewController) {
    self.viewController = viewController
  }
}

extension MoviesRouter: MoviesRouterProtocol {
  func navigateToMovie(atIndexPath indexPath: IndexPath) {
    // Go to detail
    
  }
}

