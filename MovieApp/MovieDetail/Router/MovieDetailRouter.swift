import UIKit

protocol MovieDetailRouterProtocol {
  var viewController: MovieDetailViewController? { get }
}

final class MovieDetailRouter {
  weak var viewController: MovieDetailViewController?
  init(viewController: MovieDetailViewController) {
    self.viewController = viewController
  }
}

extension MovieDetailRouter: MovieDetailRouterProtocol {
  
}
