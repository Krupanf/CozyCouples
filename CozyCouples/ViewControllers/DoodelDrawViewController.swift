

import UIKit

class DoodelDrawViewController: UIViewController {

    @IBOutlet weak var btnSendMsg: UIButton!
    @IBOutlet weak var txtMsg: UITextField!
    @IBOutlet weak var sendMSGBG: UIView!
    @IBOutlet weak var collectionCollection: UICollectionView!
    @IBOutlet weak var viewDraw: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgGlass: UIImageView!
    @IBOutlet weak var doodleView: DoodleView!
    
    var coupleId = ""
    let colorHexArray: [UIColor] = [
        UIColor(hex: "#FF6F61"),
        UIColor(hex: "#6B5B95"),
        UIColor(hex: "#88B04B"),
        UIColor(hex: "#F7CAC9"),
        UIColor(hex: "#92A8D1"),
        UIColor(hex: "#955251"),
        UIColor(hex: "#B565A7"),
        UIColor(hex: "#009B77"),
        UIColor(hex: "#DD4124"),
        UIColor(hex: "#45B8AC"),
        UIColor(hex: "#EFC050"),
        UIColor(hex: "#5B5EA6"),
        UIColor(hex: "#9B2335"),
        UIColor(hex: "#DFCFBE"),
        UIColor(hex: "#55B4B0")
    ]
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
            self.viewDraw.layer.cornerRadius = 20
            self.sendMSGBG.layer.cornerRadius = self.sendMSGBG.frame.height / 2
            self.btnSendMsg.layer.cornerRadius = self.btnSendMsg.frame.height / 2
            applyLeftToRightGradient(
                on: self.viewDraw,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            applyLeftToRightGradient(
                on: self.btnSendMsg,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            
            self.txtMsg.setAttributedPlaceholder(
                "Write your message",
                color: .white,
                alpha: 0.5
            )

            self.sendMSGBG.applyInnerShadows(cornerRadius: self.sendMSGBG   .frame.height/2)
            
        }
    }
    
    
    @IBAction func btnSendMsgAction(_ sender: UIButton) {
        
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnDrawTapped(_ sender: UIButton) {
        switch sender.tag
        {
        case 0:
            print("")
        case 1:
            print("")
        case 2:
            print("")
        case 3:
            print("")
        default:
            print("")
        }
    }
    
    @IBAction func slidderLineWidth(_ sender: Any) {
    }
    
}

extension DoodelDrawViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorHexArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionCollection.dequeueReusableCell(withReuseIdentifier: "ColourCollectionViewCell", for: indexPath)as!ColourCollectionViewCell
        cell.viewBg.backgroundColor =  colorHexArray[indexPath.item]
        if indexPath.item == 0
        {
            cell.colorWell.isHidden =  false
        }else{
            cell.colorWell.isHidden =  true
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 45, height: 45)
    }
    
}

extension DoodelDrawViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "DrawMessageTableViewCell", for: indexPath)as!DrawMessageTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
}


class ColourCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewBg: UIView!
    
    @IBOutlet weak var colorWell: UIColorWell!
    @IBOutlet weak var imgPlus: UIImageView!
    override func awakeFromNib() {
        DispatchQueue.main.async {
            [self]in
            self.viewBg.layer.cornerRadius = self.viewBg.frame.height/2
        }
        
    }
}

class DrawMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMsg: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

   

}
