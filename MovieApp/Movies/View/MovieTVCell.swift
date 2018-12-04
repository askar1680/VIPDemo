import UIKit

class MovieTVCell: BaseTVCell {
  
  struct Constants {
    
    static let marginStart: CGFloat = 2
    static let marginTop: CGFloat = 0
  }
  
  let itemView = MovieItemView()
  
  var viewModel: MovieViewModel? {
    didSet {
      itemView.viewModel = viewModel
    }
  }
  
  override func setup() {
    super.setup()
    clipsToBounds = true
    setupItemView()
  }
  
  private func setupItemView() {
    contentView.addSubview(itemView)
  }
  
  override func setupConstraints() {
    super.setupConstraints()
    setupItemViewConstraints()
  }
  
  private func setupItemViewConstraints() {
    
    itemView.translatesAutoresizingMaskIntoConstraints = false
    
    itemView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.marginTop).isActive = true
    itemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.marginStart).isActive = true
    itemView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.marginStart).isActive = true
    itemView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.marginTop).isActive = true
  }
  
}
