//
//  TruckSubDetailViewController.swift
//  VEApp
//
//  Created by Rabitha N. on 12/11/24.
//

class TruckSubDetailViewController: UIViewController {

    var truck: Truck

    init(truck: Truck) {
        self.truck = truck
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = truck.truckName

        let speedLabel = UILabel()
        speedLabel.text = "Speed: \(truck.speedKmh) km/h"
        speedLabel.textAlignment = .center
        speedLabel.frame = CGRect(x: 20, y: 100, width: self.view.frame.width - 40, height: 50)
        self.view.addSubview(speedLabel)
    }
}
