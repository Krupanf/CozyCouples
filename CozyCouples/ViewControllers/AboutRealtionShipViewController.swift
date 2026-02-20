
import UIKit

class AboutRealtionShipViewController: UIViewController {

    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var stackView1: UIStackView!
    @IBOutlet weak var imgMan: UIImageView!
    @IBOutlet weak var imgGirl: UIImageView!
    
    @IBOutlet weak var imgBg1: UIImageView!
    @IBOutlet weak var imgBg2: UIImageView!

    @IBOutlet weak var btnManEdit: UIButton!
    @IBOutlet weak var btnGirlEdit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            self.stackView1.layer.cornerRadius = 21
            self.stackView1.applyInnerShadows(cornerRadius: 21)
            
            self.stackView2.layer.cornerRadius = 21
            self.stackView2.applyInnerShadows(cornerRadius: 21)
            
            self.imgMan.layer.cornerRadius = self.imgMan.frame.height/2
            self.imgGirl.layer.cornerRadius = self.imgGirl.frame.height/2
            
            self.imgMan.layer.borderColor = UIColor.white.cgColor
            self.imgGirl.layer.borderColor = UIColor.white.cgColor
            
            self.imgMan.layer.borderWidth = 2
            self.imgGirl.layer.borderWidth = 2

        }
    }

    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnChangeEmail(_ sender: Any) {
    }
    
    @IBAction func btnCoupleAniver(_ sender: Any) {
    }
    
    @IBAction func btnDisconnectPartner(_ sender: Any) {
    }
    
    @IBAction func btnChangePhotoEdit(_ sender: UIButton) {
    }
}
