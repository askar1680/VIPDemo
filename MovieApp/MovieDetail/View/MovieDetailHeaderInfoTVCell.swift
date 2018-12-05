import UIKit

class MovieDetailHeaderInfoTVCell: BaseTVCell {
  
  private let postImageView = AsyncImageView()
  private let nameLabel = UILabel()
  private let originalNameLabel = UILabel()
  private let genresLabel = UILabel()
  private let taglineLabel = UILabel()
  
  var viewModel: MovieDetailViewModel?{
    didSet{
      if let viewModel = viewModel{
        nameLabel.text = viewModel.title
        originalNameLabel.text = viewModel.original_title
        genresLabel.text = viewModel.overview
        if let imageUrl = viewModel.poster_path{
          let url = "\(TmdbAPI.posterPath)\(imageUrl)"
          postImageView.downloadImageFrom(urlString: url)
        }
        
      }
    }
  }
  
  override func setup() {
    super.setup()
    
    selectionStyle = .none
    
    postImageView.contentMode = .scaleAspectFill
    addSubview(postImageView)
    
    nameLabel.font = UIFont.boldSystemFont(ofSize: 12)
    nameLabel.numberOfLines = 2
    nameLabel.textColor = .black
    addSubview(nameLabel)
    
    originalNameLabel.font = UIFont.systemFont(ofSize: 12)
    originalNameLabel.numberOfLines = 2
    originalNameLabel.textColor = .black
    addSubview(originalNameLabel)
    
    genresLabel.font = UIFont.systemFont(ofSize: 12)
    genresLabel.numberOfLines = 2
    genresLabel.textColor = .gray
    addSubview(genresLabel)
    
    taglineLabel.font = UIFont.systemFont(ofSize: 12)
    taglineLabel.numberOfLines = 2
    taglineLabel.textColor = .gray
    addSubview(taglineLabel)
  }
  
  override func setupConstraints() {
    super.setupConstraints()
    
    postImageView.translatesAutoresizingMaskIntoConstraints = false
    postImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
    postImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    postImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 3/2).isActive = true
    postImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.topAnchor.constraint(equalTo: postImageView.topAnchor, constant: 8).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 8).isActive = true
    nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    
    originalNameLabel.translatesAutoresizingMaskIntoConstraints = false
    originalNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
    originalNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
    originalNameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
    
    genresLabel.translatesAutoresizingMaskIntoConstraints = false
    genresLabel.topAnchor.constraint(equalTo: originalNameLabel.bottomAnchor, constant: 8).isActive = true
    genresLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
    genresLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
    
    taglineLabel.translatesAutoresizingMaskIntoConstraints = false
    taglineLabel.topAnchor.constraint(equalTo: genresLabel.bottomAnchor, constant: 8).isActive = true
    taglineLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
    taglineLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
//    taglineLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
  }
  
}
