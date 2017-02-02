//
//  FilterVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/24/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit



protocol ReloadDelegate: class {
    func reloadTableView()
}

class FilterVC: UIViewController, FilterViewDelegate {
    
    var filterView: FilterView!
    var dismissButton: UIButton!
    var store = MuseumDataStore.sharedInstance
    var delegate: ReloadDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = UIColor.white
        self.filterView = FilterView()
        self.view = filterView
        self.filterView.delegate = self
    }
    
    func dismissView(){
        dismiss(animated: true, completion: nil)
    }
    
    func filterMuseums(){
        switch self.filterView.interiorViewSwitch.isOn {
        case true:
            store.interiorViewSwitchIsOn = true
            store.filteredMuseums = []
            for museum in store.allMuseums {
                if museum.interiorMapView == true {
                    store.filteredMuseums.append(museum)
                }
            }

        case false:
            store.interiorViewSwitchIsOn = false
            store.filteredMuseums = []

        }
    }
    
}
