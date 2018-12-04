import UIKit

struct MovieViewModel {
  let id: Int?
  let title: String?
  let original_title: String?
  let release_date: String?
  let imageURL: String?
  let genre_ids: Array<Int>?
  let vote_average: CGFloat?
  let popularity: CGFloat?
  
  func getOriginalNameWithReleaseDate() -> String {
    if release_date?.count ?? 0 >= 4 {
      return "\(original_title ?? "") (\(release_date?[0..<4] ?? ""))"
    }
    else{
      return original_title ?? ""
    }
  }
  
  func getGenres() -> String {
    if let genre_ids = genre_ids{
      return GenresList.shared.getGenres(genreIds: genre_ids)
    }
    return ""
  }
  func getVoteAverageWithPopularity() -> NSAttributedString{
    let voteAverageAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.darkGray]
    let voteAverageString = NSMutableAttributedString(string: "\(vote_average ?? 0.0)", attributes: voteAverageAttributes)
    
    let popularityAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]
    let popularityString = NSMutableAttributedString(string: "  \(popularity ?? 0.0)", attributes: popularityAttributes)
    
    voteAverageString.append(popularityString)
    return voteAverageString
  }
}


