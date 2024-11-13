//
//  TruckSubDetailsTableViewCell.swift
//  VEApp
//
//  Created by Rabitha N. on 13/11/24.
//

import UIKit

class TruckSubDetailsTableViewCell: UITableViewCell {
    var shapeLayer1: CAShapeLayer!
    var shapeLayer2: CAShapeLayer!
    var circularPath1: UIBezierPath!
    var circularPath2: UIBezierPath!
    
    @IBOutlet weak var truckSubDetailsView: UIView!
    @IBOutlet weak var leftLabelView: UIView!
    @IBOutlet weak var registrationLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var statusLabelImg: UIImageView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var rightLbl1: UILabel!
    @IBOutlet weak var rightLbl2: UILabel!
    @IBOutlet weak var rightLbl3: UILabel!
    @IBOutlet weak var bottomLbl1: UILabel!
    @IBOutlet weak var bottomLbl2: UILabel!
    @IBOutlet weak var DetailsBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCircles()
    }
    
        
    private func setupCircles() {
            // Define radius and positioning offsets
            let radius: CGFloat = 40.0
            let circleSpacing: CGFloat = 10.0
            
            // Calculate the centers for both circles to be side-by-side
            let center1 = CGPoint(x: subView.frame.size.width / 4 - circleSpacing, y: subView.frame.size.height / 2)
            let center2 = CGPoint(x: (3 * subView.frame.size.width) / 4 + circleSpacing, y: subView.frame.size.height / 2)

            // Create paths for each circle
            circularPath1 = UIBezierPath(arcCenter: center1, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi - CGFloat.pi / 2, clockwise: true)
            circularPath2 = UIBezierPath(arcCenter: center2, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi - CGFloat.pi / 2, clockwise: true)

            // Setup the first shape layer
            shapeLayer1 = CAShapeLayer()
            shapeLayer1.path = circularPath1.cgPath
            shapeLayer1.fillColor = UIColor.clear.cgColor
            shapeLayer1.strokeColor = UIColor.blue.cgColor
            shapeLayer1.lineWidth = 8
            shapeLayer1.lineCap = .round
            shapeLayer1.strokeEnd = 0.0

            // Setup the second shape layer
            shapeLayer2 = CAShapeLayer()
            shapeLayer2.path = circularPath2.cgPath
            shapeLayer2.fillColor = UIColor.clear.cgColor
            shapeLayer2.strokeColor = UIColor.red.cgColor
            shapeLayer2.lineWidth = 8
            shapeLayer2.lineCap = .round
            shapeLayer2.strokeEnd = 0.0

            // Add the shape layers to the subView's layer
            subView.layer.addSublayer(shapeLayer1)
            subView.layer.addSublayer(shapeLayer2)

            // Animate the circles with different progress values
            animateProgress(for: shapeLayer1, to: 0.75) // 75% for first circle
            animateProgress(for: shapeLayer2, to: 0.5)  // 50% for second circle
        }
    
    private func animateProgress(for shapeLayer: CAShapeLayer, to progress: CGFloat) {
         let animation = CABasicAnimation(keyPath: "strokeEnd")
         animation.fromValue = 0.0
         animation.toValue = progress
         animation.duration = 2.0
         animation.fillMode = .forwards
         animation.isRemovedOnCompletion = false
         shapeLayer.add(animation, forKey: "progressAnimation")
     }

    func configure(with truck: Truck) {
        registrationLabel.text = truck.id
        let imgName = commonMethods().passStatusGetImgName(st: truck.status)
        statusLabelImg.image =  UIImage(named: imgName)
        let truckStatusColor = commonMethods().passStatusGetColor(st: truck.status)
        print("truckStatusColor: \(truckStatusColor)")
        leftLabelView.backgroundColor = UIColor(named: truckStatusColor)
        bottomLabel.text = truck.registrationNumber
     }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
