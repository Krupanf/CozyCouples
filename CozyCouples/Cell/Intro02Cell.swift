
import UIKit

class Intro02Cell: UICollectionViewCell {
    
    @IBOutlet weak var imageBgView: UIView!
    
    
    override func awakeFromNib() {
        DispatchQueue.main.asyncAfter(wallDeadline: .now()){
            self.imageBgView.layer.cornerRadius = self.imageBgView.frame.height / 2
            self.imageBgView.layer.borderColor = UIColor.white.cgColor
            self.imageBgView.layer.borderWidth = 2
        }
    }
}
