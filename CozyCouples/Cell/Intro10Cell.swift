
import UIKit

class Intro10Cell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var videoView: UIView!
    
    override func awakeFromNib() {
        DispatchQueue.main.async {
            let fullText = "Stay updated\nmultiple with widgets"
            
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
            
            let range = (fullText as NSString).range(of: "multiple with widgets")
            
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
