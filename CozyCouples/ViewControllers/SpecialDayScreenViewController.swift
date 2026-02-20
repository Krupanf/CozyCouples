
import UIKit

class SpecialDayScreenViewController: UIViewController {

    @IBOutlet weak var imgTopBG: UIImageView!
    @IBOutlet weak var deleteBGView: UIView!
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var icnAlarm: UIImageView!
    @IBOutlet weak var colorCollactionView: UICollectionView!
    @IBOutlet weak var icnEmogi: UIImageView!
    @IBOutlet weak var emogiBGView: UIView!
    @IBOutlet weak var lblMonthAgo: UILabel!
    @IBOutlet weak var lblNODay: UILabel!
    @IBOutlet weak var lblAniverciry: UILabel!
    @IBOutlet weak var saveBGView: UIView!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var ivnCalander: UIImageView!
    @IBOutlet weak var DateBGView: UIView!
    @IBOutlet weak var TimeBGView: UIView!
    
    
    
    @IBOutlet weak var messageBGVIew: UIView!
    @IBOutlet weak var txtMessage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            self.setupUI()
        }
    }

    func setupUI(){
        self.saveBGView.layer.cornerRadius = self.saveBGView.frame.height/2
        self.imgTopBG.layer.cornerRadius = 13
        self.DateBGView.layer.cornerRadius = self.DateBGView.frame.height/2
        self.TimeBGView.layer.cornerRadius = self.TimeBGView.frame.height/2
        self.emogiBGView.layer.cornerRadius = self.emogiBGView.frame.height/2
        self.messageBGVIew.layer.cornerRadius = self.messageBGVIew.frame.height/2
        self.deleteBGView.layer.cornerRadius = self.deleteBGView.frame.height/2
        
        self.deleteBGView.layer.borderColor = UIColor(hex:"#F04F4F").cgColor
        self.deleteBGView.layer.borderWidth = 1
        
        applyLeftToRightGradient(
            on: self.saveBGView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
        )

        applyLeftToRightGradient(
            on: self.emogiBGView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
        )

        applyLeftToRightGradient(
            on: self.messageBGVIew,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
        )

        applyLeftToRightGradient(
            on: self.DateBGView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
        )

        applyLeftToRightGradient(
            on: self.TimeBGView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
        )
        

        self.txtMessage.setAttributedPlaceholder(
            "Enter special day",
            color: .white,
            alpha: 0.5
        )

        self.txtDate.setAttributedPlaceholder(
            "DD-MM-YYYY",
            color: .white,
            alpha: 0.5
        )

        self.txtTime.setAttributedPlaceholder(
            "12:00 AM",
            color: .white,
            alpha: 0.5
        )

        
    }

    

    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSaveAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnEmogiAction(_ sender: UIButton) {
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnTimeAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnDeleteAction(_ sender: UIButton) {
        
    }
}

extension SpecialDayScreenViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.colorCollactionView.dequeueReusableCell(withReuseIdentifier: "coloucollectionviewcell", for: indexPath) as! coloucollectionviewcell
        DispatchQueue.main.async {
            cell.colorBGVIew.layer.cornerRadius = cell.colorBGVIew.frame.height/2
        }
        if indexPath.item == 0 {
            cell.colouimageview.isHidden = false
        }else{
            cell.colouimageview.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.colorCollactionView.frame.height, height: self.colorCollactionView.frame.height)
    }
    
}






class coloucollectionviewcell: UICollectionViewCell {
    
    @IBOutlet weak var colorBGVIew: UIView!
    @IBOutlet weak var colouimageview: UIImageView!
    
}
