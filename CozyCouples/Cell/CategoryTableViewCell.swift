

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet var lblCategoryName: UILabel!
    @IBOutlet var collectionView: UICollectionView!
        
    var arrimgPopular = ["img_intro09_01","img_intro09_02","img_intro09_04"]
    var arrStrPopular = ["Who’s Most\nLikely to?","Never Have\nI Ever","Answer with\nA Photo"]
  
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CategoryTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrimgPopular.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let colcell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCell", for: indexPath) as! HomeCategoryCell
        DispatchQueue.main.async {
            colcell.BGView.layer.cornerRadius = 19
            colcell.lblSection.text = self.arrStrPopular[indexPath.item]
            colcell.imgSection.image = UIImage(named: self.arrimgPopular[indexPath.item])
            
            if indexPath.item == 0{
                applyRightTopToLeftBottomGradient(on: colcell.BGView, colors: [UIColor(hex:"#380965"),UIColor(hex:"#240046")])
            }else  if indexPath.item == 1{
                applyRightTopToLeftBottomGradient(on: colcell.BGView, colors: [UIColor(hex:"#3D38B4"),UIColor(hex:"#3A0CA3")])
            }else  if indexPath.item == 2{
                applyRightTopToLeftBottomGradient(on: colcell.BGView, colors: [UIColor(hex:"#5A0295"),UIColor(hex:"#4D027F")])
            }
            
        }
        return colcell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height * 0.95, height: collectionView.frame.height)
    }
    
}
