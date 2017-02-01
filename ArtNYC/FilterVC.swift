//
//  FilterVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/24/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class FilterVC: UIViewController, FilterViewDelegate {
    
    var filterView: FilterView!
    var dismissButton: UIButton!
    var store = MuseumDataStore.sharedInstance
    var museumListVC = MuseumListVC()
    
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
            self.filterView.interiorViewSwitch.setOn(true, animated: true)
            store.filteredMuseums = []
            for museum in store.allMuseums {
                if museum.interiorMapView == true {
                    store.filteredMuseums.append(museum)
                }
            }
            print(store.filteredMuseums.count)
            
        case false:
            store.filteredMuseums = []
            print(store.filteredMuseums.count)
        }
    }
}
