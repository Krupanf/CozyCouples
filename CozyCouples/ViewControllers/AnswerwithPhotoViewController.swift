import UIKit
class AnswerwithPhotoViewController: UIViewController {

    @IBOutlet weak var RightBGView: UIView!
    @IBOutlet weak var WrongBGView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var qurstionBGView: UIView!
    @IBOutlet weak var lblQuestions: UILabel!
    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var lblCurrentQuestion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
            self.qurstionBGView.layer.cornerRadius = self.qurstionBGView.frame.height/2
            self.WrongBGView.layer.cornerRadius = self.WrongBGView.frame.height/2
            self.RightBGView.layer.cornerRadius = self.RightBGView.frame.height/2
            self.BGView.layer.cornerRadius = 30
            self.BGView.applyInnerShadows(cornerRadius: 30)
            self.WrongBGView.applyInnerShadows(cornerRadius: self.WrongBGView.frame.height/2)
            self.RightBGView.applyInnerShadows(cornerRadius: self.RightBGView.frame.height/2)
            
            applyLeftToRightGradient(
                on: self.qurstionBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            self.WrongBGView.layer.borderWidth = 1
            self.WrongBGView.layer.borderColor = UIColor(hex: "#B377FE").cgColor
            self.RightBGView.layer.borderWidth = 1
            self.RightBGView.layer.borderColor = UIColor(hex: "#B377FE").cgColor
            
        }
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
    }
    
    @IBAction func btnSkipAction(_ sender: UIButton) {
    }
        
    @IBAction func btnGalleryAction(_ sender: UIButton) {
    }
    
    @IBAction func btnCameraAction(_ sender: UIButton) {
    }

    
    
}
