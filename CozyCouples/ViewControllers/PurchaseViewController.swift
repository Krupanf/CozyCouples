
import UIKit

class PurchaseViewController: UIViewController {

    
    @IBOutlet weak var yearlyGradientView: UIView!
    @IBOutlet weak var monthalyGradientView: UIView!
    
    @IBOutlet weak var imgArrow1: UIImageView!
    @IBOutlet weak var imgArrow2: UIImageView!
    @IBOutlet weak var btnPurchase: UIButton!
    @IBOutlet weak var btnYearly: UIButton!
    @IBOutlet weak var btnMonthly: UIButton!
    @IBOutlet weak var viewYearly: UIView!
    @IBOutlet weak var btnTerm: UILabel!
    @IBOutlet weak var viewMonthly: UIView!
    @IBOutlet weak var collectionView1: UICollectionView!
    
    var autoScrollTimer: Timer?

    let scrollSpeed1: CGFloat = 0.5   // Monthly speed
    let scrollSpeed2: CGFloat = 0.8   // Yearly speed (different = not same index)
    
    var arrSection = ["👑  Premium for you and clara","👑  3000+ coupl games and questions","👑  Premium for you and clara","👑  3000+ coupl games and questions","👑  Premium for you and clara","👑  3000+ coupl games and questions",  "👑  Premium for you and clara","👑  3000+ coupl games and questions","👑  Premium for you and clara","👑  3000+ coupl games and questions"]

    var arrSectionColor = ["#172700","#003047","#172700","#003047","#172700","#003047","#172700","#003047","#172700","#003047"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnProductSelect(btnYearly)
        startAutoScroll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            
            self.btnPurchase.layer.cornerRadius = self.btnPurchase.frame.height / 2
            self.monthalyGradientView.layer.cornerRadius = self.monthalyGradientView.frame.height / 2
            self.yearlyGradientView.layer.cornerRadius = self.yearlyGradientView.frame.height / 2
            self.viewMonthly.layer.cornerRadius = 20
            self.viewYearly.layer.cornerRadius = 20
            
            applyLeftToRightGradient(
                on: self.btnPurchase,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )

            applyLeftToRightGradient(
                on: self.monthalyGradientView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )

            applyLeftToRightGradient(
                on: self.yearlyGradientView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )

            applyLeftToRightGradient(
                on: self.yearlyGradientView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )

            applyLeftToRightGradient(
                on: self.viewMonthly,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.2),UIColor(hex:"#B377FE").withAlphaComponent(0.2)]
            )

            applyLeftToRightGradient(
                on: self.viewYearly,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.2),UIColor(hex:"#B377FE").withAlphaComponent(0.2)]
            )
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        autoScrollTimer?.invalidate()
    }
   
  
    @IBAction func btnPurchaseTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func btnCloseTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func btnProductSelect(_ sender: UIButton) {
        if sender.tag == 0
        {
            imgArrow1.isHidden = false
            imgArrow2.isHidden = true
            monthalyGradientView.isHidden = false
            yearlyGradientView.isHidden = true

            DispatchQueue.main.async {
                applyLeftToRightGradientBorder(
                    on: self.viewMonthly,
                    colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#B377FE")],
                    borderWidth: 3,
                    cornerRadius: 20
                )

                applyLeftToRightGradientBorder(
                    on: self.viewYearly,
                    colors: [UIColor.clear,UIColor.clear],
                    borderWidth: 3,
                    cornerRadius: 20
                )
            }
        }else{
            imgArrow1.isHidden = true
            imgArrow2.isHidden = false
            monthalyGradientView.isHidden = true
            yearlyGradientView.isHidden = false

            DispatchQueue.main.async {
                applyLeftToRightGradientBorder(
                    on: self.viewYearly,
                    colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#B377FE")],
                    borderWidth: 3,
                    cornerRadius: 20
                )

                applyLeftToRightGradientBorder(
                    on: self.viewMonthly,
                    colors: [UIColor.clear,UIColor.clear],
                    borderWidth: 3,
                    cornerRadius: 20
                )
            }
        }
    }
}
extension PurchaseViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PurchaseCollectionViewCell", for: indexPath)as! PurchaseCollectionViewCell
        cell.lblContent.text = arrSection[indexPath.row]
        cell.viewBg.backgroundColor = UIColor(hex: arrSectionColor[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = arrSection[indexPath.row]
        let font = UIFont(name: "Poppins-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular)
        let fontAttributes = [NSAttributedString.Key.font: font]
        let labelSize = (text as NSString).size(withAttributes: fontAttributes)
        let width = labelSize.width + 50
        return CGSize(width: width, height: collectionView.frame.height)
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        autoScrollTimer?.invalidate()
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        startAutoScroll()
    }
}

extension PurchaseViewController
{
    func startAutoScroll() {
           autoScrollTimer?.invalidate()

           autoScrollTimer = Timer.scheduledTimer(
               timeInterval: 0.02,   // smoother
               target: self,
               selector: #selector(smoothAutoScroll),
               userInfo: nil,
               repeats: true
           )
       }
    @objc func smoothAutoScroll() {

        // -------- CollectionView 1 --------
        let offsetX1 = collectionView1.contentOffset.x + scrollSpeed1
        let maxOffsetX1 = collectionView1.contentSize.width - collectionView1.bounds.width

        if offsetX1 >= maxOffsetX1 {
            collectionView1.contentOffset = CGPoint(x: 0, y: 0)
        } else {
            collectionView1.contentOffset = CGPoint(x: offsetX1, y: 0)
        }
    }

}



class PurchaseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var lblContent: UILabel!
    
    override func awakeFromNib() {
        DispatchQueue.main.async {
            self.viewBg.layer.cornerRadius = 10
            self.lblContent.font =  UIFont(name: "Poppins-Regular", size: 12)
        }
    }
}
