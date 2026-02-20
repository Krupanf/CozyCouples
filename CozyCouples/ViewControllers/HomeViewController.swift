import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tblCategory: UITableView!
    @IBOutlet weak var arrwowView: UIView!
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var newTrandingView: UIView!
    @IBOutlet weak var letsDrawBGVIew: UIView!
    @IBOutlet weak var trandingBGView: UIView!
    
    var arrimgPopular = ["img_intro09_01","img_intro09_02","img_intro09_04"]
    var arrStrPopular = ["Who’s Most\nLikely to?","Never Have\nI Ever","Answer with\nA Photo"]

    var arrimgCategory = ["img_intro09_03","img_wur","img_discuss"]
    var arrStrCategory = ["This or\nthat ?","Would You\nRather","Discuss\nBefore..."]

    var coupleId = ""
    var partnerId = ""
    
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
        self.letsDrawBGVIew.layer.cornerRadius = self.letsDrawBGVIew.frame.height / 2
        self.arrwowView.layer.cornerRadius = self.arrwowView.frame.height / 2
        self.trandingBGView.layer.cornerRadius = 23
        self.newTrandingView.layer.cornerRadius = 23
        self.newTrandingView.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMinYCorner
        ]
        
        applyLeftToRightGradient(
            on: self.letsDrawBGVIew,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
        )
        
        applyLeftToRightGradient(
            on: self.newTrandingView,
            colors: [UIColor(hex:"#DA22FF").withAlphaComponent(1.0),UIColor(hex:"#9733EE").withAlphaComponent(1.0)]
        )

        applyLeftToRightGradientBorder(
            on: self.trandingBGView,
            colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#E364F7"),UIColor(hex:"#CA77FE")],
            borderWidth: 3,
            cornerRadius: 23
        )
                
    }
    
    @IBAction func btnLetsDrawAction(_ sender: UIButton) {
        let push = self.storyboard?.instantiateViewController(withIdentifier: "DoodelDrawViewController") as! DoodelDrawViewController
        push.coupleId = self.coupleId
        navigationController?.pushViewController(push, animated: true)
    }
    
    @IBAction func btngetStartedAction(_ sender: UIButton) {
        let push = self.storyboard?.instantiateViewController(withIdentifier: "DailyChallengeViewController") as! DailyChallengeViewController
        navigationController?.pushViewController(push, animated: true)
    }
    
}


extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = self.tblCategory.dequeueReusableCell(withIdentifier: "DailyQuestionHomeTableViewCell") as! DailyQuestionHomeTableViewCell
            
            return cell
        }else{
            let cell = self.tblCategory.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 360
        }else{
            return 220
        }
    }
    
    
}
