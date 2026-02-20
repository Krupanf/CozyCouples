
import UIKit

class DailyChallengeResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblUser1Answer: UILabel!
    @IBOutlet weak var User1Answer: UIView!
    @IBOutlet weak var imgUser1: UIImageView!
    @IBOutlet weak var lblNoQuestion: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var BGVIew: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.BGVIew.layer.cornerRadius = 23
            self.imgUser1.layer.cornerRadius = self.imgUser1.frame.height/2
            self.User1Answer.layer.cornerRadius = self.User1Answer.frame.height/2
            
            self.imgUser1.layer.borderWidth = 0.5
            self.imgUser1.layer.borderColor = UIColor.white.cgColor
            
            self.User1Answer.layer.cornerRadius = 10
            self.User1Answer.layer.maskedCorners = [
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMaxXMaxYCorner
            ]

            applyLeftToRightGradient(
                on: self.User1Answer,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.15),UIColor(hex:"#B377FE").withAlphaComponent(0.15)]
            )

            applyLeftToRightGradient(
                on: self.BGVIew,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            applyLeftToRightGradientBorder(
                on: self.BGVIew,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.5),UIColor(hex:"#B377FE").withAlphaComponent(0.5)],
                borderWidth: 3,
                cornerRadius: 23
            )
            
            
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
