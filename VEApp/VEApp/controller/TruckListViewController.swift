//
//  TruckListViewController.swift
//  VEApp
//
//  Created by Rabitha N. on 12/11/24.
//

import Foundation

import UIKit

class TruckListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var trucks: [Truck] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up the table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TruckTableViewCell", bundle: nil), forCellReuseIdentifier: "TruckCell")
        // Set up the table view to use automatic row heights
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300 // Estimate a reasonable height, e.g., 80 points
        
        // Parse JSON data
        loadTrucksData()
    }
    
    func loadTrucksData() {
          // Dummy data for testing
        trucks = [
            Truck(id: "KA02HG1287", registrationNumber: "MAT788052P7C06674", status: "Running", speed: 20, fuelLevel: 90,adBlueLevel: 80,lastLocation: "Location XYZ", lastUpdated: "14:45:00, 13 Dec 23", distanceToService: "270 km", hoursToService: "5 hours",tripFuelEfficiency: "12 kmpl",engineTemperature:"24°C",outsideTemperature: "24°C",issues: ["Def Tank Level Warning", "Engine Torque Reduction"],faults: ["P203C", "P20E8"],driverName: "Guljule Singh", driverId: "DR988399184", driverPhone: "984729842", licenseNumber: "9356396529732"),
            Truck(id: "KA02HG1288", registrationNumber: "MAT788052P7C06675", status: "idle", speed: 20, fuelLevel: 90,adBlueLevel: 80,lastLocation: "Location XYZ", lastUpdated: "14:45:00, 13 Dec 23", distanceToService: "270 km", hoursToService: "5 hours",tripFuelEfficiency: "12 kmpl",engineTemperature:"24°C",outsideTemperature: "24°C",issues: ["Def Tank Level Warning", "Engine Torque Reduction"],faults: ["P203C", "P20E8"],driverName: "Guljule Singh", driverId: "DR988399184", driverPhone: "984729842", licenseNumber: "9356396529732"),
            Truck(id: "KA02HG1289", registrationNumber: "MAT788052P7C06676", status: "halt", speed: 20, fuelLevel: 90,adBlueLevel: 80,lastLocation: "Location XYZ", lastUpdated: "14:45:00, 13 Dec 23", distanceToService: "270 km", hoursToService: "5 hours",tripFuelEfficiency: "12 kmpl",engineTemperature:"24°C",outsideTemperature: "24°C",issues: ["Def Tank Level Warning", "Engine Torque Reduction"],faults: ["P203C", "P20E8"],driverName: "Guljule Singh", driverId: "DR988399184", driverPhone: "984729842", licenseNumber: "9356396529732"),
            Truck(id: "KA02HG1286", registrationNumber: "MAT788052P7C06677", status: "Running", speed: 20, fuelLevel: 90,adBlueLevel: 80,lastLocation: "Location XYZ", lastUpdated: "14:45:00, 13 Dec 23", distanceToService: "270 km", hoursToService: "5 hours",tripFuelEfficiency: "12 kmpl",engineTemperature:"24°C",outsideTemperature: "24°C",issues: ["Def Tank Level Warning", "Engine Torque Reduction"],faults: ["P203C", "P20E8"],driverName: "Guljule Singh", driverId: "DR988399184", driverPhone: "984729842", licenseNumber: "9356396529732"),
            Truck(id: "KA02HG1285", registrationNumber: "MAT788052P7C06678", status: "idle", speed: 20, fuelLevel: 90,adBlueLevel: 80,lastLocation: "Location XYZ", lastUpdated: "14:45:00, 13 Dec 23", distanceToService: "270 km", hoursToService: "5 hours",tripFuelEfficiency: "12 kmpl",engineTemperature:"24°C",outsideTemperature: "24°C",issues: ["Def Tank Level Warning", "Engine Torque Reduction"],faults: ["P203C", "P20E8"],driverName: "Guljule Singh", driverId: "DR988399184", driverPhone: "984729842", licenseNumber: "9356396529732"),
            Truck(id: "KA02HG1281", registrationNumber: "MAT788052P7C06679", status: "halt", speed: 20, fuelLevel: 90,adBlueLevel: 80,lastLocation: "Location XYZ", lastUpdated: "14:45:00, 13 Dec 23", distanceToService: "270 km", hoursToService: "5 hours",tripFuelEfficiency: "12 kmpl",engineTemperature:"24°C",outsideTemperature: "24°C",issues: ["Def Tank Level Warning", "Engine Torque Reduction"],faults: ["P203C", "P20E8"],driverName: "Guljule Singh", driverId: "DR988399184", driverPhone: "984729842", licenseNumber: "9356396529732")
              // Add more vehicles as needed
          ]
          tableView.reloadData()
      }
    
    // MARK: - TableView DataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return trucks.count // Assuming one item per section
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10 // Space between cells
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear // Make footer background clear to create spacing effect
        return footerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TruckCell", for: indexPath) as! TruckTableViewCell
        let truck = trucks[indexPath.section]
        cell.configure(with: truck) // Custom method to configure cell content
        return cell
    }
    
    // MARK: - TableView Delegate Methods

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let truck = trucks[indexPath.section]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "TruckSubDetailViewController") as? TruckSubDetailViewController {
            detailVC.truck = truck
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
}
