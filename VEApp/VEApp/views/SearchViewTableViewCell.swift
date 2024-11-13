//
//  SearchViewTableViewCell.swift
//  VEApp
//
//  Created by Rabitha N. on 13/11/24.
//

import UIKit

class SearchViewTableViewCell: UITableViewCell,UISearchBarDelegate, UIPickerViewDelegate, UIPickerViewDataSource {    
    
    @IBOutlet weak var searchView: UIView!
        // UI Elements
        var searchBar: UISearchBar!
        var vehiclePicker: UIPickerView!
        var submitButton: UIButton!
        
        // Data
        let vehicles = ["Car", "Truck", "Motorcycle", "Bicycle", "Bus"]
        var selectedVehicle: String?

        override func awakeFromNib() {
            super.awakeFromNib()

            // Setup the view's background color
            searchView.backgroundColor = .white
            
            // 1. Setup the Search Bar
            searchBar = UISearchBar()
            searchBar.placeholder = "Search vehicles"
            searchBar.searchTextField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            searchBar.delegate = self
            searchBar.translatesAutoresizingMaskIntoConstraints = false
            searchView.addSubview(searchBar)

            // Remove top and bottom lines of the search bar
            searchBar.layer.borderWidth = 0
            searchBar.layer.masksToBounds = true

            // Remove the search bar background line
            if let textField = searchBar.value(forKey: "searchField") as? UITextField {
                textField.borderStyle = .none
                textField.backgroundColor = .clear
                
                // Hide the search icon (magnifying glass)
                textField.leftView = nil
            }

            // Optionally, set the background image to be clear for the search bar
            searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)

            // 2. Setup the Picker View (Dropdown)
            vehiclePicker = UIPickerView()
            vehiclePicker.delegate = self
            vehiclePicker.dataSource = self
            vehiclePicker.translatesAutoresizingMaskIntoConstraints = false
            vehiclePicker.isHidden = true  // Initially hidden
            searchView.addSubview(vehiclePicker)

            // 3. Setup the Right Arrow Button
            let rightArrowButton = UIButton(type: .system)
            rightArrowButton.setImage(UIImage(systemName: "arrow.up.circle"), for: .normal)
            rightArrowButton.translatesAutoresizingMaskIntoConstraints = false
            rightArrowButton.addTarget(self, action: #selector(rightArrowTapped), for: .touchUpInside)
            searchBar.addSubview(rightArrowButton)
            

            // Setup Layout Constraints
            NSLayoutConstraint.activate([
                searchBar.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 10),
                searchBar.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 10),
                searchBar.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -40), // Leave space for the arrow button
                searchBar.heightAnchor.constraint(equalToConstant: 40),

                rightArrowButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
                rightArrowButton.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: -10), // Space from the edge
                rightArrowButton.widthAnchor.constraint(equalToConstant: 30),
                rightArrowButton.heightAnchor.constraint(equalToConstant: 30),

                vehiclePicker.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
                vehiclePicker.leadingAnchor.constraint(equalTo: searchView.leadingAnchor),
                vehiclePicker.trailingAnchor.constraint(equalTo: searchView.trailingAnchor),
                vehiclePicker.heightAnchor.constraint(equalToConstant: 150),
                
                // The vehiclePicker should be below the searchBar initially, but hidden
            ])
        }

        // MARK: - Picker View Methods

        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return vehicles.count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return vehicles[row]
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectedVehicle = vehicles[row]
        }

        // MARK: - Search Bar Methods

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            // Here, you can handle search functionality if needed
            print("Searching for: \(searchText)")
        }

        // MARK: - Right Arrow Button Action

        @objc func rightArrowTapped() {
            // Handle the action when the arrow is tapped, e.g., start searching or navigating to another screen
            guard let selectedVehicle = selectedVehicle else {
                print("No vehicle selected")
                return
            }
            
            print("Right arrow tapped with selected vehicle: \(selectedVehicle)")
        }

        // MARK: - Search Field Tap Action

        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            // Hide the keyboard and show the picker view
            searchBar.resignFirstResponder()  // Dismiss the keyboard if it's showing
            vehiclePicker.isHidden = false   // Show the picker view
        }

        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            // Hide the picker view when editing ends
            vehiclePicker.isHidden = true
        }
    }
