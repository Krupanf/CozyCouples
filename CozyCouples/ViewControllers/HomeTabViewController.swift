
import UIKit

class HomeTabViewController: UIViewController {
    
    @IBOutlet weak var imgWhiteHeart: UIImageView!
    @IBOutlet weak var likeBGView: UIView!
    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var locationBGView: UIView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var addBGVIew: UIView!
    @IBOutlet weak var lblDays: UILabel!
    @IBOutlet weak var DatsBGView: UIView!
    @IBOutlet weak var tabBarBG: UIView!
    
    @IBOutlet weak var imgHome: UIImageView!
    @IBOutlet weak var imgChat: UIImageView!
    @IBOutlet weak var imgJanaral: UIImageView!
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblChats: UILabel!
    @IBOutlet weak var lblJounaral: UILabel!
    @IBOutlet weak var lblProfile: UILabel!
    
    @IBOutlet weak var tabView1: UIView!
    @IBOutlet weak var tabView2: UIView!
    @IBOutlet weak var tabView3: UIView!
    @IBOutlet weak var tabView4: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            self.setupUI()
        }
    }
    
    func setupUI(){
        self.DatsBGView.layer.cornerRadius = self.DatsBGView.frame.height / 2
        self.likeBGView.layer.cornerRadius = self.likeBGView.frame.height / 2
        
        self.likeBGView.layer.borderWidth = 4
        self.likeBGView.layer.borderColor = UIColor(hex:"#000000").cgColor
        
        applyLeftToRightGradient(
            on: self.DatsBGView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
        )
        
        applyLeftToRightGradient(
            on: self.tabBarBG,
            colors: [UIColor(hex:"#0A0D0F").withAlphaComponent(1.0),UIColor(hex:"#000000").withAlphaComponent(1.0)]
        )

        applyLeftToRightGradient(
            on: self.likeBGView,
            colors: [UIColor(hex:"#DD208F").withAlphaComponent(1.0),UIColor(hex:"#8A0EAE").withAlphaComponent(1.0)]
        )

        applyLeftToRightGradientBorder(
            on: self.DatsBGView,
            colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#B377FE")],
            borderWidth: 3,
            cornerRadius: self.DatsBGView.frame.height / 2
        )
                
    }
    
    @IBAction func btnTabAction(_ sender: UIButton) {
        if sender.tag == 2
        {
            btnAdd.isHidden =  false
            btnLocation.isHidden =  false
        }else{
            btnAdd.isHidden =  true
            btnLocation.isHidden =  true
        }
        
        let selectedColor = UIColor(hex: "#FF3B9A")
        let deselectedColor = UIColor(hex: "#FFFFFF").withAlphaComponent(0.3)

        let selectedImages = [
            "icn_HomeGre",
            "icn_chatSelected_HomeSc",
            "icn_JournalGre",
            "icn_ProfileGre"
        ]

        let deselectedImages = [
            "icn_HomeGray",
            "icn_ChatGray",
            "icn_JanaralGray",
            "icn_Profile"
        ]

        let imageViews = [imgHome, imgChat, imgJanaral, imgProfile]
        let labels = [lblHome, lblChats, lblJounaral, lblProfile]
        let indicatorViews = [tabView1, tabView2, tabView3, tabView4]

        for index in 0..<4 {
            let isSelected = sender.tag == index

            imageViews[index]?.image = UIImage(
                named: isSelected ? selectedImages[index] : deselectedImages[index]
            )

            labels[index]?.textColor = isSelected ? selectedColor : deselectedColor
            indicatorViews[index]?.isHidden = !isSelected
        }
    }
    
    func hideall(){
        self.tabView1.isHidden = true
        self.tabView2.isHidden = true
        self.tabView3.isHidden = true
        self.tabView4.isHidden = true
    }
    
    @IBAction func btnAddAction(_ sender: UIButton) {
        let ispresent = self.storyboard?.instantiateViewController(withIdentifier: "ChooseMemoryViewController") as! ChooseMemoryViewController
        ispresent.modalPresentationStyle = .custom
        ispresent.isDismiss = { isMemory in
            if isMemory
            {
                let isTogther =  self.storyboard?.instantiateViewController(withIdentifier: "MemoryViewController")as! MemoryViewController
                self.navigationController?.pushViewController(isTogther, animated: true)
            }else{
                let isTogther =  self.storyboard?.instantiateViewController(withIdentifier: "SpecialDayScreenViewController")as! SpecialDayScreenViewController
                self.navigationController?.pushViewController(isTogther, animated: true)
            }
        }
        present(ispresent,animated: true)
    }
    
    @IBAction func btnLocationAction(_ sender: UIButton) {
        let push = self.storyboard?.instantiateViewController(withIdentifier: "SelectMapMemoryViewController") as! SelectMapMemoryViewController
        navigationController?.pushViewController(push, animated: true)
    }
    
    @IBAction func btnLikeAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnTopDays(_ sender: UIButton) {
        let isPresent = self.storyboard?.instantiateViewController(withIdentifier: "StreakCompleteViewController") as! StreakCompleteViewController
        isPresent.modalPresentationStyle = .fullScreen
        present(isPresent, animated: true)
    }
    
}
