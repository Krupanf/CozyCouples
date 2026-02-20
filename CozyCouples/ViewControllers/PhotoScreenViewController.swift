
import UIKit

class PhotoScreenViewController: UIViewController {

    @IBOutlet weak var photocollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

extension PhotoScreenViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.photocollectionView.dequeueReusableCell(withReuseIdentifier: "photocollectionViewCell", for: indexPath) as! photocollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.photocollectionView.frame.width/3
        return CGSize(width: width, height: width * 1.4)
    }
    
}




class photocollectionViewCell : UICollectionViewCell{
    @IBOutlet weak var BGVIew: UIView!
    @IBOutlet weak var imgMainImage: UIImageView!
    
    @IBOutlet weak var imgCheck: UIImageView!
    @IBOutlet weak var imgUser: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.imgUser.layer.cornerRadius = self.imgUser.frame.height/2
            self.imgUser.layer.borderColor = UIColor.white.cgColor
            self.imgUser.layer.borderWidth = 0.5
            
            self.imgMainImage.layer.cornerRadius = 20
            self.imgMainImage.layer.borderColor = UIColor.white.cgColor
            self.imgMainImage.layer.borderWidth = 1
        }
    }
}
