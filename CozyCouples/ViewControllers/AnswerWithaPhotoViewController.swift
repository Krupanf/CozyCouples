
import UIKit

class AnswerWithaPhotoViewController: UIViewController {

    @IBOutlet weak var NotifyBGVIew: UIView!
    @IBOutlet weak var tblQuestions: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblNoQuestion: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            self.NotifyBGVIew.layer.cornerRadius = self.NotifyBGVIew.frame.height/2
            applyLeftToRightGradient(
                on: self.NotifyBGVIew,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )
        }
    }
    
    
    @IBAction func btnNotifyAction(_ sender: UIButton) {
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
    }
}

extension AnswerWithaPhotoViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let photocell = self.tblQuestions.dequeueReusableCell(withIdentifier: "AnswerWithaPhotoCell") as! AnswerWithaPhotoCell
            
            return photocell
        }else{
            let mancell = self.tblQuestions.dequeueReusableCell(withIdentifier: "ManSideTableViewCell") as! ManSideTableViewCell
            
            return mancell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 170
        }else{
            return 100
        }
       
    }
    
}
