import UIKit

class Intro14Cell: UICollectionViewCell {
    
    @IBOutlet weak var lblDis: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        DispatchQueue.main.async {
            self.lblTitle.applyLeftToRightGradient(
                colors: [
                    UIColor(hex: "#E1C891"),
                    UIColor(hex: "#FAE9C4"),
                    UIColor(hex: "#D4B57E"),
                    UIColor(hex: "#B29356")
                ]
            )
            
            let fullText = "You connected with Clara"
            
            let regularFont = UIFont(name: "Poppins-SemiBold", size: 24)
            ?? UIFont.boldSystemFont(ofSize: 24)
            
            let boldFont = UIFont(name: "Poppins-SemiBold", size: 24)
            ?? UIFont.boldSystemFont(ofSize: 24)

            let attributedString = NSMutableAttributedString(
                string: fullText,
                attributes: [
                    .font: regularFont,
                    .foregroundColor: UIColor(hex: "#FFFFFF")
                ]
            )
            
            let range = (fullText as NSString).range(of: "Clara")
            
            if range.location != NSNotFound {
                attributedString.addAttributes([
                    .font: boldFont,
                    .foregroundColor: UIColor(hex: "#B377FE")
                ], range: range)
            }
            
            self.lblDis.attributedText = attributedString

            
        }
    }
    
}
