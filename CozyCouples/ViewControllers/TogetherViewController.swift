
import UIKit

class TogetherViewController: UIViewController {

    @IBOutlet weak var btnChangePhoto: UIButton!
    @IBOutlet weak var viewBox: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillLayoutSubviews() {
        DispatchQueue.main.async {
            self.viewBox.layer.cornerRadius = 21
            self.viewBox.applyInnerShadows(cornerRadius: 21)
            self.btnChangePhoto.layer.cornerRadius = self.btnChangePhoto.frame.height/2
            
            applyLeftToRightGradient(
                on: self.btnChangePhoto,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )

        }
    }
    @IBAction func btnChangePhoto(_ sender: Any) {
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
