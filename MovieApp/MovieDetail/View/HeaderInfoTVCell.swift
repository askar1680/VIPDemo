import UIKit

class HeaderInfoTVCell: BaseTVCell {
  
  let postImageView = AsyncImageView()
  let nameLabel = UILabel()
  let originalNameLabel = UILabel()
  let genresLabel = UILabel()
  let taglineLabel = UILabel()
  
  override func setupConstraints() {
    super.setupConstraints()
    
    postImageView.contentMode = .scaleAspectFill
    
    nameLabel.font = UIFont.boldSystemFont(ofSize: 12)
    nameLabel.numberOfLines = 2
    nameLabel.textColor = .black
    
    originalNameLabel.font = UIFont.systemFont(ofSize: 12)
    originalNameLabel.numberOfLines = 2
    originalNameLabel.textColor = .black
    
    genresLabel.font = UIFont.systemFont(ofSize: 12)
    genresLabel.numberOfLines = 2
    genresLabel.textColor = .gray
    
    taglineLabel.font = UIFont.systemFont(ofSize: 12)
    taglineLabel.numberOfLines = 2
    taglineLabel.textColor = .gray
    
  }
  
  override func setup() {
    super.setup()
    
    postImageView.translatesAutoresizingMaskIntoConstraints = false
    postImageView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 16).isActive = true
    postImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    postImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 2/3).isActive = true
    
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
    
  }
}
