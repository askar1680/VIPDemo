import UIKit

protocol MovieDetailViewControllerOutput {
  func fetchMovieDetail(id: Int)
  var movieDetail: MovieDetail? { get }
}


extension MovieDetailViewController: MovieDetailPresenterOutput, ErrorPresenter {
  func displayError(viewModel: ErrorViewModel) {
    presentError(viewModel: viewModel)
  }
  func displayMovieDetail(viewModel: MovieDetailViewModel) {
    self.viewModel = viewModel
    movieDetailView.tableView.reloadData()
  }
}

class MovieDetailViewController: UIViewController {
  
  let movieDetailView = MovieDetailView()
  var output: MovieDetailViewControllerOutput!
  var router: MovieDetailRouter!
  var id: Int? {
    didSet{
      if let id = id{
        output.fetchMovieDetail(id: id)
      }
    }
  }
  
  private var viewModel: MovieDetailViewModel?
  
  override func loadView() {
    view = movieDetailView
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
    setupNavigationBar()
    setupTableView()
  }
  
  private func setupTableView(){
    movieDetailView.tableView.delegate = self
    movieDetailView.tableView.dataSource = self
    movieDetailView.tableView.register(MovieDetailHeaderInfoTVCell.self)
  }
  
  private func setupNavigationBar(){
    title = Strings.Movie.screenTitle
    
    let backButton = UIBarButtonItem()
    navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    navigationController?.navigationBar.tintColor = .darkGray
  }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: MovieDetailHeaderInfoTVCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
    cell.viewModel = viewModel
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 1 {
      
    }
    return UITableView.automaticDimension
  }
}



