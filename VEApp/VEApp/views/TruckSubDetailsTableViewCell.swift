//
//  TruckSubDetailsTableViewCell.swift
//  VEApp
//
//  Created by Rabitha N. on 13/11/24.
//

import UIKit

class TruckSubDetailsTableViewCell: UITableViewCell {
    weak var delegate: TruckSubDetailsTableViewCellDelegate?
    var truck: Truck? 
    
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
    // ProgressView outlets
    @IBOutlet weak var dieselCircularView: CircularProgressView!
    @IBOutlet weak var adBlueCircularView: CircularProgressView!
    @IBOutlet weak var centalLbl: UILabel!
    @IBOutlet weak var btmLbl1: UILabel!
    @IBOutlet weak var centalLbl2: UILabel!
    @IBOutlet weak var btmLbl2: UILabel!
    @IBOutlet weak var rightLbl1: UILabel!
    @IBOutlet weak var rightLbl2: UILabel!
    @IBOutlet weak var rightLbl3: UILabel!
    @IBOutlet weak var bottomLbl1: UILabel!
    @IBOutlet weak var bottomLbl2: UILabel!
    @IBOutlet weak var DetailsBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        truckSubDetailsView.layer.cornerRadius = 10.0
        DetailsBtn.layer.cornerRadius = 10.0
    }

    func configure(with truck: Truck) {
        registrationLabel.text = truck.id
        let imgName = commonMethods().passStatusGetImgName(st: truck.status)
        statusLabelImg.image =  UIImage(named: imgName)
        let truckStatusColor = commonMethods().passStatusGetColor(st: truck.status)
        print("truck : \(truck)")
        leftLabelView.backgroundColor = UIColor(named: truckStatusColor)
        bottomLabel.text = truck.registrationNumber
        rightLbl1.text = truck.distanceToService
        rightLbl2.text = truck.hoursToService
        rightLbl3.text = truck.tripAFuelEfficiencyKM
        bottomLbl1.text = truck.lastLocation
        bottomLbl2.text = "last Updated on : \(truck.lastUpdated)"
        
        // Configure Diesel Circular View
        let dieselProgress = CGFloat(truck.dieselLevel) / CGFloat(truck.dieselCapacity)
        dieselCircularView.progress = dieselProgress
        centalLbl.text = "\(truck.dieselLevel)/\(truck.dieselCapacity)"
        btmLbl1.text = "Diesel"
        
        // Configure AdBlue Circular View
        print("111 ss adBlueCircularView frame: \(adBlueCircularView.frame)")
        let adBlueProgress = CGFloat(truck.adBlueLevel) / CGFloat(truck.adBlueCapacity)
        adBlueCircularView.progress = adBlueProgress
        centalLbl2.text = "\(truck.adBlueLevel)/\(truck.adBlueCapacity)"
        btmLbl2.text = "AdBlue"
     }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func detailsBtnAction(_ sender: Any) {
        guard let truck = truck else { return }
        delegate?.didTapDetailsButton(truck: truck)
    }
}
