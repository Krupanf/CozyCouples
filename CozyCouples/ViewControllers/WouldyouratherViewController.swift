
import UIKit

class WouldyouratherViewController: UIViewController {

    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var orBGVIew: UIView!
    @IBOutlet weak var imgBottom: UIImageView!
    @IBOutlet weak var bottomImageBG: UIView!
    @IBOutlet weak var imgTop: UIImageView!
    @IBOutlet weak var topImgBGView: UIView!
    @IBOutlet weak var questionBGView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
            self.questionBGView.layer.cornerRadius = self.questionBGView.frame.height/2
            self.orBGVIew.layer.cornerRadius = self.orBGVIew.frame.height/2
            self.topImgBGView.layer.cornerRadius = 23
            self.bottomImageBG.layer.cornerRadius = 23
            self.topImgBGView.applyInnerShadows(cornerRadius: 23)
            self.bottomImageBG.applyInnerShadows(cornerRadius: 23)
            applyLeftToRightGradient(
                on: self.questionBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )
                        
        }
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
    }
    
    @IBAction func btnSkipAction(_ sender: UIButton) {
    }
    
    @IBAction func BtntopImageAction(_ sender: UIButton) {
    }
    
    @IBAction func btnBottomImageAction(_ sender: UIButton) {
    }
    
}
