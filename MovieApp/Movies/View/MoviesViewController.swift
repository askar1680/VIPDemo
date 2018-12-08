import UIKit

protocol MoviesViewControllerOutput {
  var movies: [Movie] { get }
  func fetchMovies(page: Int)
}

extension MoviesViewController: MoviesPresenterOutput{
  func display(image: UIImage?, at index: Int) {
    moviesViewModels[index].posterImage = image
    UIView.performWithoutAnimation {
      moviesView.tableView.reloadRows(at: [IndexPath.init(row: index, section: 0)], with: UITableView.RowAnimation.none)
    }
  }
  
  func displayMovies(viewModels: [MovieViewModel]) {
    moviesViewModels += viewModels
    moviesView.tableView.reloadData()
  }
  
  func displayError(viewModel: ErrorViewModel) {
    presentError(viewModel: viewModel)
  }
}

class MoviesViewController: UIViewController, ErrorPresenter{
  var output: MoviesViewControllerOutput!
  var router: MoviesRouterProtocol!
  let moviesView = MoviesView()
  var page = 1
  var moviesViewModels: [MovieViewModel] = []
  init(configurator: MoviesConfigurator = MoviesConfigurator.sharedInstance) {
    super.init(nibName: nil, bundle: nil)
    configure(configurator: configurator)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure(configurator: MoviesConfigurator = MoviesConfigurator.sharedInstance) {
    configurator.configure(viewController: self)
  }
  
  override func loadView() {
    view = moviesView
    moviesView.spinner.startAnimating()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTitle()
    setupTableView()
    fetchMovies(page: page)
  }
  private func setupTitle() {
    title = Strings.Movies.screenTitle
  }
  
  private func setupTableView() {
    moviesView.tableView.delegate = self
    moviesView.tableView.dataSource = self
    moviesView.tableView.register(MovieTVCell.self)
  }
  
  func fetchMovies(page: Int) {
    output.fetchMovies(page: page)
  }
}

extension MoviesViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return moviesViewModels.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: MovieTVCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
    let viewModel = moviesViewModels[indexPath.row]
    cell.viewModel = viewModel
    return cell
  }
}

extension MoviesViewController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    if let id = moviesViewModels[indexPath.row].id{
      router.navigateToMovie(id: id)
    }
  }
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if (indexPath.row+1 == moviesViewModels.count){
      page+=1
      fetchMovies(page: page)
    }
  }
  
}

