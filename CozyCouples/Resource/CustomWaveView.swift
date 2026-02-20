

import Foundation
import Foundation
import UIKit
 
class CircleWaveView: UIView {
    
    var percent: CGFloat = 50.0 { // 0 to 100
        didSet {
            setNeedsDisplay()
        }
    }
    var percentTextColor: UIColor = .white {
        didSet {
            setNeedsDisplay()
        }
    }
    var circleLineWidth: CGFloat = 1.5 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var innerBackgroundColor: UIColor = .black.withAlphaComponent(0.1) {
        didSet {
            setNeedsDisplay()
        }
    }
    private var waveOffset: CGFloat = 0.0
    private var displayLink: CADisplayLink?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        startWaveAnimation()
    }
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
        startWaveAnimation()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
//        startWaveAnimation()
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let radius = min(rect.width, rect.height) / 2 * 0.92
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        // Draw outer circle
        context.setLineWidth(circleLineWidth)
        context.setStrokeColor(UIColor.init(hex: "#B377FE").cgColor)
        context.addEllipse(in: CGRect(x: center.x - radius, y: center.y - radius,
                                      width: radius * 2, height: radius * 2))
        context.strokePath()
        
        // Clip to circle
        context.addEllipse(in: CGRect(x: center.x - radius, y: center.y - radius,
                                      width: radius * 2, height: radius * 2))
        context.clip()
        // Fill inner circle background
        context.setFillColor(innerBackgroundColor.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
        // Draw wave inside clipped circle
        let path = UIBezierPath()
        let lowFudge: CGFloat = 0.02
        let highFudge: CGFloat = 0.98
        let newPercent = lowFudge + (highFudge - lowFudge) * (percent / 100.0)
        let waveHeight = 0.02 * rect.height // Increased for visibility
        let yOffset = (1 - newPercent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        
        path.move(to: CGPoint(x: 0, y: yOffset + waveHeight * sin(waveOffset)))
        
        for angle in stride(from: 0, through: 360, by: 5) {
            let x = CGFloat(angle) / 360.0 * rect.width
            let y = yOffset + waveHeight * sin((CGFloat(angle) + waveOffset) * .pi / 180)
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.close()
        
        context.addPath(path.cgPath)
        context.setFillColor(UIColor.init(hex: "#B377FE").cgColor)
        context.fillPath()
        
        // Draw percentage text
        let percentString = "\(Int(percent))%"
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attrs: [NSAttributedString.Key: Any] = [
            .font: UIFont(name:"Fredoka-SemiBold", size: 0.1 * min(rect.width, rect.height)),
            .paragraphStyle: paragraphStyle,
            .foregroundColor: percentTextColor
        ]
        
        let attrString = NSAttributedString(string: percentString, attributes: attrs)
        let stringSize = attrString.size()
        let textRect = CGRect(x: center.x - stringSize.width / 2,
                              y: center.y +  stringSize.height + 20,
                             // y:  stringSize.height / 2,
                              width: stringSize.width,
                              height: stringSize.height)
        attrString.draw(in: textRect)
    }
    
    private func startWaveAnimation() {
        if displayLink != nil { return } // prevent multiple links
        displayLink = CADisplayLink(target: self, selector: #selector(updateWave))
        displayLink?.add(to: .main, forMode: .common) // .common avoids pause on scroll
    }
    
    @objc private func updateWave() {
        waveOffset += 2  // speed of wave animation
        if waveOffset >= 360 {
            waveOffset -= 360
        }
        setNeedsDisplay()
    }
    
    deinit {
        displayLink?.invalidate()
    }
}
