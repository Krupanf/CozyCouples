
import UIKit

class Intro12Cell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var BGtxtView: UIView!
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var lblExpire: UILabel!
    @IBOutlet weak var lblPin: UILabel!
    @IBOutlet weak var BGView: UIView!
    
    @IBOutlet weak var pairWithPartenrBGView: UIView!
    @IBOutlet weak var sendCodeBGView: UIView!
    
    override func awakeFromNib() {
        DispatchQueue.main.async {
            self.txtCode.attributedPlaceholder = NSAttributedString(
                string: "Enter the code",
                attributes: [
                    .foregroundColor: UIColor.white.withAlphaComponent(0.5)
                ]
            )
            
            self.sendCodeBGView.layer.borderWidth = 1
            self.pairWithPartenrBGView.layer.borderWidth = 1
            self.sendCodeBGView.layer.borderColor = UIColor(hex: "#B377FE").cgColor
            self.pairWithPartenrBGView.layer.borderColor = UIColor(hex: "#B377FE").cgColor
            
            self.BGView.layer.cornerRadius = 23
            
            self.sendCodeBGView.layer.cornerRadius = self.sendCodeBGView.bounds.height / 2
            self.pairWithPartenrBGView.layer.cornerRadius = self.pairWithPartenrBGView.bounds.height / 2
            self.BGtxtView.layer.cornerRadius = self.BGtxtView.bounds.height / 2
            
            self.sendCodeBGView.applyInnerShadows(cornerRadius: self.sendCodeBGView.bounds.height / 2)
            self.pairWithPartenrBGView.applyInnerShadows(cornerRadius: self.pairWithPartenrBGView.bounds.height / 2)
            self.BGView.applyInnerShadows(cornerRadius: 23)

            
            let fullText = "Let’s Connect with your\nlove one’s"
            
            let regularFont = UIFont(name: "Poppins-Bold", size: 26)
            ?? UIFont.boldSystemFont(ofSize: 26)
            
            let boldFont = UIFont(name: "Poppins-Bold", size: 26)
            ?? UIFont.boldSystemFont(ofSize: 26)
            
            let attributedString = NSMutableAttributedString(
                string: fullText,
                attributes: [
                    .font: regularFont,
                    .foregroundColor: UIColor(hex: "#FFFFFF")
                ]
            )
            
            let range = (fullText as NSString).range(of: "love one’s")
            
            if range.location != NSNotFound {
                attributedString.addAttributes([
                    .font: boldFont,
                    .foregroundColor: UIColor(hex: "#B377FE")
                ], range: range)
            }
            
            self.lblTitle.attributedText = attributedString

        }
    }
    
}
