
import Foundation
import UIKit

func applyLeftToRightGradient(on view: UIView, colors: [UIColor]) {

    let gradientKey = "InternalLeftToRightGradientKey"

    // Remove existing gradient
    view.layer.sublayers?.removeAll {
        ($0.value(forKey: "gradientKey") as? String) == gradientKey
    }

    // Gradient needs minimum 2 colors
    guard colors.count >= 2 else { return }

    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds

    // ✅ UIColor → CGColor
    gradientLayer.colors = colors.map { $0.cgColor }

    gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
    gradientLayer.endPoint   = CGPoint(x: 1, y: 0.5)

    gradientLayer.setValue(gradientKey, forKey: "gradientKey")

    view.layer.insertSublayer(gradientLayer, at: 0)
}

func applyRightTopToLeftBottomGradient(
    on view: UIView,
    colors: [UIColor]
) {

    let gradientKey = "InternalRightTopToLeftBottomGradientKey"

    // Remove existing gradient
    view.layer.sublayers?.removeAll {
        ($0.value(forKey: "gradientKey") as? String) == gradientKey
    }

    guard colors.count >= 2 else { return }

    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    gradientLayer.colors = colors.map { $0.cgColor }

    // 🔥 Direction: Right-Top ➜ Left-Bottom
    gradientLayer.startPoint = CGPoint(x: 1, y: 0)
    gradientLayer.endPoint   = CGPoint(x: 0, y: 1)

    gradientLayer.setValue(gradientKey, forKey: "gradientKey")

    view.layer.insertSublayer(gradientLayer, at: 0)
}


extension UIColor {
    convenience init(hex: String, defaultColor: UIColor = .clear,alpha : CGFloat = 1) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            self.init(cgColor: defaultColor.cgColor)
            return
        }

        if hexSanitized.count == 6 {
            self.init(
                red: CGFloat((rgb >> 16) & 0xFF) / 255,
                green: CGFloat((rgb >> 8) & 0xFF) / 255,
                blue: CGFloat(rgb & 0xFF) / 255,
                alpha: alpha
            )
        } else {
            self.init(cgColor: defaultColor.cgColor)
        }
    }
}

func applyTopCornerRadius(_ radius: CGFloat, to view: UIView) {
    view.layer.cornerRadius = radius
    view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    view.layer.masksToBounds = true
}

func applyLeftToRightGradientBorder(
    on view: UIView,
    colors: [UIColor],
    borderWidth: CGFloat,
    cornerRadius: CGFloat = 0
) {
    let gradientKey = "LeftToRightGradientBorderKey"

    // Remove existing gradient border
    view.layer.sublayers?.removeAll {
        ($0.value(forKey: "gradientBorderKey") as? String) == gradientKey
    }

    // Need at least 2 colors
    guard colors.count >= 2 else { return }

    // Gradient layer
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    gradientLayer.colors = colors.map { $0.cgColor }
    gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
    gradientLayer.endPoint   = CGPoint(x: 1, y: 0.5)

    // Shape layer for border
    let shapeLayer = CAShapeLayer()
    shapeLayer.lineWidth = borderWidth
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = UIColor.black.cgColor // required but overridden by mask
    shapeLayer.path = UIBezierPath(
        roundedRect: view.bounds,
        cornerRadius: cornerRadius
    ).cgPath

    // Mask gradient with shape
    gradientLayer.mask = shapeLayer

    // Store internal key
    gradientLayer.setValue(gradientKey, forKey: "gradientBorderKey")

    view.layer.addSublayer(gradientLayer)
}

extension UIView {

    func applyInnerShadows(cornerRadius: CGFloat) {
        layer.masksToBounds = true

        // Remove existing inner shadows
        layer.sublayers?
            .filter { $0.name == "InnerShadowLayer" }
            .forEach { $0.removeFromSuperlayer() }

        // Common path
        let path = UIBezierPath(
            roundedRect: bounds.insetBy(dx: -20, dy: -20),
            cornerRadius: cornerRadius
        )
        let innerPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: cornerRadius
        )
        path.append(innerPath)
        path.usesEvenOddFillRule = true

        // ---------- Inner Shadow 1 ----------
        let shadow1 = CAShapeLayer()
        shadow1.name = "InnerShadowLayer"
        shadow1.frame = bounds
        shadow1.fillRule = .evenOdd
        shadow1.path = path.cgPath
        shadow1.shadowColor = UIColor(hex: "#B377FE").cgColor
        shadow1.shadowOffset = CGSize(width: -4, height: -4)
        shadow1.shadowOpacity = 0.4
        shadow1.shadowRadius = 6
        shadow1.compositingFilter = "multiplyBlendMode"

        // ---------- Inner Shadow 2 ----------
        let shadow2 = CAShapeLayer()
        shadow2.name = "InnerShadowLayer"
        shadow2.frame = bounds
        shadow2.fillRule = .evenOdd
        shadow2.path = path.cgPath
        shadow2.shadowColor = UIColor(hex: "#B377FE").cgColor
        shadow2.shadowOffset = CGSize(width: 0, height: -2)
        shadow2.shadowOpacity = 0.9
        shadow2.shadowRadius = 6

        layer.addSublayer(shadow1)
        layer.addSublayer(shadow2)
    }
}


extension UILabel {

    func applyLeftToRightGradient(
        colors: [UIColor]
    ) {
        // Remove old gradient
        layer.sublayers?
            .filter { $0.name == "GradientTextLayer" }
            .forEach { $0.removeFromSuperlayer() }

        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "GradientTextLayer"
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }

        // 🔥 Equal distribution
        let count = colors.count
        gradientLayer.locations = (0..<count).map {
            NSNumber(value: Float($0) / Float(count - 1))
        }

        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)

        // Text mask
        let textMask = CATextLayer()
        textMask.string = text
        textMask.frame = bounds
        textMask.font = font
        textMask.fontSize = font.pointSize
        textMask.alignmentMode = .center
        textMask.contentsScale = UIScreen.main.scale

        gradientLayer.mask = textMask
        layer.addSublayer(gradientLayer)

        textColor = .clear
    }
}


extension UITextField {
    func setAttributedPlaceholder(
        _ text: String,
        color: UIColor,
        alpha: CGFloat = 1.0
    ) {
        self.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: color.withAlphaComponent(alpha)
            ]
        )
    }
}


extension UIView {
    
    func applyShadow(
        color: UIColor = .black,
        opacity: Float = 0.3,
        offset: CGSize = CGSize(width: 0, height: 3),
        radius: CGFloat = 5,
        cornerRadius: CGFloat? = nil
    ) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
    }
}

extension Int {
    var toRadians: CGFloat {
        return CGFloat(self) * .pi / 180
    }
}


extension UITextView {

    func setPlaceholder(_ text: String, color: UIColor) {
        self.text = text
        self.textColor = color.withAlphaComponent(0.5)
    }

    func clearPlaceholder(color: UIColor) {
        if self.textColor?.cgColor.alpha == 0.5 {
            self.text = ""
            self.textColor = color
        }
    }

    func restorePlaceholder(_ text: String, color: UIColor) {
        if self.text.isEmpty {
            self.text = text
            self.textColor = color.withAlphaComponent(0.5)
        }
    }
}
