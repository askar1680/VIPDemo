import UIKit

protocol MovieDetailViewControllerOutput {
  func fetchMovieDetail(id: Int)
  var movieDetail: MovieDetail? { get }
}


extension MovieDetailViewController: MovieDetailPresenterOutput{
  func displayMovieDetail(viewModel: MovieDetailViewModel) {
    print(viewModel.title as Any)
  }
  func displayError(error: Error) {
    
  }
}

class MovieDetailViewController: UIViewController {
  
  var output: MovieDetailViewControllerOutput!
  var router: MovieDetailRouter!
  var id: Int? {
    didSet{
      if let id = id{
        output.fetchMovieDetail(id: id)
      }
    }
  }
  
  init(configurator: MovieDetailConfigurator = MovieDetailConfigurator.shared) {
    super.init(nibName: nil, bundle: nil)
    configure(configurator: configurator)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  private func configure(configurator: MovieDetailConfigurator = MovieDetailConfigurator.shared) {
    configurator.configure(viewController: self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Ch"
    view.backgroundColor = .white
  }
}



