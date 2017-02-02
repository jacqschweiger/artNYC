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

class MuseumListVC: UIViewController, ShowDetailViewDelegate, ReloadDelegate {
    
    let museumListView = MuseumListView()
    let filterVC = FilterVC()
    let store = MuseumDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        museumListView.delegate = self
        filterVC.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.isNavigationBarHidden = true
        print("Calling viewwillappear")
        if store.filteredMuseums.count > 0 {
            self.museumListView.museums = store.filteredMuseums
        } else if store.filteredMuseums.count == 0 {
            self.museumListView.museums = store.allMuseums
        }
    }
    
    override func loadView() {
        self.view = museumListView
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
    
    func reloadTableView() {
        //self.museumListView.reloadInputViews()
    }
    
}
