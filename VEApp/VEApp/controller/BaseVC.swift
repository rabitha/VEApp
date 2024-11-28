//
//  BaseVC.swift
//  VEApp
//
//  Created by Rabitha N. on 13/11/24.
//

import Foundation
import UIKit
class BaseVC: UIViewController{
        override func viewDidLoad() {
            super.viewDidLoad()
            setupNavBar()
        }
        
        private func setupNavBar() {
            // Set the background color of the view (optional)
         //   view.backgroundColor = UIColor(red: 242.0, green: 242.0, blue: 242.0, alpha: 1.0)
            
            // Create a container view for the custom navigation bar
            let navBar = UIView()            
            // Apply corner radius
            navBar.layer.cornerRadius = 12
            navBar.layer.masksToBounds = true
            navBar.backgroundColor = UIColor.systemPurple
            navBar.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(navBar)
            
            // Add constraints for the navigation bar
            NSLayoutConstraint.activate([
                navBar.topAnchor.constraint(equalTo: view.topAnchor),
                navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                navBar.heightAnchor.constraint(equalToConstant: 100) // Adjust height if necessary
            ])
            
            // Add the label for the title
            let titleLabel = UILabel()
            titleLabel.text = "Tracksphere"
            titleLabel.textAlignment = .left
            titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            titleLabel.textColor = .white
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            navBar.addSubview(titleLabel)
            
            // Create the menu icon (left side)
            let menuButton = UIButton()
            menuButton.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
            menuButton.tintColor = .white
            menuButton.translatesAutoresizingMaskIntoConstraints = false
            navBar.addSubview(menuButton)
            
            // Create the search icon (right side)
            let searchButton = UIButton()
            searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            searchButton.tintColor = .white
            searchButton.translatesAutoresizingMaskIntoConstraints = false
            navBar.addSubview(searchButton)
            
            // Create the notification icon (right side)
            let notificationButton = UIButton()
            notificationButton.setImage(UIImage(systemName: "bell"), for: .normal)
            notificationButton.tintColor = .white
            notificationButton.translatesAutoresizingMaskIntoConstraints = false
            navBar.addSubview(notificationButton)
            
            // Add constraints for the menu button
            NSLayoutConstraint.activate([
                menuButton.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 16),
                menuButton.centerYAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -30)
            ])
            
            // Add constraints for the title label
            NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -30)
            ])
            
            // Add constraints for the search button
            NSLayoutConstraint.activate([
                searchButton.trailingAnchor.constraint(equalTo: notificationButton.leadingAnchor, constant: -16),
                searchButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
            ])
            
            // Add constraints for the notification button
            NSLayoutConstraint.activate([
                notificationButton.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -16),
                notificationButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
            ])
        }
    
    func getCountByStatus(status:String,trucks:[Truck])->Int{
        // Filter non-nil trucks with status
        let runningTrucks = trucks.compactMap { $0 }.filter { $0.status == status }
        // Get the count of trucks
        let runningTruckCount = runningTrucks.count
        return runningTruckCount
    }
       
    }
