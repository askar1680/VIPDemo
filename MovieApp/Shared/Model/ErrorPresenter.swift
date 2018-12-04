import Foundation
import UIKit

protocol ErrorPresenter {
  func presentError(viewModel: ErrorViewModel)
}

extension ErrorPresenter where Self: UIViewController {
  func presentError(viewModel: ErrorViewModel) {
    let alertController = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
    if let buttonTitles = viewModel.buttonTitles {
      for title in buttonTitles {
        let action = UIAlertAction(title: title, style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(action)
      }
    }
    present(alertController, animated: true, completion: nil)
  }
}
