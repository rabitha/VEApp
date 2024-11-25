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
    
    @IBOutlet weak var faultCount: UILabel!
    @IBOutlet weak var faultListView: UIView!
    
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
        rightLbl3.text = truck.tripAFuelEfficiencyKM
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
        if truck.distanceToServiceStatus == "Overdue"{
            r1.textColor = UIColor.red
        }else{
            r1.textColor = UIColor.green
        }
        r2.text = truck.hoursToServiceStatus
        if truck.hoursToServiceStatus == "Overdue"{
            r2.textColor = UIColor.red
        }else{
            r2.textColor = UIColor.green
        }
        r3.text = truck.tripAFuelEfficiencykmpl
        r4.text = truck.tripBFuelEfficiencykmpl
        
        faultCount.text = String(truck.faults.count)
        setupUI()
       /* // Create and configure the parent stack view
        let parentStackView = UIStackView()
        parentStackView.axis = .vertical
        parentStackView.spacing = 10
        parentStackView.alignment = .fill
        parentStackView.distribution = .fillEqually
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the parent stack view to the main view
        faultListView.addSubview(parentStackView)
        NSLayoutConstraint.activate([
            parentStackView.leadingAnchor.constraint(equalTo: faultListView.leadingAnchor, constant: 16),
            parentStackView.trailingAnchor.constraint(equalTo: faultListView.trailingAnchor, constant: -16),
            parentStackView.topAnchor.constraint(equalTo: faultListView.safeAreaLayoutGuide.topAnchor, constant: 16),
            parentStackView.bottomAnchor.constraint(equalTo: faultListView.safeAreaLayoutGuide.bottomAnchor, constant: -16) // Bottom constraint
        ])

        // Add rows dynamically based on API data
        for (text1, text2) in truck.faults {
            // Create a horizontal stack for the row
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 10
            rowStackView.alignment = .center
            rowStackView.distribution = .fill
            
            // Create two labels
            let label1 = UILabel()
            label1.text = text1
            label1.textAlignment = .left
            label1.numberOfLines = 0
            label1.font = UIFont.systemFont(ofSize: 12)
            
            let label2 = UILabel()
            label2.text = text2
            label2.textAlignment = .left
            label2.numberOfLines = 0
            label2.font = UIFont.systemFont(ofSize: 12)
            
            // Add labels to the row stack
            rowStackView.addArrangedSubview(label1)
            rowStackView.addArrangedSubview(label2)
            // Add the row stack to the parent stack
            parentStackView.addArrangedSubview(rowStackView)
        }*/
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
      
    func setupUI() {
        guard let truck = truck else { return } // Ensure truck is not nil
        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 16
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        faultListView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: faultListView.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: faultListView.trailingAnchor, constant: -16),
            mainStackView.topAnchor.constraint(equalTo: faultListView.safeAreaLayoutGuide.topAnchor, constant: 16),
            mainStackView.bottomAnchor.constraint(equalTo: faultListView.safeAreaLayoutGuide.bottomAnchor, constant: -16) // Ensure bottom constraint
        ])
        
        // Add sections to the main stack view
        let faultsStackView = createFaultsView(truck: truck)
        mainStackView.addArrangedSubview(faultsStackView)
        
        let issuesLabel = UILabel()
        issuesLabel.text = "Other Issues: \(truck.otherIssues.count)"
        issuesLabel.font = .boldSystemFont(ofSize: 18)
        mainStackView.addArrangedSubview(issuesLabel)
        
        let issuesStackView = createIssuesView(truck: truck)
        mainStackView.addArrangedSubview(issuesStackView)
        
        let driverDetailsStackView = createDriverDetailsView(truck: truck)
        mainStackView.addArrangedSubview(driverDetailsStackView)
    }
    
    // MARK: - Helper Methods
    
    func createFaultsView(truck: Truck) -> UIStackView {
        let faultsStackView = UIStackView()
        faultsStackView.axis = .vertical
        faultsStackView.alignment = .leading
        faultsStackView.spacing = 8
        
        for (text1, text2) in truck.faults {
            let label = UILabel()
            label.text = text1
            label.font = .systemFont(ofSize: 16)
            faultsStackView.addArrangedSubview(label)
            
            let label2 = UILabel()
            label2.text = text2
            label2.font = .systemFont(ofSize: 16)
            faultsStackView.addArrangedSubview(label2)
        }
        
        for (detailMessage1, detailMessage2) in truck.detailsOfFaults {
            let levelInfo = UILabel()
            levelInfo.text = detailMessage1
            levelInfo.font = .italicSystemFont(ofSize: 14)
            levelInfo.numberOfLines = 0
            faultsStackView.addArrangedSubview(levelInfo)
            
            let levelInfo2 = UILabel()
            levelInfo2.text = detailMessage2
            levelInfo2.font = .italicSystemFont(ofSize: 14)
            levelInfo2.numberOfLines = 0
            faultsStackView.addArrangedSubview(levelInfo2)
        }
        
        return faultsStackView
    }
    
    func createIssuesView(truck: Truck) -> UIStackView {
        let issuesStackView = UIStackView()
        issuesStackView.axis = .horizontal
        issuesStackView.alignment = .center
        issuesStackView.spacing = 8
        
        for _ in 0..<truck.otherIssues.count {
            let issueIcon = UIView()
            issueIcon.backgroundColor = .systemGray5
            issueIcon.layer.cornerRadius = 8
            issueIcon.widthAnchor.constraint(equalToConstant: 50).isActive = true
            issueIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
            issuesStackView.addArrangedSubview(issueIcon)
        }
        
        return issuesStackView
    }
    
    func createDriverDetailsView(truck: Truck) -> UIStackView {
        let driverDetailsStackView = UIStackView()
        driverDetailsStackView.axis = .vertical
        driverDetailsStackView.alignment = .leading
        driverDetailsStackView.spacing = 8
        
        for (detailMessage3, detailMessage4) in truck.driverDetails {
            let labelDetail1 = UILabel()
            labelDetail1.text = detailMessage3
            labelDetail1.font = .systemFont(ofSize: 16)
            driverDetailsStackView.addArrangedSubview(labelDetail1)
            
                let labelDetail2 = UILabel()
                labelDetail2.text = detailMessage4
                labelDetail2.font = .systemFont(ofSize: 16)
                driverDetailsStackView.addArrangedSubview(labelDetail2)
        }
        
        return driverDetailsStackView
    }

}
