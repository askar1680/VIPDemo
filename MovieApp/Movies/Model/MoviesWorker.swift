import UIKit

class MoviesWorker {
  private let networkClient: NetworkClientProtocol
  init(networkClient: NetworkClientProtocol = NetworkClient.sharedInstance) {
    self.networkClient = networkClient
  }
}

extension MoviesWorker{
  func fetchMovies(page: Int, completion: @escaping ([Movie]?, Error?) -> ()) {
    networkClient.fetchCodable(url: MovieAPIEndPoint.getPopularMovies(page).url(), type: MovieResult.self) {
      (movieResult, error) in
      if error != nil {
        completion(nil, error)
        return
      }
      else {
        if let result = movieResult {
          completion(result.results, nil)
        }
        else {
          completion(nil, error)
        }
      }
    }
  }
  func fetchMovieImage(movie: Movie, completion: @escaping (Data?, Error?) -> ()){
    if let url = URL(string: "\(TmdbAPI.posterPath)\(movie.poster_path ?? "")"){
      networkClient.sendRequest(request: URLRequest(url: url)) { (data, response, error) in
        completion(data, error)
      }
    }
    
  }
}
