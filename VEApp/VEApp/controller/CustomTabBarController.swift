//
//  CustomTabBarController.swift
//  VEApp
//
//  Created by Rabitha N. on 12/11/24.
//

import Foundation
import UIKit
class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set tab bar background color
        tabBar.barTintColor = UIColor.white

        // Set selected item color
        tabBar.tintColor = UIColor.systemBlue

        // Set unselected item color
        tabBar.unselectedItemTintColor = UIColor.gray
        addTopLineToTabBar()
    }
    
    private func addTopLineToTabBar() {
        // Define line height and color
        let lineHeight: CGFloat = 1.0
        let lineColor = UIColor(red: 228.0 / 255.0, green: 228.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0) // Customize as needed

        // Create the line view
        let lineView = UIView()
        lineView.backgroundColor = lineColor
        lineView.translatesAutoresizingMaskIntoConstraints = false

        // Add line view to the tabBar
        tabBar.addSubview(lineView)

        // Set up Auto Layout constraints
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: tabBar.topAnchor),
            lineView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: lineHeight)
        ])
    }
}
