//
//  TruckInDepthTableViewCell.swift
//  VEApp
//
//  Created by Rabitha N. on 19/11/24.
//

import UIKit

class TruckInDepthTableViewCell: UITableViewCell {
    var truck: Truck?
    
    var shapeLayer1: CAShapeLayer!
    var shapeLayer2: CAShapeLayer!
    var circularPath1: UIBezierPath!
    var circularPath2: UIBezierPath!
    
    @IBOutlet weak var truckInDepthDetailsView: UIView!
    @IBOutlet weak var leftLabelView: UIView!    
    @IBOutlet weak var lftLblText: UILabel!
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
        
        lftLblText.text = "Major Issues"
        // Calculate text size and update constraints dynamically
        let textSize = lftLblText.text?.size(withAttributes: [.font: lftLblText.font!]) ?? .zero
        print("textSize = ",textSize)
        lftLblText.widthAnchor.constraint(equalToConstant: textSize.height).isActive = true
        lftLblText.heightAnchor.constraint(equalToConstant: textSize.width).isActive = true
        lftLblText.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2) // Rotate counterclockwise
        lftLblText.textColor = .blue //UIColor(red: 250.0, green: 110.0, blue: 243.0, alpha: 1.0)
        
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
            r1.textColor = UIColor.blue
        }
        r2.text = truck.hoursToServiceStatus
        if truck.hoursToServiceStatus == "Overdue"{
            r2.textColor = UIColor.red
        }else{
            r2.textColor = UIColor.blue
        }
        r3.text = truck.tripAFuelEfficiencykmpl
        r4.text = truck.tripBFuelEfficiencykmpl
        
        faultCount.text = String(truck.faults.count)
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
        
        // Add sections to the main stack view
        let faultsStackView = createFaultsView(truck: truck)
        mainStackView.addArrangedSubview(faultsStackView)
        
        // Add sections to the main stack view
        let faultsDetailsStackView = createFaultsDetailsView(truck: truck)
        faultsDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(faultsDetailsStackView)
        
        let otherIssuesStackView = createOtherIssuesView(truck: truck)
        mainStackView.addArrangedSubview(otherIssuesStackView)
        
        // Create a dark line as a separator
        let separatorLine = UIView()
        separatorLine.backgroundColor = .darkGray // Set your preferred color
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true // Set line height
        mainStackView.addArrangedSubview(separatorLine)
                
        let issuesStackView = createIssuesView(truck: truck)
        mainStackView.addArrangedSubview(issuesStackView)
        
        // Create a dark line as a separator
        let separationLine = UIView()
        separationLine.backgroundColor = .darkGray // Set your preferred color
        separationLine.heightAnchor.constraint(equalToConstant: 1).isActive = true // Set line height
        mainStackView.addArrangedSubview(separationLine)
        
        let driverDetailsStackView = createDriverDetailsView(truck: truck)
        mainStackView.addArrangedSubview(driverDetailsStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: faultListView.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: faultListView.trailingAnchor, constant: -10),
            mainStackView.topAnchor.constraint(equalTo: faultListView.safeAreaLayoutGuide.topAnchor, constant: 5),
            mainStackView.bottomAnchor.constraint(equalTo: faultListView.safeAreaLayoutGuide.bottomAnchor, constant: 0) // Ensure bottom constraint
        ])
    }
    
    // MARK: - Helper Methods
    func createFaultsView(truck: Truck) -> UIStackView {
        let faultsStackView = UIStackView()
        faultsStackView.axis = .vertical
        faultsStackView.alignment = .leading
        faultsStackView.spacing = 8
        faultsStackView.distribution = .fill // Allows dynamic height adjustment

        for (text1, text2) in truck.faults {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 8
            rowStackView.alignment = .leading
            rowStackView.distribution = .fill

            let label1 = UILabel()
            label1.text = text1
            label1.font = .systemFont(ofSize: 12)
            label1.numberOfLines = 0 // Multi-line support
            label1.setContentHuggingPriority(.defaultLow, for: .horizontal)
            label1.setContentCompressionResistancePriority(.required, for: .horizontal)
            rowStackView.addArrangedSubview(label1)

            let label2 = UILabel()
            label2.text = text2
            label2.font = .systemFont(ofSize: 12)
            label2.textAlignment = .right
            label2.numberOfLines = 0
            label2.setContentHuggingPriority(.defaultLow, for: .horizontal)
            label2.setContentCompressionResistancePriority(.required, for: .horizontal)
            rowStackView.addArrangedSubview(label2)

            faultsStackView.addArrangedSubview(rowStackView)
        }
        return faultsStackView
    }
    
    func createFaultsDetailsView(truck: Truck) -> UIStackView {
        // Parent vertical stack view to hold all rows
        let parentStackView = UIStackView()
        parentStackView.axis = .vertical
        parentStackView.alignment = .fill
        parentStackView.distribution = .fill
        parentStackView.spacing = 8 // Adjust spacing between rows
        
        for (detailMessage1, detailMessage2) in truck.detailsOfFaults {
            // Create a horizontal stack view for each row
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.alignment = .top // Ensures proper alignment for multi-line labels
            rowStackView.distribution = .fill
            rowStackView.spacing = 8

            let levelInfo = UILabel()
            levelInfo.text = detailMessage1
            levelInfo.font = .systemFont(ofSize: 12)
            levelInfo.lineBreakMode = .byWordWrapping
            levelInfo.numberOfLines = 0 // Enable multi-line
            levelInfo.setContentHuggingPriority(.required, for: .horizontal)
            levelInfo.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            rowStackView.addArrangedSubview(levelInfo)

            let levelInfo2 = UILabel()
            levelInfo2.text = detailMessage2
            levelInfo2.font = .systemFont(ofSize: 12)
            levelInfo2.numberOfLines = 0 // Enable multi-line
            levelInfo2.lineBreakMode = .byWordWrapping
            levelInfo2.textAlignment = .right
            levelInfo2.textColor = .red
            levelInfo2.setContentHuggingPriority(.required, for: .horizontal)
            levelInfo2.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            rowStackView.addArrangedSubview(levelInfo2)
            
            parentStackView.addArrangedSubview(rowStackView)
        }
        return parentStackView
    }

    
    func createOtherIssuesView(truck: Truck) -> UIStackView {
        // Create a horizontal stack for the row
        let rowStackView = UIStackView()
        rowStackView.axis = .horizontal
        rowStackView.spacing = 8
        rowStackView.alignment = .center
        rowStackView.distribution = .fill
        
        let issuesLabel = UILabel()
        issuesLabel.text = "Other Issues: "
        issuesLabel.font = .systemFont(ofSize: 12)
        issuesLabel.textAlignment = .left
        rowStackView.addArrangedSubview(issuesLabel)
        
        let issuesLabelCount = UILabel()
        issuesLabelCount.text = String(truck.otherIssues.count)
        issuesLabelCount.font = .systemFont(ofSize: 12)
        issuesLabelCount.textAlignment = .right
        rowStackView.addArrangedSubview(issuesLabelCount)
        
        return rowStackView
    }
    
    func createIssuesView(truck: Truck) -> UIStackView {
        let issuesStackView = UIStackView()
        issuesStackView.axis = .horizontal
        issuesStackView.alignment = .center
        issuesStackView.spacing = 8

        for (issueKey,issueText) in truck.otherIssues {
            // Create a vertical stack for each issue
            let issueContainer = UIStackView()
            issueContainer.axis = .vertical
            issueContainer.alignment = .center
            issueContainer.spacing = 4 // Space between the box and the label

            // Create the box (issueIcon)
            let issueIcon = UIView()
            issueIcon.backgroundColor = .systemGray5
            issueIcon.layer.cornerRadius = 12
            issueIcon.layer.borderWidth = 1.0
            issueIcon.layer.borderColor = UIColor.red.cgColor
            issueIcon.widthAnchor.constraint(equalToConstant: 50).isActive = true
            issueIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true

            // Create the label
            let issueLabel = UILabel()
            issueLabel.text = issueKey 
            issueLabel.font = .systemFont(ofSize: 12)
            issueLabel.textAlignment = .center
            issueLabel.textColor = .darkGray
            issueLabel.numberOfLines = 0 // Supports wrapping for long text

            // Add the box and label to the vertical stack
            issueContainer.addArrangedSubview(issueIcon)
            issueContainer.addArrangedSubview(issueLabel)

            // Add the vertical stack to the horizontal stack
            issuesStackView.addArrangedSubview(issueContainer)
        }

        return issuesStackView
    }

    
    func createDriverDetailsView(truck: Truck) -> UIStackView {
        let driverDetailsStackView = UIStackView()
        driverDetailsStackView.axis = .vertical
        driverDetailsStackView.alignment = .leading
        driverDetailsStackView.spacing = 8

        for (detailMessage3, detailMessage4) in truck.driverDetails {
            // Create a horizontal stack for the row
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 10
            rowStackView.alignment = .center // Ensures alignment of both labels
            rowStackView.distribution = .fill

            // Label for the first detail
            let labelDetail1 = UILabel()
            labelDetail1.text = detailMessage3
            labelDetail1.font = .systemFont(ofSize: 12)
            labelDetail1.numberOfLines = 0
            labelDetail1.setContentHuggingPriority(.defaultHigh, for: .horizontal) // Prevent unnecessary stretching
            labelDetail1.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal) // Prevent truncation
            rowStackView.addArrangedSubview(labelDetail1)

            // Spacer to push labelDetail2 to the right
            let spacer = UIView()
            spacer.setContentHuggingPriority(.required, for: .horizontal) // Allow it to expand
            rowStackView.addArrangedSubview(spacer)

            // Label for the second detail
            let labelDetail2 = UILabel()
            labelDetail2.text = detailMessage4
            labelDetail2.font = .systemFont(ofSize: 12)
            labelDetail2.textColor = UIColor.blue
            labelDetail2.numberOfLines = 0
            labelDetail2.textAlignment = .right
            labelDetail2.setContentHuggingPriority(.defaultHigh, for: .horizontal) // Prevent unnecessary stretching
            labelDetail2.setContentCompressionResistancePriority(.required, for: .horizontal) // Prevent truncation
            rowStackView.addArrangedSubview(labelDetail2)

            // Add the row stack to the main stack
            driverDetailsStackView.addArrangedSubview(rowStackView)
        }
        return driverDetailsStackView
    }

    
}
