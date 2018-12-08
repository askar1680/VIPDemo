import UIKit

struct MovieDetailViewModel {
  var id: Int?
  var title: String?
  var original_title: String?
  var vote_average: CGFloat?
  var vote_count: Int?
  var overview: String?
  var popularity: CGFloat
  var backdrop_path: String?
  var poster_path: String?

  var budget: Int?
  var genres: Array<Genre>?
  var production_companies: Array<ProductionCompany>?
  var production_countries: Array<ProductionCountry>?
  var spoken_languages: Array<SpokenLanguages>?
  var release_date: String?
  var revenue: Int?
  var runtime: Int?
  var status: String?
  var tagline: String?
  
}
