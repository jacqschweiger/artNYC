//
//  FilterVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/24/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class FilterVC: UIViewController, DismissDelegate {
    
    var filterView: FilterView!
    var dismissButton: UIButton!
    var store = MuseumDataStore.sharedInstance
    var museumListView = MuseumListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.filterView = FilterView()
        self.view = filterView
        self.filterView.delegate = self 
        
        self.filterView.interiorViewSwitch.addTarget(self, action: #selector(filterMuseums), for: UIControlEvents.valueChanged)
        
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
    
    func filterMuseums(){
        switch self.filterView.interiorViewSwitch.isOn {
        case true:
            for museum in store.allMuseums {
                if museum.interiorMapView == true {
                    store.filteredMuseums.append(museum)
                }
            }
            print(store.filteredMuseums.count)
            museumListView.reloadInputViews()
        case false:
            store.filteredMuseums = []
            museumListView.reloadInputViews()
            print(store.filteredMuseums.count)
        }
    }
}
