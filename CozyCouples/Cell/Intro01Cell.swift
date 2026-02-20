import UIKit

class Intro01Cell: UICollectionViewCell {
    
    @IBOutlet weak var txtBGview: UIView!
    
    override func awakeFromNib() {
        DispatchQueue.main.asyncAfter(wallDeadline: .now()){
            self.txtBGview.layer.cornerRadius = self.txtBGview.frame.height / 2
            applyLeftToRightGradient(
                on: self.txtBGview,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )
            
            applyLeftToRightGradientBorder(
                on: self.txtBGview,
                colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#B377FE")],
                borderWidth: 3,
                cornerRadius: self.txtBGview.frame.height / 2
            )
        }
    }
    
}
