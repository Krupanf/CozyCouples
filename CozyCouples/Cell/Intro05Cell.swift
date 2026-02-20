import UIKit

class Intro05Cell: UICollectionViewCell {
    
    @IBOutlet weak var tblView: UITableView!
    
    var selectedindex = 0
    var arrtitle = ["3 minutes / day","5 minutes / day","15 minutes / day","20 minutes / day"]
    
}

extension Intro05Cell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrtitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblView.dequeueReusableCell(withIdentifier: "tblcell") as! tblcell
        DispatchQueue.main.asyncAfter(wallDeadline: .now()){
            cell.bgView.layer.cornerRadius = cell.bgView.frame.height / 2
            applyLeftToRightGradientBorder(
                on: cell.bgView,
                colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#B377FE")],
                borderWidth: 3,
                cornerRadius: cell.bgView.frame.height / 2
            )
        }
        cell.lblTitle.text = self.arrtitle[indexPath.row]

        if indexPath.row == self.selectedindex{
            applyLeftToRightGradient(
                on: cell.bgView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )
        }else{
            applyLeftToRightGradient(
                on: cell.bgView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedindex = indexPath.row
        self.tblView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
