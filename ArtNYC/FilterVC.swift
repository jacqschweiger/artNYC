//
//  FilterVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/24/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class FilterVC: UIViewController {
    
    var filterView: FilterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.filterView = FilterView()
        self.view = filterView
        
        //self.view.addSubview(filterView)
        
//        self.filterView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 200).isActive = true
//        self.filterView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 300).isActive = true
//        self.view.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
