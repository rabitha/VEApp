//
//  TruckInDepthDetailViewController.swift
//  VEApp
//
//  Created by Rabitha N. on 12/11/24.
//

import Foundation
import UIKit

class TruckInDepthDetailViewController: UIViewController {
    var truck: Truck?

    @IBOutlet weak var registrationLabel: UILabel!
    @IBOutlet weak var distanceToServiceLabel: UILabel!
    @IBOutlet weak var hoursToServiceLabel: UILabel!
    @IBOutlet weak var tripFuelEfficiencyLabel: UILabel!
    @IBOutlet weak var engineTemperatureLabel: UILabel!
    @IBOutlet weak var outsideTemperatureLabel: UILabel!
    @IBOutlet weak var issuesLabel: UILabel!
    @IBOutlet weak var faultsLabel: UILabel!
    @IBOutlet weak var driverNameLabel: UILabel!
    @IBOutlet weak var driverIdLabel: UILabel!
    @IBOutlet weak var driverPhoneLabel: UILabel!
    @IBOutlet weak var licenseNumberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let truck = truck {
            registrationLabel.text = truck.registrationNumber
            distanceToServiceLabel.text = "Distance to Service: \(truck.distanceToService)"
            hoursToServiceLabel.text = "Hours to Service: \(truck.hoursToService)"
            tripFuelEfficiencyLabel.text = "Trip Fuel Efficiency: \(truck.tripFuelEfficiency)"
            engineTemperatureLabel.text = "Engine Temperature: \(truck.engineTemperature)"
            outsideTemperatureLabel.text = "Outside Temperature: \(truck.outsideTemperature)"
            issuesLabel.text = "Issues: \(truck.issues.joined(separator: ", "))"
            faultsLabel.text = "Faults: \(truck.faults.joined(separator: ", "))"
            driverNameLabel.text = "Driver: \(truck.driverName)"
            driverIdLabel.text = "Driver ID: \(truck.driverId)"
            driverPhoneLabel.text = "Phone: \(truck.driverPhone)"
            licenseNumberLabel.text = "License: \(truck.licenseNumber)"
        }
    }
}
