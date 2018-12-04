import UIKit

final class MoviesView: BaseView{
  
  
  
  let tableView = UITableView()
  let spinner = UIActivityIndicatorView.init(style: .gray)
  
  struct Constants {
    static let rowHeight: CGFloat = 100
  }
  
  
  override func setup() {
    super.setup()
    setupTableView()
  }
  
  private func setupTableView() {
    
    tableView.rowHeight = Constants.rowHeight
    
    spinner.frame = CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: Constants.rowHeight/2)
    spinner.color = UIColor.darkGray
    spinner.hidesWhenStopped = true
    
    tableView.tableFooterView = spinner
    addSubview(tableView)
  }
  
  override func setupConstraints() {
    super.setupConstraints()
    setupTableViewConstraints()
  }
  
  private func setupTableViewConstraints() {
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
}
