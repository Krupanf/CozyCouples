import UIKit

class DailyQuestionHomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heartBGVIew: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var arrowBGVIew: UIView!
    @IBOutlet weak var getStartBGView: UIView!
    @IBOutlet weak var lblDis: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.setupUI()
        }
        
    }
    func setupUI(){
        self.getStartBGView.layer.cornerRadius = self.getStartBGView.frame.height / 2
        self.arrowBGVIew.layer.cornerRadius = self.arrowBGVIew.frame.height / 2
        self.heartBGVIew.layer.cornerRadius = self.heartBGVIew.frame.height / 2
        self.bgView.layer.cornerRadius = 23
        
        applyLeftToRightGradient(
            on: self.getStartBGView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
        )
        
        applyLeftToRightGradientBorder(
            on: self.bgView,
            colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#E364F7"),UIColor(hex:"#CA77FE")],
            borderWidth: 3,
            cornerRadius: 23
        )
                
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
