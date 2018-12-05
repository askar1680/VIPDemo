import UIKit

class MovieDetailWorker {
  private let networkClient: NetworkClientProtocol
  init(networkClient: NetworkClientProtocol = NetworkClient.sharedInstance) {
    self.networkClient = networkClient
  }
}

extension MovieDetailWorker {
  func fetchMovieDetail(id: Int, completion: @escaping (MovieDetail?, Error?) -> ()){
    networkClient.fetchCodable(url: MovieAPIEndPoint.getMovieDetail(id).url(), type: MovieDetail.self) {
      (movieDetail, error) in
      completion(movieDetail, error)
    }
  }
}

