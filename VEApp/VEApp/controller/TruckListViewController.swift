//
//  TruckListViewController.swift
//  VEApp
//
//  Created by Rabitha N. on 12/11/24.
//

import Foundation

import UIKit

class TruckListViewController: BaseVC, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var trucks: [Truck] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up the table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TruckTableViewCell", bundle: nil), forCellReuseIdentifier: "TruckCell")
        tableView.register(UINib(nibName: "StatusViewTableViewCell", bundle: nil), forCellReuseIdentifier: "StatusViewTableViewCell")
        tableView.register(UINib(nibName: "SearchViewTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchViewTableViewCell")
        // Set up the table view to use automatic row heights
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80 // Estimate a reasonable height, e.g., 80 points
        
        // Parse JSON data
        loadTrucksData()
    }
    
    func loadTrucksData() {
          // Dummy data for testing
        trucks = [
            Truck(id: "KA02HG1287", registrationNumber: "MAT788052P7C06674", status: "Running", speed: 20, fuelLevel: 90,adBlueLevel: 20,lastLocation: "Location XYZ", lastUpdated: "14:45:00, 13 Dec 23", distanceToService: "270 km", hoursToService: "5 hours",distanceToServiceStatus:"Overdue",hoursToServiceStatus:"Overdue",tripAFuelEfficiencyKM: "12 kmpl",tripBFuelEfficiencyKM: "12",tripAFuelEfficiencykmpl: "12 kmpl",tripBFuelEfficiencykmpl: "12 kmpl",engineTemperature:"24°C",outsideTemperature: "24°C",issues: ["Def Tank Level Warning", "Engine Torque Reduction"],faults: ["P203C", "P20E8"],driverName: "Guljule Singh", driverId: "DR988399184", driverPhone: "984729842", licenseNumber: "9356396529732",dieselLevel: 20,dieselCapacity: 90,adBlueCapacity: 80),
            Truck(id: "KA02HG1288", registrationNumber: "MAT788052P7C06675", status: "idle", speed: 20, fuelLevel: 90,adBlueLevel: 20,lastLocation: "Location XYZ", lastUpdated: "14:45:00, 13 Dec 23", distanceToService: "270 km", hoursToService: "5 hours",distanceToServiceStatus:"Overdue",hoursToServiceStatus:"Overdue",tripAFuelEfficiencyKM: "12 kmpl",tripBFuelEfficiencyKM: "12",tripAFuelEfficiencykmpl: "12 kmpl",tripBFuelEfficiencykmpl: "12 kmpl",engineTemperature:"24°C",outsideTemperature: "24°C",issues: ["Def Tank Level Warning", "Engine Torque Reduction"],faults: ["P203C", "P20E8"],driverName: "Guljule Singh", driverId: "DR988399184", driverPhone: "984729842", licenseNumber: "9356396529732",dieselLevel: 20,dieselCapacity: 90,adBlueCapacity: 80),
            Truck(id: "KA02HG1289", registrationNumber: "MAT788052P7C06676", status: "halt", speed: 20, fuelLevel: 90,adBlueLevel: 20,lastLocation: "Location XYZ", lastUpdated: "14:45:00, 13 Dec 23", distanceToService: "270 km", hoursToService: "5 hours",distanceToServiceStatus:"Overdue",hoursToServiceStatus:"Overdue",tripAFuelEfficiencyKM: "12 kmpl",tripBFuelEfficiencyKM: "12",tripAFuelEfficiencykmpl: "12 kmpl",tripBFuelEfficiencykmpl: "12 kmpl",engineTemperature:"24°C",outsideTemperature: "24°C",issues: ["Def Tank Level Warning", "Engine Torque Reduction"],faults: ["P203C", "P20E8"],driverName: "Guljule Singh", driverId: "DR988399184", driverPhone: "984729842", licenseNumber: "9356396529732",dieselLevel: 20,dieselCapacity: 90,adBlueCapacity: 80),
            Truck(id: "KA02HG1286", registrationNumber: "MAT788052P7C06677", status: "Running", speed: 20, fuelLevel: 90,adBlueLevel: 20,lastLocation: "Location XYZ", lastUpdated: "14:45:00, 13 Dec 23", distanceToService: "270 km", hoursToService: "5 hours",distanceToServiceStatus:"Overdue",hoursToServiceStatus:"Overdue",tripAFuelEfficiencyKM: "12 kmpl",tripBFuelEfficiencyKM: "12",tripAFuelEfficiencykmpl: "12 kmpl",tripBFuelEfficiencykmpl: "12 kmpl",engineTemperature:"24°C",outsideTemperature: "24°C",issues: ["Def Tank Level Warning", "Engine Torque Reduction"],faults: ["P203C", "P20E8"],driverName: "Guljule Singh", driverId: "DR988399184", driverPhone: "984729842", licenseNumber: "9356396529732",dieselLevel: 20,dieselCapacity: 90,adBlueCapacity: 80),
            Truck(id: "KA02HG1285", registrationNumber: "MAT788052P7C06678", status: "idle", speed: 20, fuelLevel: 90,adBlueLevel: 20,lastLocation: "Location XYZ", lastUpdated: "14:45:00, 13 Dec 23", distanceToService: "270 km", hoursToService: "5 hours",distanceToServiceStatus:"Overdue",hoursToServiceStatus:"Overdue",tripAFuelEfficiencyKM: "12 kmpl",tripBFuelEfficiencyKM: "12",tripAFuelEfficiencykmpl: "12 kmpl",tripBFuelEfficiencykmpl: "12 kmpl",engineTemperature:"24°C",outsideTemperature: "24°C",issues: ["Def Tank Level Warning", "Engine Torque Reduction"],faults: ["P203C", "P20E8"],driverName: "Guljule Singh", driverId: "DR988399184", driverPhone: "984729842", licenseNumber: "9356396529732",dieselLevel: 20,dieselCapacity: 90,adBlueCapacity: 80),
            Truck(id: "KA02HG1281", registrationNumber: "MAT788052P7C06679", status: "halt", speed: 20, fuelLevel: 90,adBlueLevel: 20,lastLocation: "Location XYZ", lastUpdated: "14:45:00, 13 Dec 23", distanceToService: "270 km", hoursToService: "5 hours",distanceToServiceStatus:"Overdue",hoursToServiceStatus:"Overdue",tripAFuelEfficiencyKM: "12 kmpl",tripBFuelEfficiencyKM: "12",tripAFuelEfficiencykmpl: "12 kmpl",tripBFuelEfficiencykmpl: "12 kmpl",engineTemperature:"24°C",outsideTemperature: "24°C",issues: ["Def Tank Level Warning", "Engine Torque Reduction"],faults: ["P203C", "P20E8"],driverName: "Guljule Singh", driverId: "DR988399184", driverPhone: "984729842", licenseNumber: "9356396529732",dieselLevel: 20,dieselCapacity: 90,adBlueCapacity: 80)
              // Add more vehicles as needed
          ]
          tableView.reloadData()
      }
    
    // MARK: - TableView DataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        let numOfSections = trucks.count+2
        print("numOfSections : \(numOfSections)")
        return numOfSections // Assuming one item per section
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear // Make header background clear to create spacing effect
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "StatusViewTableViewCell", for: indexPath) as! StatusViewTableViewCell
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchViewTableViewCell", for: indexPath) as! SearchViewTableViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TruckCell", for: indexPath) as! TruckTableViewCell
            let truck = trucks[indexPath.section-2]
            cell.configure(with: truck) // Custom method to configure cell content
            return cell
        }
    }
    
    // MARK: - TableView Delegate Methods

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section > 1{
            let truck = trucks[indexPath.section-2]
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let detailVC = storyboard.instantiateViewController(withIdentifier: "TruckSubDetailViewController") as? TruckSubDetailViewController {
                detailVC.truck = truck
                navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
}
