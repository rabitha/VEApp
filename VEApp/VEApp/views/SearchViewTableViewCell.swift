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
        var searchField: UITextField!
        var vehiclePicker: UIPickerView!
        var submitButton: UIButton!
        
        // Data
        let vehicles = ["Car", "Truck", "Motorcycle", "Bicycle", "Bus"]
        var selectedVehicle: String?

        override func awakeFromNib() {
            super.awakeFromNib()

            // Setup the view's background color
            searchView.backgroundColor = .clear
            searchView.layer.cornerRadius = 10
            print(searchView.layer.frame)
            
            // 1. Setup the Search Field
            searchField = UITextField()
            searchField.placeholder = "Search vehicles"
            searchField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            searchField.borderStyle = .none
            searchField.backgroundColor = .white
            searchField.layer.cornerRadius = 5
            searchField.layer.masksToBounds = true
            searchField.translatesAutoresizingMaskIntoConstraints = false
            searchField.addTarget(self, action: #selector(searchFieldDidBeginEditing), for: .editingDidBegin)
            searchField.addTarget(self, action: #selector(searchFieldDidEndEditing), for: .editingDidEnd)
            searchField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            searchView.addSubview(searchField)
            
            // 2. Add a Right Arrow Button to the Search Field
            let rightArrowButton = UIButton(type: .system)
            rightArrowButton.setImage(UIImage(systemName: "arrow.up"), for: .normal)
            rightArrowButton.translatesAutoresizingMaskIntoConstraints = false
            rightArrowButton.backgroundColor = .white
            rightArrowButton.tintColor = .black
            rightArrowButton.addTarget(self, action: #selector(rightArrowTapped), for: .touchUpInside)
            searchView.addSubview(rightArrowButton)
            
            // 3. Setup the Picker View (Dropdown)
            vehiclePicker = UIPickerView()
            vehiclePicker.delegate = self
            vehiclePicker.dataSource = self
            vehiclePicker.translatesAutoresizingMaskIntoConstraints = false
            vehiclePicker.isHidden = true  // Initially hidden
            searchView.addSubview(vehiclePicker)
            
            // Setup Layout Constraints
            NSLayoutConstraint.activate([
                searchField.topAnchor.constraint(equalTo: searchView.topAnchor),
                searchField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor),
                searchField.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -60), // Leave space for the arrow button
                searchField.heightAnchor.constraint(equalToConstant: 40),
                
                rightArrowButton.centerYAnchor.constraint(equalTo: searchField.centerYAnchor),
                rightArrowButton.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -10), // Space from the edge
                rightArrowButton.widthAnchor.constraint(equalToConstant: 25),
                rightArrowButton.heightAnchor.constraint(equalToConstant: 25),
                rightArrowButton.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -10),
                
                vehiclePicker.topAnchor.constraint(equalTo: searchField.bottomAnchor),
                vehiclePicker.leadingAnchor.constraint(equalTo: searchView.leadingAnchor),
                vehiclePicker.trailingAnchor.constraint(equalTo: searchView.trailingAnchor),
                vehiclePicker.heightAnchor.constraint(equalToConstant: 150)
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
        
        // MARK: - Search Field Actions

        @objc func searchFieldDidBeginEditing() {
            // Hide the keyboard and show the picker view
            searchField.resignFirstResponder()  // Dismiss the keyboard if it's showing
            vehiclePicker.isHidden = false     // Show the picker view
        }
        
        @objc func searchFieldDidEndEditing() {
            // Hide the picker view when editing ends
            vehiclePicker.isHidden = true
        }
        
        @objc func textFieldDidChange() {
            // Handle text changes
            print("Searching for: \(searchField.text ?? "")")
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
    }
