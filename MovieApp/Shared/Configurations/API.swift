import Foundation

struct TmdbAPI {
  static let baseURLString = "https://api.themoviedb.org/3/"
  static let apiKey = "91ef52ef30eeb3da1f46bad51aeb9d1e"
  static let language = "ru"
  static let posterPath = "https://image.tmdb.org/t/p/w342"
  static let backdropPath = "https://image.tmdb.org/t/p/w780"
}

protocol URLConvertible {
  func url() -> URL?
}

enum MovieAPIEndPoint{
  case getPopularMovies(Int)
  case getGenreList()
  case getMovieDetail(Int)
}

extension MovieAPIEndPoint: URLConvertible{
  func url() -> URL? {
    switch self {
    case .getPopularMovies(let page):
      let method = "movie/popular"
      return URL(string: "\(TmdbAPI.baseURLString)\(method)?api_key=\(TmdbAPI.apiKey)&language=\(TmdbAPI.language)&page=\(page)")
    case .getGenreList():
      let method = "genre/movie/list"
      return URL(string: "\(TmdbAPI.baseURLString)\(method)?api_key=\(TmdbAPI.apiKey)&language=\(TmdbAPI.language)")
    case .getMovieDetail(let id):
      let method = "movie/\(id)"
      return URL(string: "\(TmdbAPI.baseURLString)\(method)?api_key=\(TmdbAPI.apiKey)&language=\(TmdbAPI.language)")
    }
  }
}

