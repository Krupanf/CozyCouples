import UIKit

class DailyChallengeViewController: UIViewController {

    @IBOutlet weak var NeitherBGView: UIView!
    @IBOutlet weak var BothBGView: UIView!
    @IBOutlet weak var imgUser2: UIImageView!
    @IBOutlet weak var imgUser1: UIImageView!
    @IBOutlet weak var lblUser2: UILabel!
    @IBOutlet weak var lblUser1: UILabel!
    @IBOutlet weak var user2BGView: UIView!
    @IBOutlet weak var user1BGVIew: UIView!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var topQuestionBGView: UIView!
    @IBOutlet weak var lblTotalQuestions: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
            self.topQuestionBGView.layer.cornerRadius = self.topQuestionBGView.frame.height/2
            self.user1BGVIew.layer.cornerRadius = 23
            self.user2BGView.layer.cornerRadius = 23
            self.BothBGView.layer.cornerRadius = self.BothBGView.frame.height/2
            self.NeitherBGView.layer.cornerRadius = self.NeitherBGView.frame.height/2
            self.imgUser1.layer.cornerRadius = self.imgUser1.frame.height/2
            self.imgUser2.layer.cornerRadius = self.imgUser2.frame.height/2
            self.user1BGVIew.applyInnerShadows(cornerRadius: 23)
            self.user2BGView.applyInnerShadows(cornerRadius: 23)

            self.imgUser1.layer.borderWidth = 2
            self.imgUser2.layer.borderWidth = 2
            self.imgUser1.layer.borderColor = UIColor.white.cgColor
            self.imgUser2.layer.borderColor = UIColor.white.cgColor

            
            applyLeftToRightGradient(
                on: self.BothBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            applyLeftToRightGradient(
                on: self.topQuestionBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            
            applyLeftToRightGradient(
                on: self.NeitherBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )

            applyLeftToRightGradientBorder(
                on: self.BothBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.5),UIColor(hex:"#B377FE").withAlphaComponent(0.5)],
                borderWidth: 3,
                cornerRadius: self.BothBGView.frame.height / 2
            )
        }
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnBothAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnNeitherAction(_ sender: UIButton) {
        let push = self.storyboard?.instantiateViewController(withIdentifier: "DailyChallengeResultViewController") as! DailyChallengeResultViewController
        navigationController?.pushViewController(push, animated: true)
    }
    
}
