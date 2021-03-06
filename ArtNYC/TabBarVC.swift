//
//  TabBarVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/25/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let tabOne = MuseumVC()
        let tabOneBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Home Icon"), selectedImage: UIImage(named: "Home Icon"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        // Create Tab two
        let tabTwo = MapVC()
        let tabTwoBarItem2 = UITabBarItem(title: "Map", image: UIImage(named: "Compass Icon"), selectedImage: UIImage(named: "Compass Icon"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // Create Tab three

        let tabThree = FreeTodayVC()
        let tabThreeBarItem = UITabBarItem(title: "Free Today", image: UIImage(named: "$"), selectedImage: UIImage(named: "$"))
        
        tabThree.tabBarItem = tabThreeBarItem
        
        self.viewControllers = [tabOne, tabTwo, tabThree]
        
        self.tabBar.barTintColor = UIColor(named: UIColor.ColorName.turquoise)
        self.tabBar.tintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor.gray
    
    }
    

}


