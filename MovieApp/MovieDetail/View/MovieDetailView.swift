import UIKit

class MovieDetailView: BaseView {
  let tableView = UITableView()
 
  override func setup() {
    super.setup()
    
    tableView.separatorStyle = .singleLine
    
    
    addSubview(tableView)
  }
  override func setupConstraints() {
    super.setupConstraints()
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
}
