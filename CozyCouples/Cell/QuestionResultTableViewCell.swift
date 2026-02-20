import UIKit

class QuestionResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblUser2Anser: UILabel!
    @IBOutlet weak var User2Answer: UIView!
    @IBOutlet weak var imgUser2: UIImageView!
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
            self.imgUser2.layer.cornerRadius = self.imgUser2.frame.height/2
            self.User1Answer.layer.cornerRadius = self.User1Answer.frame.height/2
            self.User2Answer.layer.cornerRadius = self.User2Answer.frame.height/2
            
            self.imgUser1.layer.borderWidth = 0.5
            self.imgUser2.layer.borderWidth = 0.5
            
            self.imgUser1.layer.borderColor = UIColor.white.cgColor
            self.imgUser2.layer.borderColor = UIColor.white.cgColor
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
