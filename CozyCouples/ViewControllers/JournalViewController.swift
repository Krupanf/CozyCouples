import UIKit

class JournalViewController: UIViewController {

    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var imageBG3: UIView!
    @IBOutlet weak var imageBG2: UIView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var imageBG1: UIView!
    @IBOutlet weak var EmptyView: UIView!
    @IBOutlet weak var lblTheBigning: UILabel!
    @IBOutlet weak var lblyouareall: UILabel!
    @IBOutlet weak var checkmarkView: UIView!
    @IBOutlet weak var tblJournal: UITableView!
    
    var isappear = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.checkmarkView.isHidden = true
        self.lblyouareall.isHidden = true
        self.lblTheBigning.isHidden = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            self.checkmarkView.layer.cornerRadius = self.checkmarkView.frame.size.height/2
            
            self.imageBG1.layer.cornerRadius = 20
            self.imageBG1.layer.borderWidth = 1
            self.imageBG1.layer.borderColor = UIColor(hex: "#B377FE").cgColor
            self.img1.layer.cornerRadius = 20
            self.imageBG1.applyShadow(
                color: UIColor(hex: "#B377FE"),
                opacity: 0.4,
                offset: CGSize(width: 0, height: 0),
                radius: 4,
                cornerRadius: 20
            )

            self.imageBG2.layer.cornerRadius = 20
            self.imageBG2.layer.borderWidth = 1
            self.imageBG2.layer.borderColor = UIColor(hex: "#B377FE").cgColor
            self.img2.layer.cornerRadius = 20
            self.imageBG2.applyShadow(
                color: UIColor(hex: "#B377FE"),
                opacity: 0.4,
                offset: CGSize(width: 0, height: 0),
                radius: 4,
                cornerRadius: 20
            )

            self.imageBG3.layer.cornerRadius = 20
            self.imageBG3.layer.borderWidth = 1
            self.imageBG3.layer.borderColor = UIColor(hex: "#B377FE").cgColor
            self.img3.layer.cornerRadius = 20
            self.imageBG3.applyShadow(
                color: UIColor(hex: "#B377FE"),
                opacity: 0.4,
                offset: CGSize(width: 0, height: 0),
                radius: 4,
                cornerRadius: 20
            )
            
            if !self.isappear{
                self.isappear = true
                self.imageBG2.transform = CGAffineTransform(rotationAngle: (-13).toRadians)
                self.imageBG3.transform = CGAffineTransform(rotationAngle: (4).toRadians)
            }

            
        }
    }
    


}

extension JournalViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblcell = self.tblJournal.dequeueReusableCell(withIdentifier: "JournalTableViewCell") as! JournalTableViewCell
        
        return tblcell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}
