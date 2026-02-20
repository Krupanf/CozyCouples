
import UIKit

class QuestionScreenViewController: UIViewController {

    @IBOutlet weak var qurstionBGView: UIView!
    @IBOutlet weak var lblQuestions: UILabel!
    @IBOutlet weak var txtMsg: UITextField!
    @IBOutlet weak var sendMsgBGView: UIView!
    @IBOutlet weak var cameraBGView: UIView!
    @IBOutlet weak var galleryBGVIew: UIView!
    
    
    
    @IBOutlet weak var btnSend: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
            self.qurstionBGView.layer.cornerRadius = self.qurstionBGView.frame.height/2
            self.cameraBGView.layer.cornerRadius = self.cameraBGView.frame.height/2
            self.galleryBGVIew.layer.cornerRadius = self.galleryBGVIew.frame.height/2
            self.sendMsgBGView.layer.cornerRadius = self.sendMsgBGView.frame.height/2
            self.btnSend.layer.cornerRadius = self.btnSend.frame.height/2
            self.sendMsgBGView.applyInnerShadows(cornerRadius: self.sendMsgBGView.frame.height/2)
            applyLeftToRightGradient(
                on: self.qurstionBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )
            
            applyLeftToRightGradient(
                on: self.cameraBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            applyLeftToRightGradient(
                on: self.galleryBGVIew,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )
            
            applyLeftToRightGradient(
                on: self.btnSend,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )


            
            self.txtMsg.setAttributedPlaceholder(
                "Write your answer",
                color: .white,
                alpha: 0.5
            )
            
            applyLeftToRightGradientBorder(
                on: self.cameraBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.5),UIColor(hex:"#B377FE").withAlphaComponent(0.5)],
                borderWidth: 3,
                cornerRadius: self.cameraBGView.frame.height / 2
            )

            applyLeftToRightGradientBorder(
                on: self.galleryBGVIew,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.5),UIColor(hex:"#B377FE").withAlphaComponent(0.5)],
                borderWidth: 3,
                cornerRadius: self.galleryBGVIew.frame.height / 2
            )

            
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
    
    @IBAction func btnSendMsgAction(_ sender: UIButton) {
    }
    
    
    
}
