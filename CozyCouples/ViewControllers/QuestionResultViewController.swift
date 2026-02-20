
import UIKit

class QuestionResultViewController: UIViewController {

    @IBOutlet weak var tblResult: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        
    }
    
    
    
}

extension QuestionResultViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblcell = self.tblResult.dequeueReusableCell(withIdentifier: "QuestionResultTableViewCell") as! QuestionResultTableViewCell
        
        if indexPath.row == 0 {
            tblcell.BGVIew.backgroundColor = UIColor(hex: "#039435").withAlphaComponent(0.1)
            tblcell.User1Answer.backgroundColor = UIColor(hex: "#039435").withAlphaComponent(0.2)
            tblcell.User2Answer.backgroundColor = UIColor(hex: "#039435").withAlphaComponent(0.2)
            
            tblcell.lblUser1Answer.textColor = UIColor(hex: "#039435").withAlphaComponent(1.0)
            tblcell.lblUser2Anser.textColor = UIColor(hex: "#039435").withAlphaComponent(1.0)
            
            tblcell.BGVIew.layer.borderWidth = 2
            tblcell.BGVIew.layer.borderColor = UIColor(hex: "#039435").withAlphaComponent(0.6).cgColor

        }else{
            tblcell.BGVIew.backgroundColor = UIColor(hex: "#F04F4F").withAlphaComponent(0.1)
            tblcell.User1Answer.backgroundColor = UIColor(hex: "#F04F4F").withAlphaComponent(0.2)
            tblcell.User2Answer.backgroundColor = UIColor(hex: "#F04F4F").withAlphaComponent(0.2)
            
            tblcell.lblUser1Answer.textColor = UIColor(hex: "#F04F4F").withAlphaComponent(1.0)
            tblcell.lblUser2Anser.textColor = UIColor(hex: "#F04F4F").withAlphaComponent(1.0)
            
            tblcell.BGVIew.layer.borderWidth = 1
            tblcell.BGVIew.layer.borderColor = UIColor(hex: "#F04F4F").cgColor
        }
        return tblcell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
}
