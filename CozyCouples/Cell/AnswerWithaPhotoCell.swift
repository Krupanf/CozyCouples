import UIKit

class AnswerWithaPhotoCell: UITableViewCell {

    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var imgSent: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.imgSent.layer.cornerRadius = 19
            self.imgUser.layer.cornerRadius = self.imgUser.frame.height/2
            self.imgSent.layer.borderColor = UIColor.white.cgColor
            self.imgSent.layer.borderWidth = 1
            
            self.imgUser.layer.borderColor = UIColor.white.cgColor
            self.imgUser.layer.borderWidth = 0.5

        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
