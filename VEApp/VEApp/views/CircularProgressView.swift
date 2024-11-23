import UIKit

class CircularProgressView: UIView {

    private let progressLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()

    var progress: CGFloat = 0 {
        didSet {
            updateProgress()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        // Create the track layer (background circle)
        trackLayer.path = circularPath().cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 5
        trackLayer.lineCap = .round
        layer.addSublayer(trackLayer)

        // Create the progress layer (foreground circle)
        progressLayer.path = circularPath().cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.systemBlue.cgColor
        progressLayer.lineWidth = 5
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0 // Start at 0 progress
        layer.addSublayer(progressLayer)
    }

    private func circularPath() -> UIBezierPath {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius = min(bounds.width, bounds.height) / 2 - 5
        return UIBezierPath(arcCenter: center,
                            radius: radius,
                            startAngle: -CGFloat.pi / 2,
                            endAngle: 3 * CGFloat.pi / 2,
                            clockwise: true)
    }
    

    private func updateProgress() {
        progressLayer.strokeEnd = progress
    }
}

