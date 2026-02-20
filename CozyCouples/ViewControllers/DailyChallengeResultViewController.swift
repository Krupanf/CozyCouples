
import UIKit

class DailyChallengeResultViewController: UIViewController {

    @IBOutlet weak var tblAnswers: UITableView!
    @IBOutlet weak var lblWaitingTitle: UILabel!
    @IBOutlet weak var lblDis: UILabel!
    @IBOutlet weak var lblYourAnswers: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension DailyChallengeResultViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblcell = self.tblAnswers.dequeueReusableCell(withIdentifier: "DailyChallengeResultTableViewCell") as! DailyChallengeResultTableViewCell
        
        return tblcell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164
    }
    
    
}
