
import UIKit

class EnableLocationViewController: UIViewController {

    @IBOutlet weak var allowAccessBGView: UIView!
    
    var isCloseTapped : (()->(Void))?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            self.allowAccessBGView.layer.cornerRadius = self.allowAccessBGView.frame.height / 2
            applyLeftToRightGradient(
                on: self.allowAccessBGView,
                colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#B377FE")]
            )
        }
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.isCloseTapped?()
        }
    }
    
    @IBAction func btnAllowAction(_ sender: UIButton) {
        
    }
    
}
