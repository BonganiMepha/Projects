import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadiusAndShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setRadiusAndShadow()
    }
    func setRadiusAndShadow() {
        self.layer.cornerRadius = frame.height / 2
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowColor = UIColor.black.cgColor
    }
}
