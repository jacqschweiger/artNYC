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

class MuseumListVC: UIViewController, MuseumLisViewDelegate {
    
    var museumListView = MuseumListView()
    let store = MuseumDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        museumListView.delegate = self
    }
    
    override func loadView() {
        self.museumListView = MuseumListView(frame: CGRect.zero)
        self.view = self.museumListView
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.isNavigationBarHidden = true
        self.view = museumListView
        
        if store.filteredMuseums.count > 0 {
            self.museumListView.museums = store.filteredMuseums
        } else if store.filteredMuseums.count == 0 {
            self.museumListView.museums = store.allMuseums
        }
    }
    
    func goToDetailView(){
        let detailViewController = DetailVC()
        detailViewController.museum = self.museumListView.selectedMuseum
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func showFilter(){
        let filterController = FilterVC()
        filterController.modalPresentationStyle = .overFullScreen
        filterController.modalTransitionStyle = .crossDissolve
        self.present(filterController, animated: true, completion: nil)
    }
    
}
