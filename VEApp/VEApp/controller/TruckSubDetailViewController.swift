//
//  TruckSubDetailViewController.swift
//  VEApp
//
//  Created by Rabitha N. on 12/11/24.
//

import UIKit
import Foundation
import UIKit

class TruckSubDetailViewController: UIViewController {
    var truck: Truck?

    @IBOutlet weak var registrationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var fuelLevelLabel: UILabel!
    @IBOutlet weak var adBlueLevelLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let truck = truck {
            registrationLabel.text = truck.registrationNumber
            statusLabel.text = truck.status
            speedLabel.text = "\(truck.speed) km/h"
            fuelLevelLabel.text = "\(truck.fuelLevel)%"
            adBlueLevelLabel.text = "\(truck.adBlueLevel)%"
            locationLabel.text = truck.lastLocation
            lastUpdatedLabel.text = "Last Updated: \(truck.lastUpdated)"
        }
    }
    
    @IBAction func showInDepthDetails(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let inDepthDetailVC = storyboard.instantiateViewController(withIdentifier: "TruckInDepthDetailViewController") as? TruckInDepthDetailViewController {
            inDepthDetailVC.truck = truck
            navigationController?.pushViewController(inDepthDetailVC, animated: true)
        }
    }
}
