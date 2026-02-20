

import UIKit

class GirlSideTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMsg: UILabel!
    @IBOutlet weak var imgUser: UIImageView!

    @IBOutlet weak var viewBg: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.imgUser.layer.cornerRadius = self.imgUser.frame.height/2
            self.imgUser.layer.borderColor = UIColor.white.cgColor
            self.imgUser.layer.borderWidth = 0.5
            
            self.viewBg.layer.cornerRadius = 10
            self.viewBg.layer.maskedCorners = [
                .layerMinXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMaxXMaxYCorner
            ]

            applyLeftToRightGradient(
                on: self.viewBg,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )
        }
    }

   

}
