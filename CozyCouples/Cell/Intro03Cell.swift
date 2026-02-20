import UIKit

class Intro03Cell: UICollectionViewCell {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDatePicker()
    }

    private func setupDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.setValue(UIColor.white, forKey: "textColor")
    }
}
