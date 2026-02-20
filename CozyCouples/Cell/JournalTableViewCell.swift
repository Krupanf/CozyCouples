

import UIKit

class JournalTableViewCell: UITableViewCell {

    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var imgGradient: UIImageView!
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblPurpose: UILabel!
    @IBOutlet weak var viewImageSpeicalDay: UIView!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var imgHeart: UIImageView!
    @IBOutlet weak var lblDayAgo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.viewMain.layer.cornerRadius = 9
            self.viewMain.layer.borderWidth = 1
            self.viewMain.layer.borderColor = UIColor(hex: "#B377FE").cgColor
            self.viewImageSpeicalDay.layer.cornerRadius = 13
        }
    }
    
    

}
