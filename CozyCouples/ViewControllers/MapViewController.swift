import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var btnLocationPoint: UIButton!
    @IBOutlet weak var viewLocation: UIView!
    @IBOutlet weak var txtLocationget: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var viewTable: UIView!

    var locationManager = CLLocationManager()
    var searchResults: [MKMapItem] = []
    var currentCoordinate: CLLocationCoordinate2D?
    var isLiveLocationRequested = false
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewTable.isHidden = true

        tblView.delegate = self
        tblView.dataSource = self

        txtLocationget.delegate = self
        txtLocationget.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)

        mapView.delegate = self

        setupLocation()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideTableView()
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            self.viewLocation.layer.cornerRadius = self.viewLocation.frame.height / 2
            self.btnLocationPoint.layer.cornerRadius = self.btnLocationPoint.frame.height / 2
            self.btnSelect.layer.cornerRadius = self.btnSelect.frame.height / 2
            
            applyLeftToRightGradient(
                on: self.viewLocation,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(0.1),UIColor(hex:"#B377FE").withAlphaComponent(0.1)]
            )

            applyLeftToRightGradient(
                on: self.btnLocationPoint,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )

            applyLeftToRightGradient(
                on: self.btnSelect,
                colors: [UIColor(hex:"#964EEF").withAlphaComponent(1.0),UIColor(hex:"#B377FE").withAlphaComponent(1.0)]
            )
            
            self.txtLocationget.setAttributedPlaceholder(
                "Search City, Country, States...",
                color: .white,
                alpha: 0.5
            )

        }
        
    }


    // MARK: - Actions
    @IBAction func btnBackTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func btnLiveLocation(_ sender: Any) {
        isLiveLocationRequested = true
        checkLocationPermission()
    }
    

    @IBAction func btnLocationTapped(_ sender: Any) {
        guard let coordinate = currentCoordinate else {
            return
        }

        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, _ in
            if let place = placemarks?.first {
                self.txtLocationget.text = place.name
            }
        }
    }

    @IBAction func btnSelectTapped(_ sender: Any) { }

    // MARK: - Table Animation
    func showTableView() {
        guard viewTable.isHidden else { return }
        viewTable.alpha = 0
        viewTable.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.viewTable.alpha = 1
        }
    }

    func hideTableView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.viewTable.alpha = 0
        }) { _ in
            self.viewTable.isHidden = true
        }
    }

    // MARK: - Search
    @objc func textDidChange(_ textField: UITextField) {
        guard let text = textField.text, !text.isEmpty else {
            searchResults.removeAll()
            tblView.reloadData()
            hideTableView()
            return
        }

        showTableView()
        searchPlaces(query: text)
    }

    func searchPlaces(query: String) {
        guard let coordinate = currentCoordinate else { return }

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 2000,
            longitudinalMeters: 2000
        )

        MKLocalSearch(request: request).start { response, error in
            guard let response = response else { return }

            DispatchQueue.main.async {
                self.searchResults = response.mapItems
                self.tblView.reloadData()
            }
        }
    }

    // MARK: - Location Setup
    func setupLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        if CLLocationManager.locationServicesEnabled() {
            checkLocationPermission()
        }
    }

    func checkLocationPermission() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()

        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true

        case .denied, .restricted:
            showLocationPermissionAlert()

        @unknown default:
            break
        }
    }

    func showLocationPermissionAlert() {
        let alert = UIAlertController(
            title: "Location Permission Needed",
            message: "Please allow location access to save special places and memories.",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Open Settings", style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        })

        present(alert, animated: true)
    }
}
extension MapViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "LocationSearchTableViewCell",
            for: indexPath
        ) as! LocationSearchTableViewCell

        let item = searchResults[indexPath.row]
        cell.lblCountry.text = item.name
        cell.lblDetails.text = item.placemark.title

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = searchResults[indexPath.row]
        txtLocationget.text = item.name

        mapView.removeAnnotations(mapView.annotations)

        let annotation = MKPointAnnotation()
        annotation.coordinate = item.placemark.coordinate
        annotation.title = item.name
        mapView.addAnnotation(annotation)

        mapView.setCenter(annotation.coordinate, animated: true)
        hideTableView()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
extension MapViewController: MKMapViewDelegate, UITextFieldDelegate {
    
}
extension MapViewController: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationPermission()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        currentCoordinate = location.coordinate

        let region = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: 800,
            longitudinalMeters: 800
        )
        mapView.setRegion(region, animated: true)

        if isLiveLocationRequested {
            isLiveLocationRequested = false
            manager.stopUpdatingLocation()
            updateTextFieldWithAddress(location)
        }
    }
    func updateTextFieldWithAddress(_ location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            guard let place = placemarks?.first else { return }

            let name = place.name ?? ""
            let city = place.locality ?? ""
            let country = place.country ?? ""

            let fullAddress = [name, city, country]
                .filter { !$0.isEmpty }
                .joined(separator: ", ")

            DispatchQueue.main.async {
                self.txtLocationget.text = fullAddress
            }
        }
    }

//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//
//        currentCoordinate = location.coordinate
//        manager.stopUpdatingLocation()
//
//        let region = MKCoordinateRegion(
//            center: location.coordinate,
//            latitudinalMeters: 1000,
//            longitudinalMeters: 1000
//        )
//        mapView.setRegion(region, animated: true)
//    }
}



class LocationSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCountry: UILabel!
    
    @IBOutlet weak var lblDetails: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

   

}
