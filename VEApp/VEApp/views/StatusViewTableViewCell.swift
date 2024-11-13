//
//  StatusViewTableViewCell.swift
//  VEApp
//
//  Created by Rabitha N. on 13/11/24.
//

import UIKit

class StatusViewTableViewCell: UITableViewCell {

    @IBOutlet weak var statusView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStatusView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setupStatusView() {
        // Background color for the view
        statusView.backgroundColor = .white
        statusView.layer.cornerRadius = 10
        
        // Create a horizontal stack view to hold the status items
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        statusView.addSubview(stackView)
        
        // Constraints for the stack view inside the container
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: statusView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: statusView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: statusView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: statusView.bottomAnchor)
        ])
        
        // Add each status item to the stack view
        stackView.addArrangedSubview(createStatusItem(number: "10", text: "Running", color: .systemGreen))
        stackView.addArrangedSubview(createStatusItem(number: "5", text: "Idle", color: .systemYellow))
        stackView.addArrangedSubview(createStatusItem(number: "3", text: "Stopped", color: .systemRed))
        stackView.addArrangedSubview(createStatusItem(number: "2", text: "Offline", color: .black))
    }
    
    private func createStatusItem(number: String, text: String, color: UIColor) -> UIView {
        let container = UIView()
        container.layer.cornerRadius = 10
        
        // Number label
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        numberLabel.textColor = color
        numberLabel.textAlignment = .center
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(numberLabel)
        
        // Text label
        let textLabel = UILabel()
        textLabel.text = text
        textLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textLabel.textColor = .darkGray
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(textLabel)
        
        // Stack the number label on top of the text label
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            numberLabel.topAnchor.constraint(equalTo: container.topAnchor),
            textLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 4),
            textLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        return container
    }
}
