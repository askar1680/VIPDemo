import Foundation
import UIKit

struct MovieResult: Codable {
  var results: Array<Movie>
}

struct Movie: Codable {
  var id: Int
  var vote_average: CGFloat?
  var title: String?
  var poster_path: String?
  var original_title: String?
  var backdrop_path: String?
  var overview: String?
  var release_date: String?
  var genre_ids: Array<Int>?
  var adult: Bool?
  var popularity: CGFloat?
}

