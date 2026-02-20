

import UIKit
class AccountDetailViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            self.stackView.layer.cornerRadius = 21
            self.stackView.applyInnerShadows(cornerRadius: 21)
        }
    }

    
    @IBAction func btnBackTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnName(_ sender: Any) {
       
    }
    
    @IBAction func btnEmailTapped(_ sender: Any) {
       
    }
    
    @IBAction func btnChangePassword(_ sender: UIButton) {
    }
    
    @IBAction func btnDeleteAccount(_ sender: Any) {
        
    }
    
}
