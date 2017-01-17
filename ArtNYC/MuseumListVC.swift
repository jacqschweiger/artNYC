//
//  MuseumListVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/14/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import NotificationCenter

class MuseumListVC: UIViewController, MuseumListDelegate {

    let museumListView = MuseumListView()
    var store = MuseumDataStore.sharedInstance
    weak var delegate: MuseumListDelegate?
    var selectedMuseum: Museum?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.loadMuseums()
        museumListView.delegate = self
        self.reloadInputViews()
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.topItem?.title = "Art Museums NYC"
    }
    
    override func loadView() {
        self.view = museumListView
    }
    
    func showMap(){
        let mapViewController = MapVC()
        navigationController?.pushViewController(mapViewController, animated: false)
    }
    
    func goToDetailView(){
        let detailViewController = DetailVC()
        navigationController?.pushViewController(detailViewController, animated: false)
    }

    
    
    // TODO: create filter/sort menu and functions: sort by alpha; filter by museums with free admission, google street view interiors, art category
    
    func sortAZ(){
        store.museums.sort { (museum1, museum2) -> Bool in
            return museum1.title! < museum2.title!
        }
        museumListView.reloadInputViews()
    }
    
    func sortZA(){
        store.museums.sort { (museum1, museum2) -> Bool in
            return museum1.title! > museum2.title!
        }
        
        museumListView.reloadInputViews()
    }
    
    
    
}
