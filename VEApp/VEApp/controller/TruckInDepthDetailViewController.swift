//
//  TruckInDepthDetailViewController.swift
//  VEApp
//
//  Created by Rabitha N. on 12/11/24.
//

import Foundation
import UIKit

class TruckInDepthDetailViewController: BaseVC,UITableViewDataSource,UITableViewDelegate {
    var truck: Truck?
    var trucks: [Truck] = []
    @IBOutlet weak var tblviewInDepthDetails: UITableView!
    
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
        self.navigationItem.hidesBackButton = true
        tblviewInDepthDetails.delegate = self
        tblviewInDepthDetails.dataSource = self
        tblviewInDepthDetails.register(UINib(nibName: "TruckInDepthTableViewCell", bundle: nil), forCellReuseIdentifier: "TruckInDepthTableViewCell")
        tblviewInDepthDetails.register(UINib(nibName: "StatusViewTableViewCell", bundle: nil), forCellReuseIdentifier: "StatusViewTableViewCell")
        tblviewInDepthDetails.register(UINib(nibName: "SearchViewTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchViewTableViewCell")
            // Set up the table view to use automatic row heights
        tblviewInDepthDetails.rowHeight = UITableView.automaticDimension
        tblviewInDepthDetails.estimatedRowHeight = 80
        tblviewInDepthDetails.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tblviewInDepthDetails.backgroundColor = .clear
    }
    
    // MARK: - TableView DataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        let numOfSections = 3
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
            cell.runningStatus = getCountByStatus(status: "Running",trucks: trucks)
            cell.idleStatus = getCountByStatus(status: "idle",trucks: trucks)
            cell.stoppedStatus = getCountByStatus(status: "halt",trucks: trucks)
            cell.offlineStatus = getCountByStatus(status: "offline",trucks: trucks)
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchViewTableViewCell", for: indexPath) as! SearchViewTableViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TruckInDepthTableViewCell", for: indexPath) as! TruckInDepthTableViewCell
            if let trucks = truck {
                cell.truck = truck
                cell.configure(with: truck!) // Custom method to configure cell content
            }
            return cell
        }
    }
    
    // MARK: - TableView Delegate Methods

   /* func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section > 1{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let inDepthDetailVC = storyboard.instantiateViewController(withIdentifier: "TruckInDepthDetailViewController") as? TruckInDepthDetailViewController {
                    inDepthDetailVC.truck = truck
                navigationController?.pushViewController(inDepthDetailVC, animated: true)
            }
        }
    }*/
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
}
