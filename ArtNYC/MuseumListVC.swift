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

class MuseumListVC: UIViewController, ShowDetailViewDelegate {
    
    let museumListView = MuseumListView()
    var store = MuseumDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.loadMuseums()
        museumListView.delegate = self
        
        self.reloadInputViews()
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func loadView() {
        self.view = museumListView
    }
    
    func goToDetailView(){
        let detailViewController = DetailVC()
        detailViewController.museum = self.museumListView.selectedMuseum
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
