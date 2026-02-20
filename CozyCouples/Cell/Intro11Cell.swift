
import UIKit

class Intro11Cell: UICollectionViewCell {
    
    @IBOutlet weak var loginWithApple: UIView!
    @IBOutlet weak var loginWithGoogle: UIView!
    
    override func awakeFromNib() {
        DispatchQueue.main.async {
            self.loginWithGoogle.layer.borderWidth = 1
            self.loginWithApple.layer.borderWidth = 1
            self.loginWithGoogle.layer.borderColor = UIColor.black.cgColor
            self.loginWithApple.layer.borderColor = UIColor.black.cgColor
            
            self.loginWithGoogle.layer.cornerRadius = self.loginWithGoogle.bounds.height / 2
            self.loginWithApple.layer.cornerRadius = self.loginWithApple.bounds.height / 2
            self.loginWithGoogle.applyInnerShadows(cornerRadius: self.loginWithGoogle.bounds.height / 2)
            self.loginWithApple.applyInnerShadows(cornerRadius: self.loginWithApple.bounds.height / 2)
        }
    }
}
