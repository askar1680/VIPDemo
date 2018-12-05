import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class AsyncImageView: UIImageView {
  
  private var currentUrl: String? //Get a hold of the latest request url
  
  public func downloadImageFrom(urlString: String){
    currentUrl = urlString
    
    if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
      self.image = cachedImage
      return
    }
    let sessionConfig = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
    if let url = URL.init(string: urlString){
      let task = session.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
        if error == nil {
          DispatchQueue.main.async {
            if let downloadedImage = UIImage(data: data!) {
              if (urlString == self.currentUrl) {
                imageCache.setObject(downloadedImage as AnyObject, forKey: urlString as AnyObject)
                self.image = downloadedImage
              }
            }
          }
        }
        else {
          print(error as Any)
        }
      })
      task.resume()
    }
  }
}
