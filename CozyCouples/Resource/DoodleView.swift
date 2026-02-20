//
//  DoodleView.swift
//  InLuvly
//
//  Created by Krupa Suthar on 20/12/25.
//

import UIKit

// MARK: - Stroke Model
struct LocalStroke {
    let path: UIBezierPath
    let color: UIColor
    let width: CGFloat
}

// MARK: - Doodle View
class DoodleView: UIView {

    // MARK: - Public Config
    var strokeColor: UIColor = UIColor(hex: "#964EEF")
    var strokeWidth: CGFloat = 4

    // Callback to Firebase
    var onStrokeFinished: (([CGPoint]) -> Void)?

    // MARK: - Private Properties
    private var currentPath = UIBezierPath()
    private var strokes: [LocalStroke] = []

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .clear
        isMultipleTouchEnabled = false
    }

    // MARK: - Touch Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentPath = UIBezierPath()
        currentPath.lineWidth = strokeWidth

        if let point = touches.first?.location(in: self) {
            currentPath.move(to: point)
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let point = touches.first?.location(in: self) {
            currentPath.addLine(to: point)
            setNeedsDisplay()
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        strokes.append(
            LocalStroke(
                path: currentPath,
                color: strokeColor,
                width: strokeWidth
            )
        )

        // 🔥 Send stroke points to Firebase
        let points = currentPath.cgPath.extractPoints()
        onStrokeFinished?(points)

        currentPath = UIBezierPath()
        setNeedsDisplay()
    }

    // MARK: - Drawing
    override func draw(_ rect: CGRect) {

        // Draw saved strokes
        strokes.forEach {
            $0.color.setStroke()
            $0.path.lineWidth = $0.width
            $0.path.stroke()
        }

        // Draw active stroke
        strokeColor.setStroke()
        currentPath.lineWidth = strokeWidth
        currentPath.stroke()
    }

    // MARK: - Clear Canvas
    func clearAll() {
        strokes.removeAll()
        currentPath = UIBezierPath()
        setNeedsDisplay()
    }

    // MARK: - Add Stroke from Firebase
    func addRemoteStroke(points: [CGPoint],
                         color: UIColor = UIColor(hex: "#964EEF"),
                         width: CGFloat = 4) {

        let path = UIBezierPath()
        path.lineWidth = width

        guard let first = points.first else { return }

        path.move(to: first)
        points.dropFirst().forEach { path.addLine(to: $0) }

        strokes.append(LocalStroke(path: path, color: color, width: width))
        setNeedsDisplay()
    }
}

// MARK: - CGPath Extension
extension CGPath {

    func extractPoints() -> [CGPoint] {
        var points: [CGPoint] = []

        applyWithBlock { element in
            let type = element.pointee.type
            let pts = element.pointee.points

            switch type {
            case .moveToPoint, .addLineToPoint:
                points.append(pts[0])
            default:
                break
            }
        }
        return points
    }
}
