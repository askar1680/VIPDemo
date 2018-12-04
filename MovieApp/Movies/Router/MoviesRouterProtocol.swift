import UIKit

protocol MoviesRouterProtocol {
  var viewController: MoviesViewController? { get }
  func navigateToMovie(atIndexPath indexPath: IndexPath, animated: Bool)
}

final class MoviesRouter {
  weak var viewController: MoviesViewController?
  init(viewController: MoviesViewController) {
    self.viewController = viewController
  }
}

extension MoviesRouter: MoviesRouterProtocol {
  func navigateToMovie(atIndexPath indexPath: IndexPath, animated: Bool = false) {
    // Go to detail
    
  }
}

