import UIKit

protocol ReusableCell: AnyObject {
  static var identifier: String { get }
}

extension ReusableCell where Self: UITableViewCell{
  static var identifier: String {
    return NSStringFromClass(self)
  }
}

extension UITableView{
  func register<T: UITableViewCell>(_: T.Type) where T: ReusableCell{
    register(T.self, forCellReuseIdentifier: T.identifier)
  }
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableCell{
    guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
      fatalError("Can not dequeue \(T.self) with identifier \(T.identifier)")
    }
    return cell
  }
}
