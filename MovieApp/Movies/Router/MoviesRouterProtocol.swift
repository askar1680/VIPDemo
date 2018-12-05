import UIKit

protocol MoviesRouterProtocol {
  var viewController: MoviesViewController? { get }
  func navigateToMovie(id: Int)
}

final class MoviesRouter {
  weak var viewController: MoviesViewController?
  init(viewController: MoviesViewController) {
    self.viewController = viewController
  }
}

extension MoviesRouter: MoviesRouterProtocol {
  func navigateToMovie(id: Int) {
    let detailController = MovieDetailViewController()
    detailController.id = id
    viewController?.navigationController?.pushViewController(detailController, animated: true)
  }
}

