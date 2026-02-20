
import UIKit

class Intro07Cell: UICollectionViewCell {
    
    @IBOutlet weak var lblDis: UILabel!
    @IBOutlet weak var checkBox: UIView!
    @IBOutlet weak var imgCenter: UIImageView!
    @IBOutlet weak var bgView2: UIView!
    @IBOutlet weak var bgView1: UIView!
    @IBOutlet weak var loadingview2: UIView!
    @IBOutlet weak var loadingview1: UIView!
    @IBOutlet weak var msgBGView: UIView!
    
    override func awakeFromNib() {
        DispatchQueue.main.asyncAfter(wallDeadline: .now()){
            self.bgView1.layer.cornerRadius = 27
            self.bgView2.layer.cornerRadius = 27
            self.imgCenter.layer.cornerRadius = 17
            self.msgBGView.layer.cornerRadius = self.msgBGView.frame.height / 2
            self.checkBox.layer.cornerRadius = self.checkBox.frame.height / 2
            self.loadingview2.layer.cornerRadius = self.loadingview2.frame.height / 2
            self.loadingview1.layer.cornerRadius = self.loadingview1.frame.height / 2

            applyLeftToRightGradientBorder(
                on: self.bgView1,
                colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#B377FE")],
                borderWidth: 3,
                cornerRadius: 27
            )

            applyLeftToRightGradientBorder(
                on: self.bgView2,
                colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#B377FE")],
                borderWidth: 3,
                cornerRadius: 27
            )
            
            applyLeftToRightGradient(
                on: self.bgView1,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            applyLeftToRightGradient(
                on: self.bgView2,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            applyLeftToRightGradient(
                on: self.msgBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )
        }
    }
}
