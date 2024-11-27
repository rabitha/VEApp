//
//  CustomTabBarController.swift
//  VEApp
//
//  Created by Rabitha N. on 12/11/24.
//

import Foundation
import UIKit

// Custom TabBar class to override size and appearance
class CustomTabBar: UITabBar {
    private let customHeight: CGFloat = 80 // Set your desired height

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = customHeight // Custom height for tab bar
        return sizeThatFits
    }
}


class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set tab bar background color
        tabBar.barTintColor = UIColor.white
        
        // Set selected item color
        tabBar.tintColor = UIColor.systemBlue
        
        // Set unselected item color
        tabBar.unselectedItemTintColor = UIColor.gray
        
        // Apply corner radius
        customizeTabBarAppearance()
        
        // Optional: Add top line
        addTopLineToTabBar()
    }
    
    private func customizeTabBarAppearance() {
        // Set corner radius
        tabBar.layer.cornerRadius = 12
        tabBar.layer.masksToBounds = true
        
        // Adjust the position of the tab bar if needed
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Top left and top right corners
        tabBar.clipsToBounds = true
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
    
    // Adjust tab bar height and corner radius in viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Adjust the tab bar height
        var tabBarFrame = tabBar.frame
        tabBarFrame.size.height = 100 // Set your desired height
        tabBarFrame.origin.y = view.frame.size.height - 100 // Ensure it's positioned at the bottom
        tabBar.frame = tabBarFrame
        
        // Set the corner radius for the tab bar
        tabBar.layer.cornerRadius = 12
        tabBar.layer.masksToBounds = true
    }
    
}
