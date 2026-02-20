
import UIKit

class JournalContentPurposeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDaysago: UILabel!
    @IBOutlet weak var lblNoDay: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewImage: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.viewMain.layer.cornerRadius = 9
            self.viewImage.layer.cornerRadius = 13
            self.viewMain.layer.borderWidth = 1
            self.viewMain.layer.borderColor = UIColor(hex: "#B377FE").cgColor
        }
    }
}
