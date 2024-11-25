//
//  dataModel.swift
//  VEApp
//
//  Created by Rabitha N. on 12/11/24.
//

struct Truck: Codable {
    let id: String
    let registrationNumber: String
    let status: String
    let speed: Int
    let fuelLevel: Int
    let adBlueLevel: Int
    let lastLocation: String
    let lastUpdated: String
    let distanceToService: String
    let hoursToService: String
    let distanceToServiceStatus: String
    let hoursToServiceStatus: String
    let tripAFuelEfficiencyKM: String
    let tripBFuelEfficiencyKM: String
    let tripAFuelEfficiencykmpl: String
    let tripBFuelEfficiencykmpl: String
    let engineTemperature: String
    let outsideTemperature: String
    let issues: [String]
    let faults: [String:String]
    let detailsOfFaults: [String:String]
    let otherIssues: [String:String]
    let driverDetails:[String:String]
    let dieselLevel: Int
    let dieselCapacity: Int
    let adBlueCapacity: Int
}
