

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var imgGirl: UIImageView!
    @IBOutlet weak var stackView3: UIStackView!
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var StackView1: UIStackView!
    
    @IBOutlet weak var imgBgProfile: UIImageView!
    
    @IBOutlet weak var viewAbout: UIView!    
    @IBOutlet weak var viewSecond: UIView!
    @IBOutlet weak var viewThird: UIView!
    @IBOutlet weak var viewPurchase: UIView!
    @IBOutlet weak var switchVibration: UISwitch!
    @IBOutlet weak var lblSignOut: UILabel!
    @IBOutlet weak var lblKillo: UILabel!
    
    @IBOutlet weak var imgMe: UIImageView!
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            self.viewPurchase.layer.cornerRadius = 25
            self.viewPurchase.layer.borderWidth = 1.5
            self.viewPurchase.layer.borderColor = UIColor(hex: "#B377FE").cgColor
            self.stackView2.layer.cornerRadius = 21
            self.stackView3.layer.cornerRadius = 21
            self.viewAbout.layer.cornerRadius = 21
            self.stackView2.applyInnerShadows(cornerRadius: 21)
            self.stackView3.applyInnerShadows(cornerRadius: 21)
            self.viewAbout.applyInnerShadows(cornerRadius: 21)
            
            self.imgMe.layer.cornerRadius = self.imgMe.frame.height/2
            self.imgGirl.layer.cornerRadius = self.imgGirl.frame.height/2
            
            self.imgMe.layer.borderColor = UIColor.white.cgColor
            self.imgGirl.layer.borderColor = UIColor.white.cgColor
            
            self.imgMe.layer.borderWidth = 2
            self.imgGirl.layer.borderWidth = 2
            
        }
    }

    @IBAction func btnChangeProfile(_ sender: Any) {
        let alert = UIAlertController(
                title: "Change Profile Photo",
                message: nil,
                preferredStyle: .actionSheet
            )

            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                alert.addAction(UIAlertAction(title: "Camera", style: .default) { _ in
                    self.openCamera()
                })
            }

            alert.addAction(UIAlertAction(title: "Gallery", style: .default) { _ in
                self.openGallery()
            })

            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

            present(alert, animated: true)
    }
    
    @IBAction func switchVibration(_ sender: UISwitch) {
       
    }
    @IBAction func btnPurchaseTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func btnProfileModeSelected(_ sender: UIButton) {
        switch sender.tag
        {
            
        case 0:
            print("")
            let push = self.storyboard?.instantiateViewController(withIdentifier: "AccountDetailViewController")as!AccountDetailViewController
            navigationController?.pushViewController(push, animated: true)
        case 1:
            let push = self.storyboard?.instantiateViewController(withIdentifier: "AboutRealtionShipViewController")as!AboutRealtionShipViewController
            navigationController?.pushViewController(push, animated: true)
        case 3:
            break
//            let push = self.storyboard?.instantiateViewController(withIdentifier: "DistanceUnitViewController")as!DistanceUnitViewController
//            navigationController?.pushViewController(push, animated: true)
        case 4:
            let isPresent = self.storyboard?.instantiateViewController(withIdentifier: "EnableLocationViewController")as!EnableLocationViewController
            isPresent.modalPresentationStyle = .fullScreen
            isPresent.isCloseTapped =
            {
                
            }
            present(isPresent, animated: true)
        case 5:
            print("")
        case 6:
            print("")
        case 7: break
        case 10:break
        case 11:break
        case 12:break
        case 13:break
        default:
            print("")
        }
    }
}

extension ProfileViewController
{
    func openCamera() {
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }

    func openGallery() {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
}
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        if let editedImage = info[.editedImage] as? UIImage {
            imgMe.image = editedImage
            handlePostLogin()
        } else if let originalImage = info[.originalImage] as? UIImage {
            imgMe.image = originalImage
            handlePostLogin()
        }
       
        picker.dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}


extension ProfileViewController
{
    func handlePostLogin() {
        
    }
}
