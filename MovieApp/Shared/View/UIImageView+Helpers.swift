import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView{
  func downloadImage(urlString: String) {
    guard let url = URL.init(string: urlString) else {print("url nil"); return}
    if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
      image = cachedImage
      return
    }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if error != nil{
        return
      }
      guard let data = data else { return }
      let resource = UIImage.init(data: data)
      imageCache.setObject(resource as AnyObject, forKey: urlString as AnyObject)
      DispatchQueue.main.async {
          self.image = resource
      }
      }
      .resume()
  }
}
