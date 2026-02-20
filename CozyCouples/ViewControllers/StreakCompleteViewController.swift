
import UIKit

class StreakCompleteViewController: UIViewController {

    @IBOutlet weak var btnCommited: UIButton!
    
    @IBOutlet weak var lblDay: UILabel!
    
    @IBOutlet weak var lblDayStreak: UILabel!
    
    @IBOutlet weak var lblNewChalange: UILabel!
    
    @IBOutlet weak var lblUnstop: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.btnCommited.layer.cornerRadius = self.btnCommited.frame.height/2
            applyLeftToRightGradient(
                on: self.btnCommited,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)])
        
        }
    }
    
    @IBAction func btnCommitedTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
