import UIKit

class exclusiveQuestionsViewController: UIViewController {

    @IBOutlet weak var tblQuestions: UITableView!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var questionBGView: UIView!
    
    var selectedindex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
            self.questionBGView.layer.cornerRadius = self.questionBGView.frame.height/2
            applyLeftToRightGradient(
                on: self.questionBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            

        }
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
    }
    
    @IBAction func btnSkipAction(_ sender: UIButton) {
    }
        
}

extension exclusiveQuestionsViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblcell = self.tblQuestions.dequeueReusableCell(withIdentifier: "questioncell") as! questioncell
        DispatchQueue.main.async {
            tblcell.BGVIew.layer.cornerRadius = tblcell.BGVIew.frame.height/2
        }
        DispatchQueue.main.async {
            if indexPath.row ==  self.selectedindex{
                applyLeftToRightGradient(
                    on: tblcell.BGVIew,
                    colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
                )
                applyLeftToRightGradientBorder(
                    on: tblcell.BGVIew,
                    colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)],
                    borderWidth: 3,
                    cornerRadius: tblcell.BGVIew.frame.height / 2
                )
            }else{
                applyLeftToRightGradient(
                    on: tblcell.BGVIew,
                    colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
                )
                applyLeftToRightGradientBorder(
                    on: tblcell.BGVIew,
                    colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.5),UIColor(hex:"#B377FE").withAlphaComponent(0.5)],
                    borderWidth: 3,
                    cornerRadius: tblcell.BGVIew.frame.height / 2
                )
            }
        }
        return tblcell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedindex = indexPath.row
        DispatchQueue.main.async {
            self.tblQuestions.reloadData()
        }
    }
}




class questioncell : UITableViewCell{
    
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var BGVIew: UIView!
}
