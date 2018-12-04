import UIKit

open class BaseView: UIView {
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    setupConstraints()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  open func setup() {
    
  }
  
  open func setupConstraints() {
    
  }
}
