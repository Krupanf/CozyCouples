
import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var continueBGView: UIView!
    
    private let totalPages = 14
    private var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        progressView.progress = 1 / Float(totalPages)
        btnBack.isHidden =  true
        collectionView.isScrollEnabled =  false

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1){
            self.continueBGView.layer.cornerRadius = self.continueBGView.frame.height / 2
            applyLeftToRightGradient(
                on: self.continueBGView,
                colors: [UIColor(hex:"#964EEF"),UIColor(hex:"#B377FE")]
            )
        }
    }
    
    @IBAction func btnContinueAction(_ sender: UIButton) {
        guard currentIndex < totalPages - 1 else {
//            if isCongrouOpen
//            {
                let push = self.storyboard?.instantiateViewController(
                    withIdentifier: "HomeTabViewController"
                ) as! HomeTabViewController
                    AppConstants.isNotFirstTimeAppLaunchPersistent = true
                self.navigationController?.pushViewController(push, animated: true)
//            }
            return
        }
        
        currentIndex += 1
        let indexPath = IndexPath(item: currentIndex, section: 0)
        collectionView.scrollToItem(
            at: indexPath,
            at: .centeredHorizontally,
            animated: true
        )
        
        let progressValue = Float(currentIndex + 1) / Float(totalPages)
        progressView.setProgress(progressValue, animated: true)
        updateBackButtonVisibility()   // ✅ ADD THIS
    }
    
    private func updateBackButtonVisibility() {
        btnBack.isHidden = (currentIndex == 0)
    }
    
    @IBAction func btnloginWithGoogleAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnLoginWithApple(_ sender: UIButton) {
        
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        guard currentIndex > 0 else { return }

        currentIndex -= 1

        let indexPath = IndexPath(item: currentIndex, section: 0)
        collectionView.scrollToItem(
            at: indexPath,
            at: .centeredHorizontally,
            animated: true
        )

        let progressValue = Float(currentIndex + 1) / Float(totalPages)
        progressView.setProgress(progressValue, animated: true)
    }
    
    
}

extension IntroViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalPages
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch indexPath.item
        {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro01Cell",
                for: indexPath
            ) as! Intro01Cell
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro02Cell",
                for: indexPath
            ) as! Intro02Cell
            
            
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro03Cell",
                for: indexPath
            ) as! Intro03Cell
            
            
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro04Cell",
                for: indexPath
            ) as! Intro04Cell
            
            
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro05Cell",
                for: indexPath
            ) as! Intro05Cell
            
            
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro06Cell",
                for: indexPath
            ) as! Intro06Cell
            
            
            return cell
        case 6:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro07Cell",
                for: indexPath
            ) as! Intro07Cell
            
            
            return cell
        case 7:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro08Cell",
                for: indexPath
            ) as! Intro08Cell
            return cell
        case 8:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro09Cell",
                for: indexPath
            ) as! Intro09Cell
            return cell
        case 9:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro10Cell",
                for: indexPath
            ) as! Intro10Cell
            return cell
        case 10:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro11Cell",
                for: indexPath
            ) as! Intro11Cell
            return cell
        case 11:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro12Cell",
                for: indexPath
            ) as! Intro12Cell
            return cell
        case 12:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro13Cell",
                for: indexPath
            ) as! Intro13Cell
            return cell
        case 13:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro14Cell",
                for: indexPath
            ) as! Intro14Cell
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Intro01Cell",
                for: indexPath
            ) as! Intro01Cell
            
            return cell
        }
        
    }
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        currentIndex = page

        let progressValue = Float(currentIndex + 1) / Float(totalPages)
        progressView.setProgress(progressValue, animated: true)

        updateBackButtonVisibility()   // ✅ ADD THIS
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(
            title: "Oops",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
