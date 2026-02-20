
import UIKit

class IHaveNeverViewController: UIViewController {

    @IBOutlet weak var ihaveNeverBgView: UIView!
    @IBOutlet weak var iHaveBGVIew: UIView!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var questionBGView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
            self.questionBGView.layer.cornerRadius = self.questionBGView.frame.height/2
            self.iHaveBGVIew.layer.cornerRadius = 23
            self.ihaveNeverBgView.layer.cornerRadius = 23
            self.iHaveBGVIew.applyInnerShadows(cornerRadius: 23)
            applyLeftToRightGradient(
                on: self.questionBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            applyLeftToRightGradient(
                on: self.ihaveNeverBgView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )

        }
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
    }
    
    @IBAction func btnSkipAction(_ sender: UIButton) {
    }
    
    
    @IBAction func btniHaveAction(_ sender: UIButton) {
    }
    
    @IBAction func btniHaveNever(_ sender: UIButton) {
        
    }
    
}

