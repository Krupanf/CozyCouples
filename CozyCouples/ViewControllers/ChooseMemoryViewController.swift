import UIKit

class ChooseMemoryViewController: UIViewController {

    @IBOutlet weak var SpecialDayBGView: UIView!
    @IBOutlet weak var memoryBGView: UIView!
    @IBOutlet weak var BGView: UIView!
    var isDismiss : ((Bool)->())?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now()){
            self.memoryBGView.layer.cornerRadius = 23
            self.SpecialDayBGView.layer.cornerRadius = 23
            self.BGView.layer.cornerRadius = 29
            self.BGView.layer.maskedCorners = [
                .layerMinXMinYCorner, // top-left
                .layerMaxXMinYCorner  // top-right
            ]
            
            self.BGView.applyInnerShadows(cornerRadius: 29)
            self.SpecialDayBGView.applyInnerShadows(cornerRadius: 23)
            self.memoryBGView.applyInnerShadows(cornerRadius: 23)
        }
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnMemoryAction(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.isDismiss?(true)
        }
    }
    
    @IBAction func btnSpecialDayAction(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.isDismiss?(false)
        }
    }
    

}
