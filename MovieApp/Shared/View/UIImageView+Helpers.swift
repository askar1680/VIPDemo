import UIKit

//let imageCache = NSCache<AnyObject, AnyObject>()
//
//func downloadImage(urlString: String, completion: @escaping (UIImage) -> ()) {
//  guard let url = URL.init(string: urlString) else {print("url nil"); return}
//  if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
//    completion(cachedImage)
//    return
//  }
//  URLSession.shared.dataTask(with: url) { (data, response, error) in
//    if error != nil{
//      return
//    }
//    guard let data = data else { return }
//    let image = UIImage.init(data: data)
//    imageCache.setObject(image as AnyObject, forKey: urlString as AnyObject)
//    if let image = image {
//      DispatchQueue.main.async {
//        completion(image)
//      }
//    }
//  }.resume()
//}
//
//extension UIImageView{
//  func downloadImage(urlString: String) {
//    guard let url = URL.init(string: urlString) else {print("url nil"); return}
//    if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
//      image = cachedImage
//      return
//    }
//    URLSession.shared.dataTask(with: url) { (data, response, error) in
//      if error != nil{
//        return
//      }
//      guard let data = data else { return }
//      let resource = UIImage.init(data: data)
//      imageCache.setObject(resource as AnyObject, forKey: urlString as AnyObject)
//      DispatchQueue.main.async {
//          self.image = resource
//      }
//      }
//      .resume()
//  }
//}
