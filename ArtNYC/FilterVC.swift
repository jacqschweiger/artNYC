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
    }
    
    override func loadView(){
        self.filterView = FilterView()
        self.view = self.filterView
        
    }
    
    
    
}
