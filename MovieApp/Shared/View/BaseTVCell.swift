import UIKit



class BaseTVCell: UITableViewCell, ReusableCell{
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
    setupConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  open func setup() {
    
  }
  
  open func setupConstraints() {
    
  }
  
}
