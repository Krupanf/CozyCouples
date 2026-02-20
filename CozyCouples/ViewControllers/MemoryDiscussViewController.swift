import UIKit

class MemoryDiscussViewController: UIViewController {

    @IBOutlet weak var tblMessages: UITableView!
    @IBOutlet weak var btnSendMsg: UIButton!
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var sendMsgBGView: UIView!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var EditBGView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
            self.EditBGView.layer.cornerRadius = self.EditBGView.frame.height/2
            self.btnDelete.layer.cornerRadius = self.btnDelete.frame.height/2
            self.btnSendMsg.layer.cornerRadius = self.btnSendMsg.frame.height/2
            self.sendMsgBGView.layer.cornerRadius = self.sendMsgBGView.frame.height/2
            self.sendMsgBGView.applyInnerShadows(cornerRadius: self.sendMsgBGView   .frame.height/2)
            applyLeftToRightGradient(
                on: self.EditBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.2),UIColor(hex:"#B377FE").withAlphaComponent(0.2)]
            )
            
            applyLeftToRightGradient(
                on: self.btnSendMsg,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            self.txtMessage.setAttributedPlaceholder(
                "Write your message",
                color: .white,
                alpha: 0.5
            )
            
        }
    }

    @IBAction func btnBackAction(_ sender: UIButton) {
        
    }
    @IBAction func btnDeleteAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnEditAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnSendMsgAction(_ sender: UIButton) {
        
    }
    
}

extension MemoryDiscussViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row
        {
        case 0:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "SpeicalDetailsTableViewCell")as!SpeicalDetailsTableViewCell
            return cell
        case 1:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "SpeicalImageTableViewCell")as!SpeicalImageTableViewCell
            
            return cell
        case 2:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "ManSideTableViewCell")as!ManSideTableViewCell
            return cell
        case 3:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "GirlSideTableViewCell")as!GirlSideTableViewCell
            return cell

        default:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "SpeicalImageTableViewCell")as!SpeicalImageTableViewCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {

        if let cell = cell as? SpeicalImageTableViewCell {
            cell.animateProfiles()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row
        {
        case 0:
            return  280
        case 1:
            return  160
        default:
            return 100
        }
       
    }
    

}
