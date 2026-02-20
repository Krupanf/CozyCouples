import UIKit

class Intro08Cell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    override func awakeFromNib() {
        DispatchQueue.main.asyncAfter(wallDeadline: .now()){
            let fullText = "Save Your\nFavourite Moments"
            
            let regularFont = UIFont(name: "Poppins-Bold", size: 26)
            ?? UIFont.boldSystemFont(ofSize: 26)
            
            let boldFont = UIFont(name: "Poppins-Bold", size: 26)
            ?? UIFont.boldSystemFont(ofSize: 26)
            
            let attributedString = NSMutableAttributedString(
                string: fullText,
                attributes: [
                    .font: regularFont,
                    .foregroundColor: UIColor(hex: "#FFFFFF")
                ]
            )
            
            let range = (fullText as NSString).range(of: "Favourite Moments")
            
            if range.location != NSNotFound {
                attributedString.addAttributes([
                    .font: boldFont,
                    .foregroundColor: UIColor(hex: "#B377FE")
                ], range: range)
            }
            
            self.lblTitle.attributedText = attributedString
        }
    }
}

extension Intro08Cell : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row
        {
        case 0:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "JournalTableViewCell")as!JournalTableViewCell
            return cell
        case 1:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "JournalWithImageTableViewCell")as!JournalWithImageTableViewCell
            return cell
        case 2:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "JournalContentTableViewCell")as!JournalContentTableViewCell
            return cell
        case 3:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "JournalContentPurposeTableViewCell")as!JournalContentPurposeTableViewCell
            return cell
        default:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "JournalTableViewCell")as!JournalTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row
        {
        case 0:
            return 70
        case 1:
            return 240
        case 3:
            return 86
        default:
            return 150
        }
    }
    
//    func tableView(_ tableView: UITableView,
//                   willDisplay cell: UITableViewCell,
//                   forRowAt indexPath: IndexPath) {
//
//        cell.transform = CGAffineTransform(translationX: 0, y: 50)
//        cell.alpha = 0
//
//        let delay = 0.05 * Double(indexPath.row)
//
//        UIView.animate(
//            withDuration: 0.4,
//            delay: delay,
//            usingSpringWithDamping: 0.8,
//            initialSpringVelocity: 0.5,
//            options: [.curveEaseOut],
//            animations: {
//                cell.transform = .identity
//                cell.alpha = 1
//            },
//            completion: nil
//        )
//    }
}
