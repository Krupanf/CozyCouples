
import UIKit

class PopUPTapedViewController: UIViewController {

    @IBOutlet weak var btnGotit: UIButton!
    @IBOutlet weak var gotitBGView: UIView!
    @IBOutlet weak var lblDis: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var BGView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
            self.BGView.layer.cornerRadius = 23
            self.gotitBGView.layer.cornerRadius = self.gotitBGView.frame.height/2
            self.BGView.applyInnerShadows(cornerRadius: 23)
            self.gotitBGView.applyInnerShadows(cornerRadius: self.gotitBGView.frame.height/2)
            self.gotitBGView.layer.borderColor = UIColor(hex:"#B377FE").cgColor
            self.gotitBGView.layer.borderWidth = 1
        }
    }
    
    
    
    @IBAction func btnGotitAction(_ sender: UIButton) {
    }
    

}
