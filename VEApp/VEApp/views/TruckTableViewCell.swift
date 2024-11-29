//
//  TruckTableViewCell.swift
//  VEApp
//
//  Created by Rabitha N. on 12/11/24.
//

import UIKit

class TruckTableViewCell: UITableViewCell {
    
    @IBOutlet weak var truckDetailView: UIView!
    @IBOutlet weak var leftLabelView: UIView!
    @IBOutlet weak var registrationLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var statusLabelImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        truckDetailView.layer.cornerRadius = 12
        truckDetailView.backgroundColor = UIColor.white
    }

    func configure(with truck: Truck) {
        registrationLabel.text = truck.id
        let imgName = commonMethods().passStatusGetImgName(st: truck.status)
        statusLabelImg.image =  UIImage(named: imgName)
        let truckStatusColor = commonMethods().passStatusGetColor(st: truck.status)
        leftLabelView.backgroundColor = UIColor(named: truckStatusColor)
        bottomLabel.text = truck.registrationNumber
     }      
}
