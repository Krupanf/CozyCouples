
import UIKit

class Intro09Cell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var MostLikeView: UIView!
    @IBOutlet weak var NeverHaveView: UIView!
    @IBOutlet weak var thisOrThatView: UIView!
    @IBOutlet weak var AnswerWithView: UIView!
    
    override func awakeFromNib() {
        DispatchQueue.main.async {
            let fullText = "Answer\n2000+ Questions"
            
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
            
            let range = (fullText as NSString).range(of: "2000+ Questions")
            
            if range.location != NSNotFound {
                attributedString.addAttributes([
                    .font: boldFont,
                    .foregroundColor: UIColor(hex: "#B377FE")
                ], range: range)
            }
            
            self.lblTitle.attributedText = attributedString

            
            self.MostLikeView.layer.cornerRadius = 27
            self.NeverHaveView.layer.cornerRadius = 27
            self.thisOrThatView.layer.cornerRadius = 27
            self.AnswerWithView.layer.cornerRadius = 27

            
            self.MostLikeView.layer.borderWidth = 2
            self.NeverHaveView.layer.borderWidth = 2
            self.thisOrThatView.layer.borderWidth = 2
            self.AnswerWithView.layer.borderWidth = 2

            self.MostLikeView.layer.borderColor = UIColor(hex: "#3C096C").cgColor
            self.NeverHaveView.layer.borderColor = UIColor(hex: "#3D38B4").cgColor
            self.thisOrThatView.layer.borderColor = UIColor(hex: "#A22A2A").cgColor
            self.AnswerWithView.layer.borderColor = UIColor(hex: "#5A0295").cgColor

            
            applyLeftToRightGradient(
                on: self.MostLikeView,
                colors: [UIColor(hex:"#380965").withAlphaComponent(1.0),UIColor(hex:"#240046").withAlphaComponent(1.0)]
            )

            applyLeftToRightGradient(
                on: self.NeverHaveView,
                colors: [UIColor(hex:"#3D38B4").withAlphaComponent(1.0),UIColor(hex:"#3A0CA3").withAlphaComponent(1.0)]
            )

            applyLeftToRightGradient(
                on: self.thisOrThatView,
                colors: [UIColor(hex:"#A22A2A").withAlphaComponent(1.0),UIColor(hex:"#7A2828").withAlphaComponent(1.0)]
            )

            applyLeftToRightGradient(
                on: self.AnswerWithView,
                colors: [UIColor(hex:"#8125BF").withAlphaComponent(1.0),UIColor(hex:"#4D027F").withAlphaComponent(1.0)]
            )

            
            
        }
        
    }
    
    
    
}
