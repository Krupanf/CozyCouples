
import UIKit

class Intro06Cell: UICollectionViewCell {
    
    @IBOutlet weak var imgDemo: UIImageView!
    @IBOutlet weak var lblDis: UILabel!
    @IBOutlet weak var growBGVIew: UIView!
    @IBOutlet weak var subBGView: UIView!
    @IBOutlet weak var DoyouBGVIew: UIView!
    
    override func awakeFromNib() {
        DispatchQueue.main.asyncAfter(wallDeadline: .now()){
            self.subBGView.layer.cornerRadius = 37
            self.imgDemo.layer.cornerRadius = 27
            self.growBGVIew.layer.cornerRadius = 13
            self.DoyouBGVIew.layer.cornerRadius = self.DoyouBGVIew.frame.height / 2
            applyLeftToRightGradientBorder(
                on: self.DoyouBGVIew,
                colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#B377FE")],
                borderWidth: 2,
                cornerRadius: self.growBGVIew.frame.height / 2
            )
            
            applyLeftToRightGradient(
                on: self.DoyouBGVIew,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.3),UIColor(hex:"#B377FE").withAlphaComponent(0.3)]
            )

            applyLeftToRightGradientBorder(
                on: self.subBGView,
                colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#B377FE")],
                borderWidth: 3,
                cornerRadius: 37
            )
            
            applyLeftToRightGradient(
                on: self.subBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            applyLeftToRightGradient(
                on: self.growBGVIew,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )
            
            let fullText = """
            Research shows that learning one new thing
            about your partner every 2 days increases
            relationship satisfaction by 40%
            """

            let regularFont = UIFont(name: "Poppins-Medium", size: 12)
                ?? UIFont.systemFont(ofSize: 12)

            let boldFont = UIFont(name: "Poppins-Bold", size: 12)
                ?? UIFont.boldSystemFont(ofSize: 12)

            let attributedString = NSMutableAttributedString(
                string: fullText,
                attributes: [
                    .font: regularFont,
                    .foregroundColor: UIColor(hex: "#D5D5D5")
                ]
            )

            let range = (fullText as NSString).range(of: "40%")

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
