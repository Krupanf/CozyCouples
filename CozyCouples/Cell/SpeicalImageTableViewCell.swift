import UIKit

class SpeicalImageTableViewCell: UITableViewCell {

    @IBOutlet weak var imgRelation: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.imgRelation.layer.cornerRadius = 20
        }
    }

    func animateProfiles() {

        // Always reset first (important for reused cells)
        imgRelation.layer.removeAllAnimations()
        imgRelation.transform = .identity

        let offScreenLeft = -contentView.bounds.width

        // Start position (off-screen + rotated)
        imgRelation.transform = CGAffineTransform(translationX: offScreenLeft, y: 50)
            .rotated(by: degrees(-12))

        imgRelation.alpha = 0

        UIView.animate(
            withDuration: 1.2,
            delay: 0,
            usingSpringWithDamping: 0.75,
            initialSpringVelocity: 0.6,
            options: [.curveEaseOut]
        ) {
            // End position (slightly tilted)
            self.imgRelation.transform = CGAffineTransform(rotationAngle: self.degrees(-6))
            self.imgRelation.alpha = 1
        }
    }

    // MARK: - Degree to Radian helper
    private func degrees(_ value: CGFloat) -> CGFloat {
        return value * .pi / 180
    }
}
