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
    var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.filterView = FilterView()
        self.view = filterView
        
        dismissButton = UIButton(type: .system)
        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        dismissButton.backgroundColor = UIColor.clear
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.insertSubview(dismissButton, belowSubview: filterView)
        self.view.sendSubview(toBack: dismissButton)
        
        dismissButton.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        dismissButton.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        dismissButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    }
    
    func dismissView(){
        dismiss(animated: true, completion: nil)

    }
}
