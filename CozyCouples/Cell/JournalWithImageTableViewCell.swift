

import UIKit

class JournalWithImageTableViewCell: UITableViewCell {
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var imgGradient: UIImageView!
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var viewImageSpeicalDay: UIView!
    @IBOutlet weak var imgCouple: UIImageView!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        lblContent.numberOfLines = 0
        DispatchQueue.main.async {
            self.viewMain.layer.cornerRadius = 9
            self.viewImageSpeicalDay.layer.cornerRadius = 19
            self.viewMain.layer.borderWidth = 1
            self.viewMain.layer.borderColor = UIColor(hex: "#B377FE").cgColor

        }
    }

}
