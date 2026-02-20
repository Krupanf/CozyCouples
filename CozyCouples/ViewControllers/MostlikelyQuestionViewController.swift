
import UIKit

class MostlikelyQuestionViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tblQuestions: UITableView!
    @IBOutlet weak var collactionView: UICollectionView!
    var arrSection = ["All","Today","Photo","Completed"]
    var selectedIndex = 0
    
    var arrquestions = ["What was the first thing you noticed about your partner?","Did your parents’ relationship influence how you feel about marriage ?","What was the first thing you noticed about your partner?","Did your parents’ relationship influence how you feel about marriage ?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if self.selectedIndex == 2{
            self.tblQuestions.isHidden = true
            self.containerView.isHidden = false
        }else{
            self.tblQuestions.isHidden = false
            self.containerView.isHidden = true
        }
    }
    
    
    @IBAction func btnAnswerAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnUnlockAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnCompletedAction(_ sender: UIButton) {
        
    }
    
    
}

extension MostlikelyQuestionViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSection.count
        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let colcell = self.collactionView.dequeueReusableCell(withReuseIdentifier: "MostlikelycollectionViewCell", for: indexPath) as! MostlikelycollectionViewCell
        DispatchQueue.main.async {
            colcell.BGView.layer.cornerRadius = colcell.BGView.frame.height/2
        }
        colcell.BGView.layoutIfNeeded()
        colcell.mostlikelyLabel.text = self.arrSection[indexPath.row]
        if self.selectedIndex == indexPath.item{
            applyLeftToRightGradient(
                on: colcell.BGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )
        }else{
            applyLeftToRightGradient(
                on: colcell.BGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )
        }
        return colcell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.item
        self.collactionView.reloadData()
        self.tblQuestions.reloadData()
        if self.selectedIndex == 2{
            self.tblQuestions.isHidden = true
            self.containerView.isHidden = false
        }else{
            self.tblQuestions.isHidden = false
            self.containerView.isHidden = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = arrSection[indexPath.row]
        let font = UIFont(name: "Poppins-SemiBold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .semibold)
        let fontAttributes = [NSAttributedString.Key.font: font]
        let labelSize = (text as NSString).size(withAttributes: fontAttributes)
        let width = labelSize.width + 50
        return CGSize(width: width, height: collectionView.frame.height)
    }
}


extension MostlikelyQuestionViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblcell = self.tblQuestions.dequeueReusableCell(withIdentifier: "tblQuestionCell") as! tblQuestionCell
        tblcell.lblQuestion.text = arrquestions[indexPath.row]
        tblcell.lblNoQuestion.text = "\(indexPath.row + 1)."
        if indexPath.row == 0{
            tblcell.AnsweBGView.isHidden = false
            tblcell.UnlockBGVIew.isHidden = true
        }else{
            tblcell.AnsweBGView.isHidden = true
            tblcell.UnlockBGVIew.isHidden = false
        }
        tblcell.setup(index: selectedIndex)
        return tblcell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

class MostlikelycollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var mostlikelyLabel: UILabel!
    
}


class tblQuestionCell : UITableViewCell{
    
    @IBOutlet weak var completeBGVIew: UIView!
    @IBOutlet weak var check2: UIView!
    @IBOutlet weak var check1: UIView!
    @IBOutlet weak var UnlockBGVIew: UIView!
    @IBOutlet weak var AnsweBGView: UIView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var lblNoQuestion: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.bgView.layer.cornerRadius = 23
            self.img1.layer.cornerRadius = self.img1.frame.height/2
            self.img2.layer.cornerRadius = self.img2.frame.height/2
            self.AnsweBGView.layer.cornerRadius = self.AnsweBGView.frame.height/2
            self.UnlockBGVIew.layer.cornerRadius = self.UnlockBGVIew.frame.height/2
            self.check1.layer.cornerRadius = self.check1.frame.height/2
            self.check2.layer.cornerRadius = self.check2.frame.height/2
            self.completeBGVIew.layer.cornerRadius = self.completeBGVIew.frame.height/2
            self.img1.layer.borderWidth = 0.5
            self.img1.layer.borderColor = UIColor(hex: "#FFFFFF").cgColor
            self.img2.layer.borderWidth = 0.5
            self.img2.layer.borderColor = UIColor(hex: "#FFFFFF").cgColor
            self.setIndex()
        }
    }
    
    func setup(index:Int){
        self.bgView.layoutIfNeeded()
        self.AnsweBGView.layoutIfNeeded()
        self.UnlockBGVIew.layoutIfNeeded()
        if index == 3{
            self.check1.isHidden = false
            self.check2.isHidden = false
            self.completeBGVIew.isHidden = false
            self.AnsweBGView.isHidden = true
            self.UnlockBGVIew.isHidden = true
            applyLeftToRightGradient(
                on: self.bgView,
                colors: [UIColor(hex:"#039435").withAlphaComponent(0.1),UIColor(hex:"#039435").withAlphaComponent(0.1)]
            )
            applyLeftToRightGradientBorder(
                on: self.bgView,
                colors: [UIColor(hex:"#039435").withAlphaComponent(0.6),UIColor(hex:"#039435").withAlphaComponent(0.6)],
                borderWidth: 3,
                cornerRadius: 23
            )
        }else{
            self.setIndex()
        }
    }
    
    func setIndex(){
        self.check1.isHidden = true
        self.check2.isHidden = true
        self.completeBGVIew.isHidden = true
        applyLeftToRightGradient(
            on: self.bgView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
        )
        applyLeftToRightGradientBorder(
            on: self.bgView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.5),UIColor(hex:"#B377FE").withAlphaComponent(0.5)],
            borderWidth: 3,
            cornerRadius: 23
        )
        
        applyLeftToRightGradient(
            on: self.AnsweBGView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.15),UIColor(hex:"#B377FE").withAlphaComponent(0.15)]
        )
        
        applyLeftToRightGradient(
            on: self.UnlockBGVIew,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.15),UIColor(hex:"#B377FE").withAlphaComponent(0.15)]
        )
    }
}
