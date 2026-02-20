import UIKit

class MemoryViewController: UIViewController {

    @IBOutlet weak var icnTime: UIImageView!
    @IBOutlet weak var icnDate: UIImageView!
    @IBOutlet weak var btnNextArrow: UIButton!
    @IBOutlet weak var lblCharactor: UILabel!
    @IBOutlet weak var txtMemory: UITextField!
    @IBOutlet weak var memoryBGView: UIView!
    @IBOutlet weak var notesCollectionView: UICollectionView!
    @IBOutlet weak var txtNotes: UITextView!
    @IBOutlet weak var notesBGView: UIView!
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var imgLocation: UIImageView!
    @IBOutlet weak var locationBGView: UIView!
    @IBOutlet weak var timeBGView: UIView!
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var dateBGView: UIView!
    @IBOutlet weak var saveBGView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtNotes.setPlaceholder(
            "Write a few words about this memory",
            color: .white
        )
        txtNotes.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            self.setupUI()
        }
    }

    func setupUI(){
        self.saveBGView.layer.cornerRadius = self.saveBGView.frame.height/2
        self.memoryBGView.layer.cornerRadius = self.memoryBGView.frame.height/2
        self.dateBGView.layer.cornerRadius = self.dateBGView.frame.height/2
        self.timeBGView.layer.cornerRadius = self.timeBGView.frame.height/2
        self.locationBGView.layer.cornerRadius = self.locationBGView.frame.height/2
        self.notesBGView.layer.cornerRadius = 23
        
        applyLeftToRightGradient(
            on: self.saveBGView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
        )

        applyLeftToRightGradient(
            on: self.memoryBGView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
        )

        applyLeftToRightGradient(
            on: self.dateBGView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
        )

        applyLeftToRightGradient(
            on: self.timeBGView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
        )

        applyLeftToRightGradient(
            on: self.locationBGView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
        )

        applyLeftToRightGradient(
            on: self.notesBGView,
            colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
        )

        self.txtMemory.setAttributedPlaceholder(
            "Enter memory name",
            color: .white,
            alpha: 0.5
        )

        self.txtDate.setAttributedPlaceholder(
            "DD-MM-YYYY",
            color: .white,
            alpha: 0.5
        )

        self.txtTime.setAttributedPlaceholder(
            "12:00 AM",
            color: .white,
            alpha: 0.5
        )

        self.txtLocation.setAttributedPlaceholder(
            "Select your location",
            color: .white,
            alpha: 0.5
        )
        
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSaveAction(_ sender: UIButton) {
    }
    
    @IBAction func btnDateAction(_ sender: UIButton) {
    }
    
    @IBAction func btnTimeAction(_ sender: UIButton) {
    }
    
    @IBAction func btnLocationAction(_ sender: UIButton) {
    }
}


extension MemoryViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "addMemoryCell", for: indexPath) as! addMemoryCell
        
        DispatchQueue.main.async {
            collectionViewCell.BGView.layer.cornerRadius = 10
        }
        
        if indexPath.row == 0 {
            collectionViewCell.imgAlbum.isHidden = false
            collectionViewCell.imgMemory.isHidden = true
        }else{
            collectionViewCell.imgAlbum.isHidden = true
            collectionViewCell.imgMemory.isHidden = false
        }
        collectionViewCell.shadowView.applyInnerShadows(cornerRadius: 10)
        
        return collectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 75)
    }
    
}

extension MemoryViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.clearPlaceholder(color: .white)
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        textView.restorePlaceholder(
            "Write a few words about this memory",
            color: .white
        )
    }
}
