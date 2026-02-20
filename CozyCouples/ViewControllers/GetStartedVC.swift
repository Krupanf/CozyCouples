import UIKit

class GetStartedVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var gradientView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            self.gradientView.layer.cornerRadius = self.gradientView.frame.height / 2
            applyLeftToRightGradient(
                on: self.gradientView,
                colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#B377FE")]
            )
            applyTopCornerRadius(30, to: self.bgView)
        }
    }
    
    @IBAction func btnGetStartedAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "IntroViewController") as! IntroViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
