//
//  TruckSubDetailViewController.swift
//  VEApp
//
//  Created by Rabitha N. on 12/11/24.
//

import UIKit
import Foundation

protocol TruckSubDetailsTableViewCellDelegate: AnyObject {
    func didTapDetailsButton(truck: Truck)
}

class TruckSubDetailViewController: BaseVC, UITableViewDelegate, UITableViewDataSource,TruckSubDetailsTableViewCellDelegate {
    var truck: Truck?
    var trucks: [Truck] = []
    
    @IBOutlet weak var subTableview: UITableView!    
    @IBOutlet weak var registrationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var fuelLevelLabel: UILabel!
    @IBOutlet weak var adBlueLevelLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
            // Set up the table view
        subTableview.delegate = self
        subTableview.dataSource = self
        subTableview.register(UINib(nibName: "TruckSubDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "TruckSubDetailsTableViewCell")
        subTableview.register(UINib(nibName: "StatusViewTableViewCell", bundle: nil), forCellReuseIdentifier: "StatusViewTableViewCell")
        subTableview.register(UINib(nibName: "SearchViewTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchViewTableViewCell")
            // Set up the table view to use automatic row heights
        subTableview.rowHeight = UITableView.automaticDimension
        subTableview.estimatedRowHeight = 80
        subTableview.separatorStyle = .none
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subTableview.backgroundColor = .clear
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "TruckSubDetailsTableViewCell", for: indexPath) as! TruckSubDetailsTableViewCell
            if let trucks = truck {
                cell.truck = truck
                cell.delegate = self
                cell.configure(with: truck!) // Custom method to configure cell content
            }
            return cell
        }
    }
    
    // MARK: - TableView Delegate Methods

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section > 1{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let inDepthDetailVC = storyboard.instantiateViewController(withIdentifier: "TruckInDepthDetailViewController") as? TruckInDepthDetailViewController {
                    inDepthDetailVC.truck = truck
                    inDepthDetailVC.trucks = trucks
                    navigationController?.pushViewController(inDepthDetailVC, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func didTapDetailsButton(truck: Truck) {
        print("Details button tapped for truck: \(truck.lastLocation), status: \(truck.status)")
        
        // Navigate to a new screen or perform desired action
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let inDepthDetailVC = storyboard.instantiateViewController(withIdentifier: "TruckInDepthDetailViewController") as? TruckInDepthDetailViewController {
            inDepthDetailVC.truck = truck
            inDepthDetailVC.trucks = trucks
            navigationController?.pushViewController(inDepthDetailVC, animated: true)
        }
    }
}
