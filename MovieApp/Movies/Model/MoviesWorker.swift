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
}
