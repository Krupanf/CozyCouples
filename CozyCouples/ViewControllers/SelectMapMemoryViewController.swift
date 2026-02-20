
import UIKit
import MapKit

class SelectMapMemoryViewController: UIViewController {

    @IBOutlet weak var AddMemoryBGView: UIView!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lblCities: UILabel!
    @IBOutlet weak var lblCountries: UILabel!
    @IBOutlet weak var SelectedCityBGView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            self.AddMemoryBGView.layer.cornerRadius = self.AddMemoryBGView.frame.height / 2
            self.btnPlus.layer.cornerRadius = self.btnPlus.frame.height / 2
            self.SelectedCityBGView.layer.cornerRadius = 10
            
            applyLeftToRightGradient(
                on: self.AddMemoryBGView,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )

            self.SelectedCityBGView.applyInnerShadows(cornerRadius: 10)

        }
        
    }
    
    
    @IBAction func btnBackAction(_ sender: UIButton) {
    }
    
    @IBAction func btnAddMemoryAction(_ sender: UIButton) {
    }
    
}
