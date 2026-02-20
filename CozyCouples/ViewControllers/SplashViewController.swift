
import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.goToNextScreen()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func goToNextScreen() {
        if AppConstants.isNotFirstTimeAppLaunchPersistent {
            let push = storyboard?.instantiateViewController(
                withIdentifier: "HomeTabViewController"
            ) as! HomeTabViewController
            navigationController?.pushViewController(push, animated: true)
        } else {
            showIntroScreen()
        }
    }

    func showIntroScreen() {
        let push = storyboard?.instantiateViewController(
            withIdentifier: "GetStartedVC"
        ) as! GetStartedVC
        navigationController?.pushViewController(push, animated: true)
    }



}
