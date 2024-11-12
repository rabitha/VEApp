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
        let imgName = passStatusGetImgName(st: truck.status)
        statusLabelImg.image =  UIImage(named: imgName)
        let truckStatusColor = passStatusGetColor(st: truck.status)
        print("truckStatusColor: \(truckStatusColor)")
        leftLabelView.backgroundColor = UIColor(named: truckStatusColor)
        bottomLabel.text = truck.registrationNumber
     }
    
    func passStatusGetColor(st:String)->String{
        switch st{
        case "idle" : return "orangeColor"
        case "halt" : return "redColor"
        default: return "greenColor"
        }
    }
    
    func passStatusGetImgName(st:String)->String{
        switch st{
        case "idle" : return "idle"
        case "halt" : return "halt"
        default: return "running"
        }
    }
    
}
