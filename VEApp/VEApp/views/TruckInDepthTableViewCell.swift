//
//  TruckInDepthTableViewCell.swift
//  VEApp
//
//  Created by Rabitha N. on 19/11/24.
//

import UIKit

class TruckInDepthTableViewCell: UITableViewCell {
    //weak var delegate: TruckSubDetailsTableViewCellDelegate?
    var truck: Truck?
    
    var shapeLayer1: CAShapeLayer!
    var shapeLayer2: CAShapeLayer!
    var circularPath1: UIBezierPath!
    var circularPath2: UIBezierPath!
    
    @IBOutlet weak var truckInDepthDetailsView: UIView!
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
    // ProgressView outlets
    @IBOutlet weak var dieselCircularView: CircularProgressView!
    @IBOutlet weak var adBlueCircularView: CircularProgressView!
    @IBOutlet weak var centalLbl: UILabel!
    @IBOutlet weak var btmLbl1: UILabel!
    @IBOutlet weak var centalLbl2: UILabel!
    @IBOutlet weak var btmLbl2: UILabel!
    @IBOutlet weak var lineView1: UIView!
    
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l4: UILabel!
    @IBOutlet weak var l5: UILabel!
    @IBOutlet weak var l6: UILabel!
    
    @IBOutlet weak var m1: UILabel!
    @IBOutlet weak var m2: UILabel!
    @IBOutlet weak var m3: UILabel!
    @IBOutlet weak var m4: UILabel!
    @IBOutlet weak var m5: UILabel!
    @IBOutlet weak var m6: UILabel!
    
    @IBOutlet weak var r1: UILabel!
    @IBOutlet weak var r2: UILabel!
    @IBOutlet weak var r3: UILabel!
    @IBOutlet weak var r4: UILabel!
       
    override func awakeFromNib() {
        super.awakeFromNib()
        truckInDepthDetailsView.layer.cornerRadius = 10.0
    }
    
    /// Configures the cell with a `Truck` object.
    /// - Parameter truck: The `Truck` model containing data for this cell.
    func configure(with truck: Truck) {
        // Store the truck object
        self.truck = truck
        
        // Set the registration label
        registrationLabel.text = truck.registrationNumber
        
        // Set status image and color
        let imgName = commonMethods().passStatusGetImgName(st: truck.status)
        statusLabelImg.image = UIImage(named: imgName)
        
        let truckStatusColor = commonMethods().passStatusGetColor(st: truck.status)
        leftLabelView.backgroundColor = UIColor(named: truckStatusColor)
        
        // Set labels for additional details
        bottomLabel.text = truck.registrationNumber
        rightLbl1.text = truck.distanceToService
        rightLbl2.text = truck.hoursToService
        rightLbl3.text = truck.tripFuelEfficiency
        bottomLbl1.text = truck.lastLocation
        bottomLbl2.text = "Last Updated on: \(truck.lastUpdated)"
        
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
        
        m1.text = truck.distanceToService
        m2.text = truck.hoursToService
        m3.text = truck.tripAFuelEfficiencyKM
        m4.text = truck.tripBFuelEfficiencyKM
        m5.text = truck.engineTemperature
        m6.text = truck.outsideTemperature
        
        r1.text = truck.distanceToServiceStatus
        r2.text = truck.hoursToServiceStatus
        r3.text = truck.tripAFuelEfficiencykmpl
        r4.text = truck.tripBFuelEfficiencykmpl        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
