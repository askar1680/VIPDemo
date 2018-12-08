import UIKit

class MovieItemView: BaseView {
  
  let imageView = AsyncImageView()
  let nameLabel = UILabel()
  let originalNameLabel = UILabel()
  let genresLabel = UILabel()
  let voteAverageLabel = UILabel()
  
  var viewModel: MovieViewModel? {
    didSet {
      nameLabel.text = viewModel?.title
      originalNameLabel.text = viewModel?.getOriginalNameWithReleaseDate()
      genresLabel.text = viewModel?.getGenres()
      voteAverageLabel.attributedText = viewModel?.getVoteAverageWithPopularity()
      imageView.image = nil
      if let posterImage = viewModel?.posterImage{
        imageView.image = posterImage
      }
//      if let imageUrl = viewModel?.posterPath {
//        let url = "\(TmdbAPI.posterPath)\(imageUrl)"
//        imageView.downloadImageFrom(urlString: url)
//      }
    }
  }
  
  private struct Constants {
    static let titleMarginStart: CGFloat = 8.0
    static let titleMarginTop: CGFloat = 8.0
    static let subtitileMarginTop: CGFloat = 4.0
    static let voteAverageMarginTop: CGFloat = 8.0
    
    static let imageMargin: CGFloat = 2.0
    static let imageHeight: CGFloat = MoviesView.Constants.rowHeight - 2 * Constants.imageMargin - 2 * MovieTVCell.Constants.marginTop
    
    static let imageWidth = 2 / 3 * Constants.imageHeight
  }
  
  override func setup() {
    super.setup()
    
    
    imageView.contentMode = .scaleAspectFill
    imageView.backgroundColor = .lightGray
    imageView.clipsToBounds = true
    addSubview(imageView)
    
    nameLabel.textColor = .black
    nameLabel.font =  UIFont.boldSystemFont(ofSize: 12)
    addSubview(nameLabel)
    
    originalNameLabel.textColor = .black
    originalNameLabel.font = UIFont.systemFont(ofSize: 12)
    addSubview(originalNameLabel)
    
    genresLabel.textColor = .darkGray
    genresLabel.font = UIFont.systemFont(ofSize: 12)
    addSubview(genresLabel)
    
    addSubview(voteAverageLabel)
  }
  
  override func setupConstraints() {
    super.setupConstraints()
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.imageMargin).isActive = true
    imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.imageMargin).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: Constants.imageWidth).isActive = true
    
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: Constants.titleMarginTop).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,
                                        constant: Constants.titleMarginStart).isActive = true
    nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.titleMarginStart).isActive = true
    
    
    
    originalNameLabel.translatesAutoresizingMaskIntoConstraints = false
    originalNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,
                                           constant: Constants.subtitileMarginTop).isActive = true
    originalNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
    originalNameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
    
    genresLabel.translatesAutoresizingMaskIntoConstraints = false
    genresLabel.topAnchor.constraint(equalTo: originalNameLabel.bottomAnchor,
                                     constant: Constants.subtitileMarginTop).isActive = true
    genresLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
    genresLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
    
    
    
    voteAverageLabel.translatesAutoresizingMaskIntoConstraints = false
    voteAverageLabel.topAnchor.constraint(equalTo: genresLabel.bottomAnchor,
                                     constant: Constants.voteAverageMarginTop).isActive = true
    voteAverageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
    voteAverageLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
    
    
  }
}
