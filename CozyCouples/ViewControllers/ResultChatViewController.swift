

import UIKit

class ResultChatViewController: UIViewController {

    @IBOutlet weak var txtMsg: UITextField!
    @IBOutlet weak var btnSendMsg: UIButton!
    @IBOutlet weak var sendMsgBGView: UIView!
    @IBOutlet weak var tblResult: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
            self.sendMsgBGView.layer.cornerRadius = self.sendMsgBGView.frame.height/2
            self.btnSendMsg.layer.cornerRadius = self.btnSendMsg.frame.height/2
            self.sendMsgBGView.applyInnerShadows(cornerRadius: self.sendMsgBGView.frame.height/2)
            
            applyLeftToRightGradient(
                on: self.btnSendMsg,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )
            
            self.txtMsg.setAttributedPlaceholder(
                "Write your answer",
                color: .white,
                alpha: 0.5
            )
            
        }
    }
    
    
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnSendMsgAction(_ sender: UIButton) {
    }
    
}

extension ResultChatViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            // 👨 Man Side Cell
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ManResultChatTableViewCell",
                for: indexPath
            ) as! ManResultChatTableViewCell
            
            
            return cell
            
        } else {
            // 👩 Girl Side Cell
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "GirlResultChatTableViewCell",
                for: indexPath
            ) as! GirlResultChatTableViewCell
            
            
            return cell
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
