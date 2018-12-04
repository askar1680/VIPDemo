import Foundation

enum NetworkError: Error {
  case generic
  case invalidURL
}

protocol NetworkClientProtocol {
  func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ())
  func fetchCodable<T>(url: URL?, type: T.Type, completion:  @escaping (T?, Error?) -> ()) where  T: Codable
}

class NetworkClient: NetworkClientProtocol {
  func fetchCodable<T>(url: URL?, type: T.Type, completion: @escaping (T?, Error?) -> ()) where T : Decodable, T : Encodable {
    guard let url = url else { completion(nil, CustomError.invalidURL); return }
    let request = URLRequest(url: url)
    sendRequest(request: request) { (data, response, error) in
      var error: Error?
      if error != nil {
        error = CustomError.invalidResponse
      }
      else {
        if let data = data {
          let result = try? JSONDecoder().decode(T.self, from: data)
          if let result = result {
            completion(result, nil)
            return
          }
          else {
            error = CustomError.generic
          }
        }
        else {
          error = CustomError.generic
        }
      }
      completion(nil, error)
    }
  }
  
  static let sharedInstance = NetworkClient()
  
  let session: URLSession!
  
  init() {
    let configuration = URLSessionConfiguration.default
    configuration.urlCache = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
    configuration.timeoutIntervalForRequest = 5.0
    session = URLSession(configuration: configuration)
  }
  
  func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    guard let url = request.url else {
      completion(nil, nil, NetworkError.invalidURL)
      return
    }
    session.dataTask(with: url) { data, response, error in
      DispatchQueue.main.async {
        completion(data, response, error)
      }
      }.resume()
  }
}
