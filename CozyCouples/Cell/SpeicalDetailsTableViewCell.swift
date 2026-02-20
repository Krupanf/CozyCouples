

import UIKit

class SpeicalDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblCountry: UILabel!
    
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var imgMan: UIImageView!
    
    @IBOutlet weak var lblManName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.imgMan.layer.cornerRadius = self.imgMan.frame.height/2
            self.imgMan.layer.borderColor = UIColor.white.cgColor
            self.imgMan.layer.borderWidth = 0.5
        }
       
    }

   

}
